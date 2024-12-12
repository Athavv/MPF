<?php
// Connexion à la base de données
$conn = new mysqli("localhost", "root", "", "morpion-foot");

// Sauvegarder l’état de la grille
$grid = json_encode($_POST['grid']);
$gameId = $_POST['gameId'];

$saveGridQuery = "UPDATE parties SET grille = ? WHERE id = ?";
$stmt = $conn->prepare($saveGridQuery);
$stmt->bind_param("si", $grid, $gameId);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}

$stmt->close();
$conn->close();
?>
