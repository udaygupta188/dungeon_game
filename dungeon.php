<?php
include_once('connect.php');

// Fetch all user IDs
$getUsersQuery = "SELECT id FROM users WHERE in_dungeon='0' ORDER BY RAND() LIMIT 3";
$userResult = mysqli_query($con, $getUsersQuery);
$userIDs = mysqli_fetch_all($userResult, MYSQLI_ASSOC);

// Include the logged-in user
$username = $_GET['username']; // Replace with the logged-in user's username
$password = $_GET['password']; // Replace with the logged-in user's password

// Query to select the logged-in user's ID
$selectLoggedInUserQuery = "SELECT id FROM users WHERE username='$username' AND password='$password'";
$loggedInUserResult = mysqli_query($con, $selectLoggedInUserQuery);
$loggedInUser = mysqli_fetch_assoc($loggedInUserResult);
if ($loggedInUser) {
    // Prepare the current datetime for start_time
    $start_time = date("Y-m-d H:i:s");

    // Insert a new row into the active_dungeon table
    $insertQuery = "INSERT INTO active_dungeon (user_id, start_time) VALUES ('$loggedInUser[id]', '$start_time')";
    mysqli_query($con, $insertQuery);
    
    // Get the ID of the newly inserted row
    $newlyInserteDungeondID = mysqli_insert_id($con);

    $userIDs[] = $loggedInUser;
}

$updateQuery = "UPDATE users SET in_dungeon='1' WHERE id IN (";

// Iterate through the array of user IDs and build the IN clause
foreach ($userIDs as $key => $user) {
   
    // Update active_dungeon table for the current user with the generated team IDs
   $updateDungeon = "UPDATE active_dungeon SET team1_id={$userIDs[0]['id']}, team2_id={$userIDs[1]['id']}, team3_id={$userIDs[2]['id']} WHERE dungeon_id={$newlyInsertedID}";
   mysqli_query($con, $updateDungeon);

    $updateQuery .= "'" . $user['id'] . "'";
    if ($key < count($userIDs) - 1) {
        $updateQuery .= ",";
    }
}
$updateQuery .= ")";

// Execute the update query
mysqli_query($con, $updateQuery);


// Loop 100 times
for ($i = 0; $i < 100; $i++) {
    // Select random IDs from dungeon_move and dungeon_monster tables
    $dungeon_move_id = getRandomIDFromTable('dungeon_move_quotes', $con,'move_quote_id');
    $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $con,'DMonster_ID');

    $endtime = ($i > 0) ? date("Y-m-d H:i:s") : NULL;

    // Update active_dungeon table with random IDs
    $updateQuery = "UPDATE active_dungeon SET start_time=NOW(), end_time=$endtime, dungeon_move_id=$dungeon_move_id, dungeon_monster_id=$dungeon_monster_id WHERE dungeon_id={$newlyInsertedID}";
    mysqli_query($con, $updateQuery);

    // Pause execution for 10 seconds
    sleep(10);
}

// Delete the row from active_dungeon table after 100 iterations
$deleteQuery = "DELETE FROM active_dungeon WHERE dungeon_id={$newlyInsertedID}";
mysqli_query($con, $deleteQuery);

// Update in_dungeon column in the user table
$updateUserQuery = "UPDATE users SET in_dungeon='0' 
                    WHERE id IN (
                        SELECT user_id FROM active_dungeon 
                        WHERE dungeon_id={$newlyInsertedID} 
                        OR user_id IN (
                            SELECT team1_id FROM active_dungeon WHERE dungeon_id={$newlyInsertedID} 
                            UNION 
                            SELECT team2_id FROM active_dungeon WHERE dungeon_id={$newlyInsertedID} 
                            UNION 
                            SELECT team3_id FROM active_dungeon WHERE dungeon_id={$newlyInsertedID}
                        )
                    )";
mysqli_query($con, $updateUserQuery);


// Close database connection
mysqli_close($con);

mysqli_close($con);

// Function to get a random ID from a given table
function getRandomIDFromTable($table, $con,$id) {
    $query = "SELECT $id FROM $table ORDER BY RAND() LIMIT 1";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_assoc($result);
    return $row[$id];
}
