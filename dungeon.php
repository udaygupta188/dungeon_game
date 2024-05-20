<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once('connect.php');
 echo '<br>';
// Fetch all user IDs
$getUsersQuery = "SELECT id,hp,c_hp FROM users WHERE in_dungeon='0' ORDER BY RAND() LIMIT 3";
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

    $insertQuery = "INSERT INTO active_dungeon (user_id, team1_id, team1_hp, team1_c_hp, team2_id, team2_hp, team2_c_hp, team3_id, team3_hp, team3_c_hp) VALUES ('{$loggedInUser['id']}', '{$userIDs[0]['id']}','{$userIDs[0]['hp']}', '{$userIDs[0]['c_hp']}', '{$userIDs[1]['id']}','{$userIDs[1]['hp']}', '{$userIDs[1]['c_hp']}', '{$userIDs[2]['id']}', '{$userIDs[2]['hp']}', '{$userIDs[2]['c_hp']}')";
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
$monsterArry = [];
$monsterArryToRestore = [];
$excludeDiedMonsterIDs =array();
$excludeMoveIDs =array();
$playerKilled =array();

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
$move_id1 = getRandomIDFromTable('dungeon_move_quotes', $conn, 'move_quote_id',$excludeMoveIDs);
array_push($excludeMoveIDs, $move_id1);

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

    echo '<br>Current Turn is '.$dunRow['turns'].'<br>';

    $teamIDs = array($dunRow['user_id'], $dunRow['team1_id'], $dunRow['team2_id'], $dunRow['team3_id']);

    // Check if all team IDs are dead then stop dungeon
    if (empty(array_diff($teamIDs, $playerKilled))) {
        echo 'All Players Dead';
        break;
    }

    if($dunRow['turns'] <= 10){

     
        $chances = mt_rand(0, 100);

        if ($chances>=50) {
            
            $move_id_new = getRandomIDFromTable('dungeon_move_quotes', $conn, 'move_quote_id');

            //---------------------------------------

            // Array to hold column names
            $columnNames = ['dungeon_move_1', 'dungeon_move_2', 'dungeon_move_3', 'dungeon_move_4','dungeon_move_5'];

            // Loop through each column name
            foreach ($columnNames as $columnName) {
                // Check if $dunRow is not null and if the column exists in $dunRow
                if (!empty($dunRow) && array_key_exists($columnName, $dunRow) && $dunRow[$columnName] !== null) {
                    // Select the corresponding move_quote from dungeon_move_quotes table
                    $testSql = "SELECT move_quote FROM dungeon_move_quotes WHERE move_quote_id={$dunRow[$columnName]}";
                    $testSqlResult = mysqli_query($conn, $testSql);
                    $testSqlRow = mysqli_fetch_assoc($testSqlResult);
                    // Output the move_quote
                    $len = is_null($testSqlRow) ? '' : $testSqlRow['move_quote'];

                    echo $len .'</br> ';
                }
            }

            // echo '<br> Moving Started<br>';
            //-------------------------------------------
            
            // Update active_dungeon table with new values
            $updateStmt = "UPDATE active_dungeon SET 
            turns=turns+1,
            dungeon_move_1=$move_id_new, 
            dungeon_move_2={$dunRow['dungeon_move_1']},
            dungeon_move_3={$dunRow['dungeon_move_2']},
            dungeon_move_4={$dunRow['dungeon_move_3']},
            dungeon_move_5={$dunRow['dungeon_move_4']},
            dungeon_monster_id = null 
            WHERE user_id='{$loggedInUser['id']}'";

            mysqli_query($conn, $updateStmt);
        }else{

            // if(mt_rand(0, 100) <= 10){
                if (!empty($monsterArry)) {
                    $lastMonsterId = array_key_last($monsterArry);
                    $lastMonsterHPValue = end($monsterArry); // Get the value of the last element
                } else {
                    $lastMonsterHPValue = 0;
                }

                if($lastMonsterHPValue>0){
                    $dungeon_monster_id = $lastMonsterId;
                }else{
    
                    $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID',$excludeDiedMonsterIDs);
                }
    
                // Update active_dungeon table with random Monster
                $updateQuery = "UPDATE active_dungeon SET dungeon_monster_id=$dungeon_monster_id WHERE user_id={$loggedInUser['id']}";
                mysqli_query($conn, $updateQuery);
    
                echo "<br>Fight started <br/>";
                //Start Fight
                if (!in_array($dunRow['user_id'], $playerKilled)){
                    if (!empty($monsterArry)) {
                        $lastMonsterId = array_key_last($monsterArry);
                        $lastMonsterHPValue = end($monsterArry); // Get the value of the last element
                    } else {
                        $lastMonsterHPValue = 0;
                    }
                    
                    
                    if($lastMonsterHPValue>0){
                        $dungeon_monster_id = $lastMonsterId;
                    }else{
        
                        $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID',$excludeDiedMonsterIDs);
                    }
                    fight($dungeon_monster_id, $dunRow['user_id']);
                    // echo  'last monster HP<br>'.$lastMonsterHPValue.'<br>';
                }
                if (!in_array($dunRow['team1_id'], $playerKilled)){
                    if (!empty($monsterArry)) {
                        $lastMonsterId = array_key_last($monsterArry);
                        $lastMonsterHPValue = end($monsterArry); // Get the value of the last element
                    } else {
                        $lastMonsterHPValue = 0;
                    }
                    
    
                    if($lastMonsterHPValue>0){
                        $dungeon_monster_id = $lastMonsterId;
                    }else{
        
                        $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID',$excludeDiedMonsterIDs);
                    }
                    fight($dungeon_monster_id, $dunRow['team1_id']);
                    echo $lastMonsterHPValue.' last monster HP<br>';
                }
                if (!in_array($dunRow['team2_id'], $playerKilled)){
                    if (!empty($monsterArry)) {
                        $lastMonsterId = array_key_last($monsterArry);
                        $lastMonsterHPValue = end($monsterArry); // Get the value of the last element
                    } else {
                        $lastMonsterHPValue = 0;
                    }
                    
                    if($lastMonsterHPValue>0){
                        $dungeon_monster_id = $lastMonsterId;
                    }else{
        
                        $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID',$excludeDiedMonsterIDs);
                    }
                    fight($dungeon_monster_id, $dunRow['team2_id']);
                    echo $lastMonsterHPValue.' last monster HP<br>';
                }
                if (!in_array($dunRow['team3_id'], $playerKilled)){
                    if (!empty($monsterArry)) {
                        $lastMonsterId = array_key_last($monsterArry);
                        $lastMonsterHPValue = end($monsterArry); // Get the value of the last element
                    } else {
                        $lastMonsterHPValue = 0;
                    }
                    if($lastMonsterHPValue>0){
                        $dungeon_monster_id = $lastMonsterId;
                    }else{
        
                        $dungeon_monster_id = getRandomIDFromTable('dungeon_monsters', $conn, 'DMonster_ID',$excludeDiedMonsterIDs);
                    }
                    fight($dungeon_monster_id, $dunRow['team3_id']);
                    echo $lastMonsterHPValue.' last monster HP<br>';
                }
    
            // }

        }
        
        // Pause execution for 10 seconds
        sleep(1);
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


foreach ($monsterArryToRestore as $key => $value) {
   //update hp of Monster
    $sql = "UPDATE dungeon_monsters SET HP=$value WHERE DMonster_ID=$key";
    $conn->query($sql);
    echo 'Monster '.$key.' HP filled';

}

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
    global $conn,$loggedInUser,$excludeDiedMonsterIDs,$playerKilled,$monsterArry,$monsterArryToRestore;
    
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

    echo 'Monster '.$monsterId.' is Playing <br>';
    
    if (!isset($monsterArryToRestore[$monsterId])) {
        $monsterArryToRestore[$monsterId] = $m_hp;
    }
    // if (!isset($monsterArry[$monsterId])) {
        $monsterArry[$monsterId] = $m_hp;
    // }


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
    $columnName = checkColumn($playerId);

    if ($player['luck'] > $monster['Luck']) {
        // Player attacks
        $damage = $player['attack'] - $monster['Defence'];
        if ($damage < 1) {
            $damage = 1;
        }

        // Update monster HP 
        $newMHp = $m_hp - $damage;
        if ($newMHp <= 0) {
            $newMHp = 0;
            array_push($excludeDiedMonsterIDs, $monsterId);
        }

        //update hp of Monster
        $sql = "UPDATE dungeon_monsters SET HP=$newMHp WHERE DMonster_ID=$monsterId";
        $conn->query($sql);
        echo "Player $columnName Attack to monster MHP is: $newMHp <br/>";

        // // Update player quote
        // $randomMonsterQuote = array_rand($monster_quotes);
        // $sql = "UPDATE `active_dungeon` SET `dungeon_move_1`='$randomMonsterQuote' WHERE $columnName=$playerId";
        // $conn->query($sql);

        // if($newMHp>0){
        //     fight($monsterId, $playerId);
        // }
        if($newMHp <=0){
            // Monster value null if he died player quote
            $sql = "UPDATE `active_dungeon` SET dungeon_monster_id=null WHERE $columnName=$playerId";
            $conn->query($sql);
            echo 'Monster Id Set to Null in active dungeon -------<br>';
        }
    }else{
          // Monster attacks
        $damage = $monster['Attack'] - $player['defence'];
        if ($damage < 1) {
            $damage = 1;
        }
        // Update player HP
        $newPHp = $p_hp - $damage;
        if ($newPHp <= 0) {
            array_push($playerKilled,$playerId);
            $newPHp = 0;
        }
        // if($newPHp>0){
        //     fight($monsterId, $playerId);
        // }

        if($playerId !=$loggedInUser['id']){
            $cpColumnName = substr($columnName, 0, -2).'hp';
        
            //update c_hp of player
            $sql = "UPDATE active_dungeon SET $cpColumnName=$newPHp WHERE $columnName=$playerId";
            $conn->query($sql);
            echo "Monster Attack $cpColumnName HP is: $newPHp <br/>";
        }
    }
}



function checkColumn($teamId){
    global $conn;
    $columnNames = array("user_id","team1_id", "team2_id", "team3_id"); // Specify the column names you want to search within
    
    foreach ($columnNames as $columnName) {
        // Construct query to search for the target ID in the current column
        $searchQuery = "SELECT COUNT(*) AS count FROM active_dungeon WHERE $columnName = $teamId";
        $searchResult = mysqli_query($conn, $searchQuery);
    
        if ($searchResult) {
            $count = mysqli_fetch_assoc($searchResult)['count'];
            if ($count > 0) {
                // echo "ID $teamId found in column: $columnName<br>";
                return $columnName;
            }
        } else {
            echo "Error searching in column $columnName: " . mysqli_error($conn) . "<br>";
        }
    }

    
}