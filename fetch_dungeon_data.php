<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include the database connection file
include_once('connect.php');

// Check if username and password are provided
if (isset($_GET['username']) && isset($_GET['password'])) {
    // Sanitize the input
    $username = mysqli_real_escape_string($conn, $_GET['username']);
    $password = mysqli_real_escape_string($conn, $_GET['password']);

    // Query to select the logged-in user's ID
    $selectLoggedInUserQuery = "SELECT id FROM users WHERE username='$username' AND password='$password'";
    $loggedInUserResult = mysqli_query($conn, $selectLoggedInUserQuery);

    if ($loggedInUserResult) {
        $loggedInUser = mysqli_fetch_assoc($loggedInUserResult);

        // Query to fetch dungeon ID for the logged-in user
        $sql = "SELECT ad.dungeon_id,u.username,u.gold,u.exp,u.luck,u.level,u.attack,u.defence,u.hp,u.c_hp,dmq1.move_quote as dungeon_move_1,
        dmq2.move_quote as dungeon_move_2,
        dmq3.move_quote as dungeon_move_3,
        dmq4.move_quote as dungeon_move_4,
        dmq5.move_quote as dungeon_move_5,
        team1.username as team1_username,
        ad.team1_hp,
        ad.team1_c_hp,
        team2.username as team2_username,
        ad.team2_hp,
        ad.team2_c_hp,
        team3.username as team3_username,
        ad.team2_c_hp,
        ad.team3_c_hp,
        dm.Name as monster
        FROM active_dungeon as ad
        INNER JOIN users as u
        ON u.ID = ad.user_id
        LEFT JOIN dungeon_move_quotes as dmq1
        ON dmq1.move_quote_id=ad.dungeon_move_1
        LEFT JOIN dungeon_move_quotes as dmq2
        ON dmq2.move_quote_id=ad.dungeon_move_2
        LEFT JOIN dungeon_move_quotes as dmq3
        ON dmq3.move_quote_id=ad.dungeon_move_3
        LEFT JOIN dungeon_move_quotes as dmq4
        ON dmq4.move_quote_id=ad.dungeon_move_4
        LEFT JOIN dungeon_move_quotes as dmq5
        ON dmq5.move_quote_id=ad.dungeon_move_5
        LEFT JOIN users as team1
        ON team1.id=ad.team1_id
        LEFT JOIN users as team2
        ON team2.id=ad.team2_id
        LEFT JOIN users as team3
        ON team3.id=ad.team3_id
        LEFT JOIN dungeon_monsters as dm
        ON ad.dungeon_monster_id = dm.DMonster_ID
        WHERE user_id='{$loggedInUser['id']}'";
        $sqlResult = mysqli_query($conn, $sql);

        if ($sqlResult) {
            $dungeonData = mysqli_fetch_assoc($sqlResult);

            // Return the dungeon ID as JSON
            echo json_encode($dungeonData);
        } else {
            // Handle query error
            echo json_encode(array('error' => 'Error fetching dungeon data.'));
        }
    } else {
        // Handle invalid credentials
        echo json_encode(array('error' => 'Invalid username or password.'));
    }
} else {
    // Handle missing parameters
    echo json_encode(array('error' => 'Username and password are required.'));
}

// Close the database connection
mysqli_close($conn);

?>
