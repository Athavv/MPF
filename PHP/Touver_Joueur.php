<?php

$conn = new mysqli("localhost", "root", "", "morpion-foot");

// Recherche de joueurs en fonction d'une requête
$searchQuery = $_GET['search'] ?? '';

$playerQuery = "SELECT nom FROM joueurs WHERE nom LIKE ? LIMIT 10";
$stmt = $conn->prepare($playerQuery);
$searchParam = "%" . $searchQuery . "%";
$stmt->bind_param("s", $searchParam);
$stmt->execute();
$result = $stmt->get_result();

$players = [];
while ($row = $result->fetch_assoc()) {
    $players[] = $row['nom'];
}

echo json_encode($players);

$stmt->close();
$conn->close();
?>
