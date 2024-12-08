const criteriaList = {
    row: ["Ballon d'Or Winner", "Played in Premier League", "World Cup Winner"],
    column: ["French Player", "Played for Real Madrid", "Champions League Winner"]
};

const playerDatabase = [
    { name: "Zinedine Zidane", row: ["Ballon d'Or Winner", "World Cup Winner"], column: ["French Player", "Played for Real Madrid"] },
    { name: "Cristiano Ronaldo", row: ["Ballon d'Or Winner", "Played in Premier League"], column: ["Played for Real Madrid", "Champions League Winner"] },
    { name: "Lionel Messi", row: ["Ballon d'Or Winner"], column: ["Champions League Winner"] },
    { name: "Kylian Mbappé", row: ["World Cup Winner"], column: ["French Player"] },
    { name: "David Beckham", row: ["Played in Premier League"], column: ["Played for Real Madrid"] }
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
    for (let i = 1; i <= 9; i++) {
        const cell = document.getElementById(`case${i}`);
        cell.textContent = "";
        cell.className = "case";
    }
    document.getElementById("winner-popup").classList.add("hidden");
}

function handleCaseClick(index) {
    if (!gameActive || grid[index - 1] !== null) return;
    selectedCell = index;
}

function filterPlayers() {
    const searchQuery = document.getElementById("searchBar").value.toLowerCase();
    const suggestions = document.getElementById("playerSuggestions");
    suggestions.innerHTML = "";

    // Filtrer uniquement par le texte recherché, pas par les critères
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
    const playerName = document.getElementById("searchBar").value.trim();
    const columnCriteria = document.querySelector(`#criteria-column div:nth-child(${Math.ceil(selectedCell / 3)})`).textContent;
    const rowCriteria = document.querySelector(`#criteria-row div:nth-child(${((selectedCell - 1) % 3) + 1})`).textContent;

    // Vérifier si le joueur est valide uniquement selon les critères
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

        document.getElementById("searchBar").value = ""; // Réinitialiser la barre de recherche
        document.getElementById("playerSuggestions").innerHTML = ""; // Réinitialiser les suggestions

        checkWinner();
        switchPlayer();
    } else {
        alert("Joueur invalide ou ne correspond pas aux critères !");
        switchPlayer(); // Passer au joueur suivant
    }
}

function switchPlayer() {
    currentPlayer = currentPlayer === 1 ? 2 : 1;
    document.getElementById("status").textContent = `C'est au Joueur ${currentPlayer} de jouer !`;
}

