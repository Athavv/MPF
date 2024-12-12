const criteriaList = {
    row: ["Vainqueur Ballon d'Or", "A joué en Premier League", "Vainqueur Coupe du Monde"],
    column: ["Joueur Français", "A joué pour le Real Madrid", "Vainqueur Ligue des Champions"]
};

const playerDatabase = [
    { name: "Zinedine Zidane", row: ["Vainqueur Ballon d'Or", "Vainqueur Coupe du Monde"], column: ["Joueur Français", "A joué pour le Real Madrid"] },
    { name: "Cristiano Ronaldo", row: ["Vainqueur Ballon d'Or", "A joué en Premier League"], column: ["A joué pour le Real Madrid", "Vainqueur Ligue des Champions"] },
    { name: "Lionel Messi", row: ["Vainqueur Ballon d'Or"], column: ["Vainqueur Ligue des Champions"] },
    { name: "Kylian Mbappé", row: ["Vainqueur Coupe du Monde"], column: ["Joueur Français"] },
    { name: "David Beckham", row: ["A joué en Premier League"], column: ["A joué pour le Real Madrid"] }
];


let currentPlayer = 1;
let gameActive = false;
let grid = Array(9).fill(null);
let selectedCell = null;

function startGame() {
    resetGrid();
    generateCriteria();
    gameActive = true;
    currentPlayer = 1;
    document.getElementById("status").textContent = "C'est au Joueur 1 de jouer !";
}

function generateCriteria() {
    const rowContainer = document.getElementById("criteria-row");
    const columnContainer = document.getElementById("criteria-column");
    rowContainer.innerHTML = "";
    columnContainer.innerHTML = "";

    const rows = criteriaList.row.sort(() => Math.random() - 0.5).slice(0, 3);
    const columns = criteriaList.column.sort(() => Math.random() - 0.5).slice(0, 3);

    rows.forEach(crit => {
        const div = document.createElement("div");
        div.textContent = crit;
        rowContainer.appendChild(div);
    });

    columns.forEach(crit => {
        const div = document.createElement("div");
        div.textContent = crit;
        columnContainer.appendChild(div);
    });
}

function resetGrid() {
    grid = Array(9).fill(null);
    selectedCell = null;
    for (let i = 1; i <= 9; i++) {
        const cell = document.getElementById(`case${i}`);
        cell.textContent = "";
        cell.className = "case"; // Réinitialiser les styles
    }
    document.getElementById("winner-popup").classList.add("hidden");
    document.getElementById("searchBar").value = "";
    document.getElementById("playerSuggestions").innerHTML = "";
}

function handleCaseClick(index) {
    if (!gameActive) return;

    // Empêche de sélectionner une case déjà prise
    if (grid[index - 1] !== null) {
        alert("Cette case est déjà occupée !");
        return;
    }

    // Met à jour la case sélectionnée
    selectedCell = index;

    // Met en évidence la case sélectionnée (facultatif, pour une meilleure UX)
    for (let i = 1; i <= 9; i++) {
        const cell = document.getElementById(`case${i}`);
        cell.classList.remove("selected");
    }
    document.getElementById(`case${index}`).classList.add("selected");
}


function filterPlayers() {
    const searchQuery = document.getElementById("searchBar").value.toLowerCase();
    const suggestions = document.getElementById("playerSuggestions");
    suggestions.innerHTML = "";

    const matches = playerDatabase.filter(player => player.name.toLowerCase().includes(searchQuery));
    matches.forEach(player => {
        const li = document.createElement("li");
        li.textContent = player.name;
        li.onclick = () => selectPlayer(player.name);
        suggestions.appendChild(li);
    });
}

function selectPlayer(name) {
    document.getElementById("searchBar").value = name;
    document.getElementById("playerSuggestions").innerHTML = "";
}

function submitPlayer() {
    if (selectedCell === null) {
        alert("Veuillez sélectionner une case !");
        return;
    }

    const playerName = document.getElementById("searchBar").value.trim();
    const columnCriteria = document.querySelector(`#criteria-column div:nth-child(${Math.ceil(selectedCell / 3)})`).textContent;
    const rowCriteria = document.querySelector(`#criteria-row div:nth-child(${((selectedCell - 1) % 3) + 1})`).textContent;

    const isValid = playerDatabase.some(player => {
        return player.name === playerName &&
            player.row.includes(rowCriteria) &&
            player.column.includes(columnCriteria);
    });

    if (isValid) {
        const cell = document.getElementById(`case${selectedCell}`);
        cell.textContent = `J${currentPlayer}: ${playerName}`;
        cell.classList.add(currentPlayer === 1 ? "player1" : "player2");
        grid[selectedCell - 1] = currentPlayer;

        // Réinitialise la recherche
        document.getElementById("searchBar").value = "";
        document.getElementById("playerSuggestions").innerHTML = "";

        // Vérifie s'il y a un gagnant ou un match nul
        checkWinner();

        // Si pas de gagnant, passe au joueur suivant
        if (gameActive) switchPlayer();
    } else {
        alert("Joueur invalide ou ne correspond pas aux critères !");

        // Passe au joueur suivant après une erreur
        switchPlayer();
    }
}


function switchPlayer() {
    currentPlayer = currentPlayer === 1 ? 2 : 1;
    document.getElementById("status").textContent = `C'est au Joueur ${currentPlayer} de jouer !`;
}

function checkWinner() {
    const winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Lignes
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Colonnes
        [0, 4, 8], [2, 4, 6] // Diagonales
    ];

    for (const combination of winningCombinations) {
        const [a, b, c] = combination;
        if (grid[a] !== null && grid[a] === grid[b] && grid[a] === grid[c]) {
            const winner = grid[a];
            const winnerMessage = winner === 1 
                ? "🎉 Le Joueur 1 (bleu) a gagné ! 🎉" 
                : "🎉 Le Joueur 2 (rouge) a gagné ! 🎉";

            // Configure le pop-up pour une victoire
            document.getElementById("winner-popup").classList.remove("hidden");
            document.getElementById("winner-message").textContent = winnerMessage;
            document.getElementById("winner-popup").classList.add("victory-popup"); // Ajoute une classe pour styliser le pop-up
            document.getElementById("winner-image").src = winner === 1 
                ? "https://upload.wikimedia.org/path/image-bleu.jpg" 
                : "https://upload.wikimedia.org/path/image-rouge.jpg";

            gameActive = false;
            return;
        }
    }

    // Vérifie s'il y a un match nul
    if (!grid.includes(null)) {
        // Configure le pop-up pour un match nul
        document.getElementById("winner-popup").classList.remove("hidden");
        document.getElementById("winner-message").textContent = "🤝 Match nul ! Aucun gagnant. 🤝";
        document.getElementById("winner-popup").classList.add("draw-popup"); // Ajoute une classe pour styliser le pop-up
        document.getElementById("winner-image").src = "./ressources/victoire.jpg";

        gameActive = false;
    }
}
