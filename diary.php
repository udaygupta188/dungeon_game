<?php
include_once('connect.php');

$getdiary_id = "SELECT `diary_1`, `diary_2`, `diary_3`, `diary_4`, `diary_5`, `diary_6`, `diary_7`, `diary_8`, `diary_9`, `diary_10`  FROM `diaryinventory`";
$result = mysqli_query($conn, $getdiary_id);
$diary_id = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Fetch all diary IDs
$getDiaryIDsQuery = "SELECT id FROM diary";
$result = mysqli_query($conn, $getDiaryIDsQuery);
$diaryIDs = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Fetch all user IDs
$getUsersQuery = "SELECT id FROM users";
$result = mysqli_query($conn, $getUsersQuery);
$userIDs = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Shuffle the diary IDs array
shuffle($diaryIDs);

$numUsers = count($userIDs);
for ($i = 0; $i < $numUsers; $i++) {
	$diarys = $diary_id[$i % count($diary_id)]['diary_1'];
	$diarys2 = $diary_id[$i % count($diary_id)]['diary_2'];
	$diarys3 = $diary_id[$i % count($diary_id)]['diary_3'];
	$diarys4 = $diary_id[$i % count($diary_id)]['diary_4'];
	$diarys5 = $diary_id[$i % count($diary_id)]['diary_5'];
	$diarys6 = $diary_id[$i % count($diary_id)]['diary_6'];
	$diarys7 = $diary_id[$i % count($diary_id)]['diary_7'];
	$diarys8 = $diary_id[$i % count($diary_id)]['diary_8'];
	$diarys9 = $diary_id[$i % count($diary_id)]['diary_9'];
	$userID = $userIDs[$i]['id'];
	$updateQuery2 = "UPDATE diaryinventory SET diary_2 = '$diarys', diary_3 = '$diarys2', diary_4 = '$diarys3', diary_5 = '$diarys4', diary_6 = '$diarys5', diary_7 = '$diarys6', diary_8 = '$diarys7', diary_9 = '$diarys8', diary_10 = '$diarys9' WHERE userID = '$userID'";
	mysqli_query($conn, $updateQuery2);
}
// Update each user row with a different diary ID
$numUsers = count($userIDs);
for ($i = 0; $i < $numUsers; $i++) {
	$diaryID = $diaryIDs[$i % count($diaryIDs)]['id']; // Cycle through the available diary IDs
	$userID = $userIDs[$i]['id'];


	// Update the user row with the current diary ID
	$updateQuery = "UPDATE diaryinventory SET diary_1 = '$diaryID' WHERE userID = '$userID'";
	mysqli_query($conn, $updateQuery);
}

mysqli_close($con);
