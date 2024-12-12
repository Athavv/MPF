-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 déc. 2024 à 00:33
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `morpion-foot`
--

-- --------------------------------------------------------

--
-- Structure de la table `clubs_joueurs`
--

CREATE TABLE `clubs_joueurs` (
  `id` int(11) NOT NULL,
  `joueur_id` int(11) DEFAULT NULL,
  `club` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE `joueurs` (
  `id` int(11) NOT NULL,
  `prénom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `nationalité` varchar(50) DEFAULT NULL,
  `ballon_dor` tinyint(1) DEFAULT NULL,
  `titres_ligue` text DEFAULT NULL,
  `titres_internationaux` text DEFAULT NULL,
  `clubs` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `prénom`, `nom`, `nationalité`, `ballon_dor`, `titres_ligue`, `titres_internationaux`, `clubs`) VALUES
(1, 'Lionel', 'Messi', 'Argentine', 1, 'LaLiga, Ligue 1, LDC', 'Coupe du Monde, Copa América', 'PSG, FC Barcelone'),
(2, 'Cristiano', 'Ronaldo', 'Portugal', 1, 'Premier League, LaLiga, Serie A, LDC', 'Euro, Coupe du Monde', 'Real Madrid , Juventus, Manchester United'),
(3, 'Kylian', 'Mbappé', 'France', 0, 'Ligue 1', 'Coupe du Monde', 'Real Madrid , PSG, AS Monaco'),
(4, 'Neymar', 'Jr', 'Brésil', 0, 'LaLiga, Ligue 1, LDC', 'Copa América', 'PSG, FC Barcelone'),
(5, 'Robert', 'Lewandowski', 'Pologne', 0, 'Bundesliga, LaLiga, LDC', 'Euro', 'Bayern Munich, FC Barcelone, Borussia Dortmund'),
(8, 'David', 'Beckham', 'Angleterre', 0, 'LaLiga, Ligue 1, Premier League, LDC', '', 'Real Madrid, Manchester United, AC Milan'),
(9, 'Thierry', 'Henry', 'France', 0, 'LaLiga,Premier League, LDC ', 'Euro, Coupe du Monde', 'Arsenal,FC Barcelone, Juventus, AS Monaco'),
(10, 'Iker', 'Casillas', 'Espagne', 0, 'LaLiga, LDC', 'Euro, Coupe du Monde', 'Real Madrid'),
(11, 'Diego', 'Costa', 'Espagne', 0, 'LaLiga, Premier League', '', 'Atletico Madrid, Chelsea, Wolverhampton'),
(12, '', 'Koke', 'Espagne', 0, 'LaLiga', '', 'Atletico Madrid'),
(13, 'Fernando', 'Torres', 'Espagne', 0, 'LDC', 'Euro, Coupe du Monde', 'Atletico Madrid, Liverpool, AC Milan, Chelsea'),
(14, 'cscs', 'Fabregas', 'Espagne', 0, 'LaLiga,Premier League, LDC', 'Euro, Coupe du Monde', 'FC Barcelone, Arsenal, AS Monaco, Chelsea'),
(15, 'Sergio', 'Aguero', 'Argentine', 0, 'Premier League', 'Copa América', 'Atletico Madrid, Manchester City, FC Barcelone'),
(16, 'Kevin', 'De Bruyne', 'Belgique', 0, 'Premier League, LDC', '', 'Chelsea, Manchester City, Wolfsburg'),
(17, 'David', 'Silva', 'Espagne', 0, 'Premier League', 'Euro, Coupe du Monde', 'Valence, Manchester City, Real Sociedad'),
(18, 'Vincent', 'Kompany', 'Belgique', 0, 'Premier League', '', ' Manchester City, Hambourg'),
(19, 'Yaya', 'Toure', 'Côte dIvoire', 0, 'Premier League, LaLiga, LDC', 'CAN', ' Manchester City, FC Barcelone, AS Monaco'),
(20, 'Riyad', 'Mahrez', 'Algérie', 0, 'Premier League, LDC', 'CAN', ' Manchester City,Leicester'),
(21, 'Ilkay', 'Gundogan', 'Allemagne', 0, 'Premier League, Bundesliga, LDC', 'Coupe du Monde', ' Manchester City,FC Barcelone,Borussia dortmund'),
(22, 'Bernardo', 'Silva', 'Portugal', 0, 'Premier League,Ligue 1, LDC', '', ' Manchester City,AS Monaco'),
(23, 'Joao', 'Cancelo', 'Portugal', 0, 'Premier League,Bundesliga,Serie A', 'Euro', 'Manchester City, Juventus, Inter Milan, Bayern Munich, FC Barcelone, Valence'),
(24, 'Bruno', 'Fernandes', 'Portugal', 0, 'Premier League,Bundesliga,Serie A', 'Euro', 'Manchester United, Udinese,  Sampdoria'),
(25, 'Marcus', 'Rashford', 'Angleterre', 0, '', '', 'Manchester United'),
(26, 'Paul', 'Pogba', 'France', 0, 'Premier League,Serie A', 'Coupe du Monde', 'Manchester United, Juventus'),
(27, 'Wayne', 'Rooney', 'Angleterre', 0, 'Premier League, LDC', '', 'Manchester United, Everton'),
(28, 'Ryan', 'Giggs', 'Pays de Galles', 0, 'Premier League, LDC', '', 'Manchester United'),
(29, 'Gary', ' Neville', 'Angleterre', 0, 'Premier League, LDC', '', 'Manchester United'),
(30, 'Peter', ' Schmeichel', 'Danemark', 0, 'Premier League, LDC', 'Euro', 'Manchester United, Manchester City, Aston Villa'),
(31, 'Ole Gunnar', ' Solskjaer', 'Norvège', 0, 'Premier League, LDC', '', 'Manchester United'),
(32, 'Andy', ' Cole', 'Angleterre', 0, 'Premier League, LDC', '', 'Manchester United, Arsenal, Fulham, Newcastle, Manchester City, Nottingham Forest, Sunderland, Burnley '),
(33, 'Rio', ' Ferdinand', 'Angleterre', 0, 'Premier League, LDC', '', 'Manchester United, West Ham, Leeds, Bournemouth'),
(34, 'Nemanja', ' Vidic', 'Serbie', 0, 'Premier League, LDC', '', 'Manchester United, Inter Milan'),
(35, 'Patrice', ' Evra', 'France', 0, 'Premier League,Serie A, LDC', '', 'Manchester United, Juventus, Marseille, West Ham, AS Monaco, OGC Nice'),
(36, 'Dimitar', ' Berbatov', 'Bulgarie', 0, 'Premier League,', '', 'Manchester United, Bayer Leverkusen, Tottenham, Fulham'),
(37, 'Robin', ' van Persie', 'Pays-Bas', 0, 'Premier League', '', 'Manchester United, Arsenal'),
(39, 'Karim', ' Benzema', 'France', 0, 'LaLiga,Ligue 1, LDC', '', 'Real Madrid, Lyon'),
(40, 'Luka', ' Modric', 'Croatie', 0, 'LaLiga, LDC', '', 'Real Madrid, Tottenham'),
(41, 'Didier', ' Drogba', 'Côte dIvoire', 0, 'Premier League, LDC', '', 'Chelsea, Marseille'),
(42, 'Samuel', ' Eto', 'Cameroun', 0, 'LaLiga ,Serie A, LDC', 'CAN', 'Chelsea, FC Barcelone, Real Madrid, Inter Milan, Everton'),
(43, 'Luis', ' Suarez', 'Uruguay', 0, 'LaLiga, LDC', 'Copa América', 'Liverpool, FC Barcelone, Atletico Madrid'),
(44, 'Philipp', ' Lahm', 'Allemagne', 0, 'Bundesliga, LDC', 'Coupe du Monde', 'Bayern Munich'),
(45, 'Manuel', ' Neuer', 'Allemagne', 0, 'Bundesliga, LDC', 'Coupe du Monde', 'Bayern Munich, Schalke 04'),
(46, 'Miroslav', ' Klose', 'Allemagne', 0, 'Bundesliga', 'Coupe du Monde', 'Bayern Munich, Lazio Rome, Werder Brême'),
(47, 'Thomas', ' Muller', 'Allemagne', 0, 'Bundesliga, LDC', 'Coupe du Monde', 'Bayern Munich'),
(48, 'Arjen', ' Robben', 'Pays-Bas', 0, 'Premier League,Bundesliga,LaLiga, LDC', '', 'Bayern Munich, Chelsea, Real Madrid, '),
(49, 'Clarence', 'Seedorf', 'Pays-Bas', 0, 'LaLiga,Serie A, LDC', '', 'Inter Milan,AC Milan, Chelsea, Real Madrid,Sampdoria'),
(50, 'Ruud', ' van Nistelrooy', 'Pays-Bas', 0, 'Premier League,LaLiga', 'Euro', 'Manchester United,Hambourg, Real Madrid,Malaga'),
(52, 'Marco', ' van Basten', 'Pays-Bas', 1, 'Serie A, LDC', 'Euro', 'AC Milan'),
(53, 'Johan', ' Cruyff', 'Pays-Bas', 1, 'LaLiga, LDC', '', 'FC Barcelone'),
(54, 'Marco', ' Reus', 'Allemagne', 0, '', '', 'Borussia Dortmund'),
(56, 'Jadon', ' Sancho', 'Angleterre', 0, '', '', 'Borussia Dortmund, Manchester United, Chelsea'),
(57, 'Sadio', ' Mane', 'Sénégal', 0, 'Premier League,Bundesliga, LDC', 'CAN', 'Liverpool, Bayern Munich, Metz, Southampton'),
(58, 'Mohamed', ' Salah', 'Égypte', 0, 'Premier League, LDC', '', 'Liverpool, AS Roma, Fiorentina'),
(59, 'Virgil', ' van Dijk', 'Pays-Bas', 0, 'Premier League, LDC', '', 'Liverpool, Southampton'),
(60, 'Alisson', ' Becker', 'Brésil', 0, 'Permier League, LDC', 'Copa América', 'Liverpool, AS Roma'),
(61, 'Jan', ' Oblak', 'Slovénie', 0, 'LaLiga', '', 'Atletico Madrid'),
(62, 'Antoine', ' Griezmann', 'France', 0, '', 'Coupe du Monde', 'Atletico Madrid, FC Barcelone, Real Sociedad '),
(63, 'Xavi', ' Hernandez', 'Espagne', 0, 'LaLiga, LDC', 'Coupe du Monde, Euro', 'FC Barcelone'),
(64, '', 'Ronaldinho', 'Brésil', 1, 'LaLiga, LDC', 'Coupe du Monde', 'FC Barcelone, PSG, AC Milan '),
(65, 'Luis', ' Figo', 'Portugal', 1, 'LaLiga, Serie A, LDC', '', 'FC Barcelone, Real Madrid, Inter Milan '),
(66, 'Raul', ' Gonzalez', 'Espagne', 0, 'LaLiga, LDC', '', 'Real Madrid, Schalke 04 '),
(67, '', 'Rivaldo', 'Brésil', 1, 'LaLiga, Serie A, LDC', 'Coupe du Monde, Copa América', 'FC Barcelone, AC Milan'),
(68, 'Roberto', ' Carlos', 'Brésil', 0, 'LaLiga, LDC', 'Coupe du Monde, Copa América', 'Real Madrid, Inter Milan'),
(70, 'Diego', ' Maradona', 'Argentine', 1, 'LaLiga, Serie A', 'Coupe du Monde, Copa América', 'FC Barcelone, Naples, FC Seville'),
(71, 'George', ' Best', 'Irlande du Nord', 1, 'Premier League, LDC', '', 'Fulham , Manchester United'),
(72, 'Eric', ' Cantona', 'France', 0, 'Premier League', '', 'Leeds, Manchester United, Bordeaux, Marseille, Mon'),
(73, 'Patrick', ' Vieira', 'France', 0, 'Premier League,Serie A', 'Coupe du Monde, Euro', 'Juventus, Manchester City, Inter Milan, AC Milan, '),
(74, 'Dennis', ' Bergkamp', 'Pays-Bas', 0, 'Premier League', '', 'Inter Milan, Arsenal'),
(75, 'Frank', ' Lampard', 'Angleterre', 0, 'Premier League, LDC', '', 'Chelsea, Manchester City'),
(76, 'Steven', ' Gerrard', 'Angleterre', 0, 'LDC', '', 'Liverpool'),
(77, 'Paolo', ' Maldini', 'Italie', 0, 'SERIE A, LDC', 'Coupe du Monde', 'AC Milan'),
(78, 'Francesco', ' Totti', 'Italie', 0, 'SERIE A', 'Coupe du Monde,', 'AS Roma'),
(79, 'Andrea', ' Pirlo', 'Italie', 0, 'Serie A, LDC', 'Coupe du Monde', 'Juventus, AC Milan, Inter Milan'),
(80, 'Zlatan', ' Ibrahimovic', 'Suède', 0, 'LaLiga, Ligue 1,Serie A', '', 'Juventus, AC Milan, Inter Milan, FC Barcelone, PSG'),
(81, 'Gareth', ' Bale', 'Pays de Galles', 0, 'LaLiga, LDC', '', 'Real Madrid, Tottenham '),
(83, 'Eden', ' Hazard', 'Belgique', 1, 'LaLiga, Ligue 1, LDC', '', 'Real Madrid, Chelsea, Lille '),
(273, 'Olivier', ' Giroud', 'France', 0, 'Ligue 1,Premier League,Serie A, LDC', 'Coupe du Monde', 'Chelsea, Arsenal, AC Milan, Montpellier '),
(275, 'Kingsley', ' Coman', 'France', 0, 'Ligue 1,Serie A, Bundesliga, LDC', '', 'PSG, Juventus, Bayern Munich '),
(278, 'Sergio', ' Ramos', 'Espagne', 0, 'Ligue 1,LaLiga, LDC', 'Coupe du Monde,Euro', 'PSG, Real Madrid, FC Seville'),
(281, 'Gianluigi', ' Donnarumma', 'Italie', 0, 'Ligue 1', 'Euro', 'PSG, AC Milan'),
(283, 'Ngolo', 'Kante', 'France', 0, 'Premier Leauge, LDC', 'Coupe du Monde', 'Chelsea, Leicester'),
(285, 'Thiago', ' Silva', 'Brésil', 0, 'Ligue 1,Serie A, LDC', 'Copa América', 'Chelsea, PSG, AC Milan'),
(288, 'Jude', 'Bellingham', 'Angleterre', 0, 'LaLiga, LDC', '', 'Real Madrid, Borussia Dortmund'),
(290, 'Nicolas', ' Anelka', 'France', 0, 'Premier League,Serie A, LDC', 'Euro', 'Real Madrid, PSG, Arsenal, Liverpool, Manchester City, Chelsea, West Bromwich'),
(297, 'David', ' De Gea', 'Espagne', 0, 'Premier League', 'Euro', 'Manchester United, Atletico Madrid, Fiorentina'),
(298, 'Reece', ' James', 'Angleterre', 0, 'LDC', '', 'Chelsea'),
(299, 'Alexander', ' Arnold', 'Angleterre', 0, 'Premier League, LDC', '', 'Liverpool'),
(300, 'Kyle', ' Walker', 'Angleterre', 0, 'Premier League, LDC', '', 'Manchester City, Aston Villa, Tottenham, Sheffield United'),
(301, 'Gerard', ' Piqué', 'Espagne', 0, 'Premier League, LaLiga, LDC', 'Coupe du Monde,Euro', 'FC Barcelone, Manchester United'),
(302, 'Salvatore', 'Sirigu', 'Italie', 0, 'Ligue 1', 'Euro', 'PSG, Torino, Naples, FC Seville, OGC Nice'),
(303, 'Aurelien', 'Tchouamenie', 'France', 0, 'LaLiga, LDC', '', 'Real Madrid, AS Monaco, Bordeaux'),
(304, 'David', ' Luiz', 'Brésil', 0, 'Ligue 1, Premier League, LDC', '', 'Chelsea, PSG, Arsenal'),
(305, 'Kobbie', 'Mainoo', 'Angleterre', 0, '', '', 'Manchester United'),
(306, 'Anthony', ' Martial', 'France', 0, '', '', 'Manchester United, AS Monaco, Lyon, FC Seville'),
(307, 'Kepa', ' Arrizabalaga', 'Espagne', 0, 'LaLiga, LDC', 'Euro', 'Chelsea, Athletic Bilbao, Real Madrid'),
(308, 'Jesse', ' Lingard', 'Angleterre', 0, '', '', 'Manchester United, Leicester, Brighton, West Ham, Nottingham Forest'),
(309, 'Phil', ' Foden', 'Angleterre', 0, 'Premier League, LDC', '', 'Manchester City'),
(310, 'Ousmane', ' Dembele', 'France', 0, 'Ligue 1,LaLiga', 'Coupe du Monde', 'PSG, FC Barcelone, Borrussia Dortmund, Stade Rennais ');

-- --------------------------------------------------------

--
-- Structure de la table `joueur_trophées`
--

CREATE TABLE `joueur_trophées` (
  `joueur_id` int(11) DEFAULT NULL,
  `trophée_id` int(11) DEFAULT NULL,
  `remporté` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `joueur_trophées`
--

INSERT INTO `joueur_trophées` (`joueur_id`, `trophée_id`, `remporté`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(4, 3, 1),
(5, 3, 0),
(2, 3, 1),
(1, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `titres_internationaux`
--

CREATE TABLE `titres_internationaux` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `titres_internationaux`
--

INSERT INTO `titres_internationaux` (`id`, `nom`) VALUES
(1, 'Coupe du Monde'),
(2, 'Euro'),
(3, 'Copa América');

-- --------------------------------------------------------

--
-- Structure de la table `titres_ligue`
--

CREATE TABLE `titres_ligue` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `titres_ligue`
--

INSERT INTO `titres_ligue` (`id`, `nom`) VALUES
(1, 'Premier League'),
(2, 'LaLiga'),
(3, 'Ligue 1'),
(4, 'Serie A'),
(5, 'Bundesliga');

-- --------------------------------------------------------

--
-- Structure de la table `trophées`
--

CREATE TABLE `trophées` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trophées`
--

INSERT INTO `trophées` (`id`, `nom`) VALUES
(1, 'Ballon d\'Or'),
(2, 'Coupe du Monde'),
(3, 'Euro'),
(4, 'Copa América'),
(5, 'Ligue des champions');

-- --------------------------------------------------------

--
-- Structure de la table `équipes`
--

CREATE TABLE `équipes` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `équipes`
--

INSERT INTO `équipes` (`id`, `nom`, `pays`) VALUES
(1, 'Paris Saint-Germain', 'France'),
(2, 'Al Nassr', 'Arabie Saoudite'),
(3, 'FC Barcelone', 'Espagne'),
(4, 'Al Hilal', 'Arabie Saoudite'),
(5, 'Fiorentina', 'France'),
(6, 'Marseille', 'France'),
(7, 'AS Monaco', 'France'),
(8, 'Lyon', 'France'),
(9, 'Stade Rennais', 'France'),
(10, 'RC Lens', 'France'),
(11, 'Lille', 'France'),
(12, 'OGC Nice', 'France'),
(13, 'FC Nantes', 'France'),
(14, 'Montpellier', 'France'),
(15, 'Manchester City', 'Angleterre'),
(16, 'Liverpool', 'Angleterre'),
(17, 'Manchester United', 'Angleterre'),
(18, 'Arsenal', 'Angleterre'),
(19, 'Chelsea', 'Angleterre'),
(20, 'Tottenham', 'Angleterre'),
(21, 'Newcastle', 'Angleterre'),
(22, 'Aston Villa', 'Angleterre'),
(23, 'Brighton', 'Angleterre'),
(24, 'West Ham', 'Angleterre'),
(25, 'FC Barcelone', 'Espagne'),
(26, 'Real Madrid', 'Espagne'),
(27, 'Atletico Madrid', 'Espagne'),
(28, 'FC Seville', 'Espagne'),
(29, 'Real Sociedad', 'Espagne'),
(30, 'Real Betis', 'Espagne'),
(31, 'Villarreal', 'Espagne'),
(32, 'Athletic Bilbao', 'Espagne'),
(33, 'Valence', 'Espagne'),
(34, 'Leganes', 'Espagne'),
(35, 'Bayern Munich', 'Allemagne'),
(36, 'Borussia Dortmund', 'Allemagne'),
(37, 'RB Leipzig', 'Allemagne'),
(38, 'Bayer Leverkusen', 'Allemagne'),
(39, 'Francfort', 'Allemagne'),
(40, 'Werder Brême', 'Allemagne'),
(41, 'Union Berlin', 'Allemagne'),
(42, 'Wolfsburg', 'Allemagne'),
(43, 'Monchengladbach', 'Allemagne'),
(44, 'VfB Stuttgart', 'Allemagne'),
(45, 'AC Milan', 'Italie'),
(46, 'Inter Milan', 'Italie'),
(47, 'Juventus', 'Italie'),
(48, 'AS Roma', 'Italie'),
(49, 'Naples', 'Italie'),
(50, 'Lazio Rome', 'Italie'),
(51, 'Atalanta', 'Italie'),
(52, 'Sampdoria', 'Italie'),
(53, 'Torino', 'Italie'),
(54, 'Bologne', 'Italie'),
(55, 'Bordeaux', 'France'),
(56, 'Fulham', 'Angleterre'),
(57, 'Everton', 'Angleterre'),
(58, 'Nottingham Forest', 'Angleterre'),
(59, 'West Bromwich', 'Angleterre'),
(60, 'Wolverhampton', 'Angleterre'),
(61, 'Hambourg', 'Allemagne'),
(62, 'Manchester United', 'Angleterre'),
(63, 'Leicester', 'Angleterre'),
(64, 'Udinese', 'Italie'),
(65, 'Sunderland', 'Angleterre'),
(66, ' Burnley', 'Angleterre'),
(67, 'Leeds', 'Angleterre'),
(68, 'Schalke 04', 'Allemagne'),
(69, 'Metz', 'France'),
(70, 'Sheffield United', 'Angleterre'),
(71, 'Malaga', 'Angleterre');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clubs_joueurs`
--
ALTER TABLE `clubs_joueurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `joueur_id` (`joueur_id`);

--
-- Index pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `joueur_trophées`
--
ALTER TABLE `joueur_trophées`
  ADD KEY `joueur_id` (`joueur_id`),
  ADD KEY `trophée_id` (`trophée_id`);

--
-- Index pour la table `titres_internationaux`
--
ALTER TABLE `titres_internationaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `titres_ligue`
--
ALTER TABLE `titres_ligue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trophées`
--
ALTER TABLE `trophées`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `équipes`
--
ALTER TABLE `équipes`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clubs_joueurs`
--
ALTER TABLE `clubs_joueurs`
  ADD CONSTRAINT `clubs_joueurs_ibfk_1` FOREIGN KEY (`joueur_id`) REFERENCES `joueurs` (`id`);

--
-- Contraintes pour la table `joueur_trophées`
--
ALTER TABLE `joueur_trophées`
  ADD CONSTRAINT `joueur_trophées_ibfk_1` FOREIGN KEY (`joueur_id`) REFERENCES `joueurs` (`id`),
  ADD CONSTRAINT `joueur_trophées_ibfk_2` FOREIGN KEY (`trophée_id`) REFERENCES `trophées` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
