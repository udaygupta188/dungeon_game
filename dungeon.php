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
$username = $_GET['username'];
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

$excludeIDs =array();

// Select random IDs from dungeon_move and dungeon_monster tables
$move_id1 = getRandomIDFromTable('dungeon_move_quotes', $conn, 'move_quote_id');
array_push($excludeIDs, $move_id1);

// Update active_dungeon table with random IDs
$updateQuery = "UPDATE active_dungeon SET dungeon_move_1=$move_id1,dungeon_move_2=0,dungeon_move_3=0,dungeon_move_4=0,dungeon_move_5=0, turns=1 WHERE dungeon_id={$newlyInserteDungeondID}";
mysqli_query($conn, $updateQuery);

sleep(10);

// Loop 100 times
while (true) {

    // Fetch current values of dungeon_move_2 to dungeon_move_5
    $dunSelectStmt = "SELECT dungeon_move_1,dungeon_move_2, dungeon_move_3, dungeon_move_4, dungeon_move_5,user_id, team1_id, team2_id, team3_id,turns FROM active_dungeon WHERE user_id='{$loggedInUser['id']}'";
    $dunResult = mysqli_query($conn, $dunSelectStmt);
    $dunRow = mysqli_fetch_assoc($dunResult);
    if($dunRow['turns'] <= 100){

        $move_id_new = getRandomIDFromTable('dungeon_move_quotes', $conn, 'move_quote_id');

        // Update active_dungeon table with new values
        $updateStmt = "UPDATE active_dungeon SET 
        turns=turns+1,
        dungeon_move_1=$move_id_new, 
        dungeon_move_2={$dunRow['dungeon_move_1']},
        dungeon_move_3={$dunRow['dungeon_move_2']},
        dungeon_move_4={$dunRow['dungeon_move_3']},
        dungeon_move_5={$dunRow['dungeon_move_4']} 
        WHERE user_id='{$loggedInUser['id']}'";

        mysqli_query($conn, $updateStmt);

        $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID');
        if(mt_rand(0, 100) <= 10){

            //Start Fight
            fight($dungeon_monster_id, $dunRow['user_id']);
            fight($dungeon_monster_id, $dunRow['team1_id']);
            fight($dungeon_monster_id, $dunRow['team2_id']);
            fight($dungeon_monster_id, $dunRow['team3_id']);
        }
        
        // Pause execution for 10 seconds
        sleep(10);
    }else{
        break;
    }
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

// Function to get a random ID from a given table, excluding IDs already selected
function getRandomIDFromTable($table, $conn, $id, $excludeIDs = array()) {
    $excludeString = '';
    if (!empty($excludeIDs)) {
        $excludeString = "WHERE $id NOT IN (" . implode(',', $excludeIDs) . ")";
    }

    $query = "SELECT $id FROM $table $excludeString ORDER BY RAND() LIMIT 1";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    return $row[$id];
}

function fight($monsterId, $playerId){
    global $conn;

    // Array to store user_quotes
    $user_quotes = array();
    $userQuotesSql = "SELECT `id` FROM `users_quotes` ORDER BY `id` ASC";
    $result = $conn->query($userQuotesSql);

    if (!$result) {
        die("Error executing the query: " . $conn->error);
    } else {
        if ($result->num_rows > 0) {
            while ($userQuotesRow = $result->fetch_assoc()) {
                $user_quotes[] = $userQuotesRow;
            }
        }
    }
    
    // Array to store monster_quotes
    $monster_quotes = array();
    $sql = "SELECT `id` FROM `monsters_quotes` ORDER BY `id` ASC";
    $result = $conn->query($sql);

    if (!$result) {
        die("Error executing the query: " . $conn->error);
    } else {
        if ($result->num_rows > 0) {
            while ($monsterRow = $result->fetch_assoc()) {
                $monster_quotes[] = $monsterRow;
            }
        }
    }


    $playerSql = "SELECT * FROM users WHERE id=$playerId";
    $playerResult = mysqli_query($conn, $playerSql);
    $player = mysqli_fetch_assoc($playerResult);
  
    $monsterSql = "SELECT * FROM dungeon_monsters WHERE DMonster_ID=$monsterId";
    $monsterResult = mysqli_query($conn, $monsterSql);
    $monster = mysqli_fetch_assoc($monsterResult);

    $m_hp = $monster['HP'];

    // Get initial player HP
    $p_hp = $player['c_hp'];

    // Get players Curent EXP
    $p_exp = $player['exp'];

    // Get players gold
    $p_gold = $player['gold'];

    // Get players win
    $p_win = $player['win'];

    // Get players lose
    $p_lose = $player['lose'];

    if ($player['luck'] > $monster['Luck']) {
        // Player attacks
        $damage = $player['attack'] - $monster['Defence'];
        if ($damage < 1) {
            $damage = 1;
        }

        // Update monster HP 
        $newMHp = $m_hp - $damage;
        if ($newMHp < 0) {
            $newMHp = 0;
        }

        // $sql = "UPDATE dungeon_monsters SET HP=$newMHp WHERE DMonster_ID=$monsterId";
        // $conn->query($sql);
        // $m_hp = $newMHp;

        // "Player dealt $damage damage. Monster HP left";

        // // Update player quote
        // $randomUserQuote = array_rand($user_quotes);
        // $sql = "UPDATE `users` SET `quote_id`='U:$randomUserQuote' WHERE ID=$playerId";
        // $conn->query($sql);

        if ($m_hp <= 0) {
            $randomexp = (rand(1, 10));
            $sql = "UPDATE users SET exp = $p_exp + $randomexp WHERE ID=$playerId";
            $conn->query($sql);
            // "Player won $randomexp!";
            $randomegold = (rand(1, 10));
            $sql = "UPDATE users SET gold = $p_gold + $randomegold WHERE ID=$playerId";
            $conn->query($sql);
            // "Player get $randomegold GOLD.";
            $sql = "UPDATE users SET win = $p_win + 1 WHERE ID=$playerId";
            $conn->query($sql);
        }
    }

    // Monster attacks
    $damage = $monster['Attack'] - $player['defence'];
    if ($damage < 1) {
        $damage = 1;
    }
    // Update player HP
    $newPHp = $p_hp - $damage;
    if ($newPHp < 0) {
        $newPHp = 0;
    }
    $sql = "UPDATE users SET c_hp=$newPHp WHERE ID=$playerId";
    $conn->query($sql);
    $p_hp = $newPHp;

    // Update player quote
    $randomMonsterQuote = array_rand($monster_quotes);
    $sql = "UPDATE `users` SET `quote_id`='M:$randomMonsterQuote' WHERE ID=$playerId";
    $conn->query($sql);

    if ($p_hp <= 0) {
        $randomegold = (rand(1, 5));
        $newGold = $p_gold - $randomegold;
        if ($newGold < 0) {
            $newGold = 0;
        }
        $sql = "UPDATE users SET gold = $newGold  WHERE ID=$playerId";
        $conn->query($sql);
        // "Player lost GOLD";

        $sql = "UPDATE users SET lose = $p_lose + 1 WHERE ID=$playerId";
        $conn->query($sql);
        // "Player lose point added";

        $randomexp2 = (rand(1, 3));
        $sql = "UPDATE users SET exp = $p_exp + $randomexp2 WHERE ID=$playerId";
        $conn->query($sql);
        // "Player lost";
    }

    // // Restore monster HP
    // $sql = "UPDATE dungeon_monsters SET HP={$monster['HP']} WHERE DMonster_ID=$monsterId";
    // $conn->query($sql);

    // Restore monster id in user to -1
    $sql_updateMonster = "UPDATE users SET `monster`=-1 WHERE ID=$playerId";
    $conn->query($sql_updateMonster);
}
