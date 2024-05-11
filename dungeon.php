<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once('connect.php');

// Fetch all user IDs
$getUsersQuery = "SELECT id FROM users WHERE in_dungeon='0' ORDER BY RAND() LIMIT 3";
$userResult = mysqli_query($conn, $getUsersQuery);
$userIDs = mysqli_fetch_all($userResult, MYSQLI_ASSOC);

// Include the logged-in user
$username = $_GET['username']; // Replace with the logged-in user's username
$password = $_GET['password']; // Replace with the logged-in user's password

// Query to select the logged-in user's ID
$selectLoggedInUserQuery = "SELECT id FROM users WHERE username='$username' AND password='$password' AND in_dungeon='0'";
$loggedInUserResult = mysqli_query($conn, $selectLoggedInUserQuery);
$loggedInUser = mysqli_fetch_assoc($loggedInUserResult);
// Check if username and password match
if (!$loggedInUser) {
    // Username and password do not match, abort the script
    die("Error: Username and password do not match or this user is already in dungeon.");
}

if ($loggedInUser) {
    // Insert a new row into the active_dungeon table
    $insertQuery = "INSERT INTO active_dungeon (user_id, team1_id, team2_id, team3_id) VALUES ('{$loggedInUser['id']}', '{$userIDs[0]['id']}', '{$userIDs[1]['id']}', '{$userIDs[2]['id']}')";
    mysqli_query($conn, $insertQuery);

    // Select the dungeon_id of the newly inserted row
    $sql = "SELECT dungeon_id FROM active_dungeon WHERE user_id='$loggedInUser[id]'";
    $sqlResult = mysqli_query($conn, $sql);

    // Check if the query was executed successfully
    if ($sqlResult) {
        $sqlRow = mysqli_fetch_assoc($sqlResult);
        $newlyInserteDungeondID = $sqlRow['dungeon_id'];
    } else {
        die('Error fetching dungeon_id: ' . mysqli_error($conn));
    }

    $userIDs[] = $loggedInUser;
}

$updateQuery = "UPDATE users SET in_dungeon='1' WHERE id IN (";

// Iterate through the array of user IDs and build the IN clause
foreach ($userIDs as $key => $user) {

    $updateQuery .= "'" . $user['id'] . "'";
    if ($key < count($userIDs) - 1) {
        $updateQuery .= ",";
    }
}
$updateQuery .= ")";

// Execute the update query
mysqli_query($conn, $updateQuery);

// Select random IDs from dungeon_move and dungeon_monster tables
$dungeon_move_id = getRandomIDFromTable('dungeon_move_quotes', $conn, 'move_quote_id');
$dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID');

// Update active_dungeon table with random IDs
$updateQuery = "UPDATE active_dungeon SET dungeon_move_id=$dungeon_move_id, dungeon_monster_id=$dungeon_monster_id WHERE dungeon_id={$newlyInserteDungeondID}";
mysqli_query($conn, $updateQuery);

// Loop 100 times
for ($i = 0; $i < 100; $i++) {

    // Execute query to fetch active dungeon information
    $activeDungeonQuery = "SELECT * FROM active_dungeon WHERE user_id = '{$loggedInUser['id']}'";
    $activeDungeonResult = mysqli_query($conn, $activeDungeonQuery);

    // Check if the query was executed successfully
    if (!$activeDungeonResult) {
        die('Error fetching active dungeon data: ' . mysqli_error($conn));
    }

    // Fetch active dungeon row
    $activeDungeonRow = mysqli_fetch_assoc($activeDungeonResult);

    // Loop to select and update 5 random moves
    for ($j = 0; $j < 5; $j++) {
    
         // Check if any rows were fetched
        if ($activeDungeonRow) {
            // Check the number of rows in active_dungeon table for the same user
            $countQuery = "SELECT COUNT(*) AS count FROM active_dungeon WHERE user_id={$activeDungeonRow['user_id']}";
            $countResult = mysqli_query($conn, $countQuery);

            // Check if the query was executed successfully
            if ($countResult) {
                $row = mysqli_fetch_assoc($countResult);
                $rowCount = $row['count'];
            } else {
                die('Error fetching row count: ' . mysqli_error($conn));
            }
        } else {
            // Handle case where no rows were fetched
            die('No active dungeon data found for dungeon ID: ' . $newlyInserteDungeondID);
        }

        // Select random IDs from dungeon_move and dungeon_monster tables
        $dungeon_move_id = getRandomIDFromTable('dungeon_move_quotes', $conn, 'move_quote_id');
        $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID');

        if($rowCount < 6){
            // Insert a new row into active_dungeon table
            $dungeonInsertQuery = "INSERT INTO active_dungeon (user_id,dungeon_move_id, dungeon_monster_id,team1_id,team2_id,team3_id) 
            VALUES ($activeDungeonRow[user_id],$dungeon_move_id, $dungeon_monster_id,$activeDungeonRow[team1_id],$activeDungeonRow[team2_id],$activeDungeonRow[team3_id])";
            mysqli_query($conn, $dungeonInsertQuery);
        }

        // If more than 5 rows, delete the oldest rows to maintain 5 rows
        if ($rowCount > 5) {
            $deleteQuery = "DELETE FROM active_dungeon WHERE user_id = $activeDungeonRow[user_id] ORDER BY dungeon_id ASC LIMIT 1";
            mysqli_query($conn, $deleteQuery);
        }
        
    }

    // Pause execution for 10 seconds
    sleep(10);
}

$stmt = "SELECT user_id, team1_id, team2_id, team3_id FROM active_dungeon WHERE user_id='{$loggedInUser['id']}'";
$stmtResult = mysqli_query($conn, $stmt);
$userIdRow = mysqli_fetch_assoc($stmtResult);

// Update in_dungeon column in the user table
$updateUserQuery = "UPDATE users SET in_dungeon='0' WHERE id='{$userIdRow['user_id']}' OR id ='{$userIdRow['team1_id']}' OR id ='{$userIdRow['team2_id']}' OR id ='{$userIdRow['team3_id']}'";
mysqli_query($conn, $updateUserQuery);

// Delete the row from active_dungeon table after 100 iterations
$deleteQuery = "DELETE FROM active_dungeon WHERE user_id='{$loggedInUser['id']}'";
mysqli_query($conn, $deleteQuery);

// Close database connection
mysqli_close($conn);

// Function to get a random ID from a given table
function getRandomIDFromTable($table, $conn,$id) {
    $query = "SELECT $id FROM $table ORDER BY RAND() LIMIT 1";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    return $row[$id];
}
