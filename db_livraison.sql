-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 11 mars 2023 à 21:02
-- Version du serveur :  10.1.29-MariaDB
-- Version de PHP :  7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_livraison`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `admin_id` int(11) NOT NULL,
  `User_id` varchar(12) COLLATE utf8_bin NOT NULL,
  `role` enum('principale','secondaire','','') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `assistance`
--

CREATE TABLE `assistance` (
  `num` int(11) NOT NULL,
  `contenue` text COLLATE utf8_bin NOT NULL,
  `user` varchar(12) COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  `centre_assis` enum('chauffeur','client','','') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `avis_client`
--

CREATE TABLE `avis_client` (
  `num` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `commentaire` text COLLATE utf8_bin NOT NULL,
  `date_avis` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `chauffeur`
--

CREATE TABLE `chauffeur` (
  `Chauffeur_id` int(11) NOT NULL,
  `User_id` varchar(12) COLLATE utf8_bin NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `CIN` text COLLATE utf8_bin NOT NULL,
  `addresse_client` text COLLATE utf8_bin NOT NULL,
  `User` varchar(12) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `coli`
--

CREATE TABLE `coli` (
  `num` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `largeur` double DEFAULT NULL,
  `longeur` double DEFAULT NULL,
  `profondeur` double DEFAULT NULL,
  `poids` double DEFAULT NULL,
  `quantite` int(11) DEFAULT '1',
  `demmande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `Demande_id` int(11) NOT NULL,
  `prix_Demande` double NOT NULL,
  `date_Demande` datetime NOT NULL,
  `date_limite` datetime NOT NULL,
  `cllient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `num_Livraison` int(11) NOT NULL,
  `time_serv` time NOT NULL,
  `date` date NOT NULL,
  `prix` double NOT NULL,
  `commentaire` int(11) DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `etat` int(11) NOT NULL,
  `demande` int(11) NOT NULL,
  `chauffeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `recepteur` varchar(12) COLLATE utf8_bin NOT NULL,
  `emetteur` varchar(12) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `offre_proposer`
--

CREATE TABLE `offre_proposer` (
  `offre_id` int(11) NOT NULL,
  `new_prix` double NOT NULL,
  `new_date` datetime NOT NULL,
  `Demande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `payement`
--

CREATE TABLE `payement` (
  `payement_id` int(11) NOT NULL,
  `date_payement` datetime NOT NULL,
  `type_payement` enum('cod','carte_bancaire','','') COLLATE utf8_bin NOT NULL,
  `livraison` int(11) NOT NULL,
  `status` enum('en_attente','accepte','refuse','') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `User_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `Nom` varchar(30) COLLATE utf8_bin NOT NULL,
  `Prenom` varchar(30) COLLATE utf8_bin NOT NULL,
  `Ville` varchar(30) COLLATE utf8_bin NOT NULL,
  `Username` varchar(12) COLLATE utf8_bin NOT NULL,
  `Email` varchar(255) COLLATE utf8_bin NOT NULL,
  `Phone` text COLLATE utf8_bin NOT NULL,
  `Password` varchar(30) COLLATE utf8_bin NOT NULL,
  `Image` text COLLATE utf8_bin NOT NULL,
  `date_inscription` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `validation_chauffeur`
--

CREATE TABLE `validation_chauffeur` (
  `validation_id` int(11) NOT NULL,
  `permis_conduit` text COLLATE utf8_bin NOT NULL,
  `carte_grise` text COLLATE utf8_bin NOT NULL,
  `capacite_vehicule` double NOT NULL,
  `type_vehicule` enum('camion','voiture','moto','autre') COLLATE utf8_bin NOT NULL,
  `etat_chauffeur` tinyint(1) NOT NULL,
  `chauffeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Index pour la table `assistance`
--
ALTER TABLE `assistance`
  ADD PRIMARY KEY (`num`),
  ADD KEY `user` (`user`);

--
-- Index pour la table `avis_client`
--
ALTER TABLE `avis_client`
  ADD PRIMARY KEY (`num`),
  ADD KEY `client` (`client`);

--
-- Index pour la table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD PRIMARY KEY (`Chauffeur_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `User` (`User`);

--
-- Index pour la table `coli`
--
ALTER TABLE `coli`
  ADD PRIMARY KEY (`num`),
  ADD KEY `demmande` (`demmande`);

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`Demande_id`),
  ADD KEY `cllient` (`cllient`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`num_Livraison`),
  ADD KEY `demande` (`demande`),
  ADD KEY `chauffeur` (`chauffeur`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `recepteur` (`recepteur`),
  ADD KEY `emetteur` (`emetteur`);

--
-- Index pour la table `offre_proposer`
--
ALTER TABLE `offre_proposer`
  ADD PRIMARY KEY (`offre_id`),
  ADD KEY `Demande` (`Demande`);

--
-- Index pour la table `payement`
--
ALTER TABLE `payement`
  ADD PRIMARY KEY (`payement_id`),
  ADD KEY `livraison` (`livraison`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`User_id`);

--
-- Index pour la table `validation_chauffeur`
--
ALTER TABLE `validation_chauffeur`
  ADD PRIMARY KEY (`validation_id`),
  ADD KEY `chauffeur` (`chauffeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assistance`
--
ALTER TABLE `assistance`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `avis_client`
--
ALTER TABLE `avis_client`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `Demande_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `num_Livraison` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `offre_proposer`
--
ALTER TABLE `offre_proposer`
  MODIFY `offre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payement`
--
ALTER TABLE `payement`
  MODIFY `payement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `validation_chauffeur`
--
ALTER TABLE `validation_chauffeur`
  MODIFY `validation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `utilisateur` (`User_id`);

--
-- Contraintes pour la table `assistance`
--
ALTER TABLE `assistance`
  ADD CONSTRAINT `assistance_ibfk_1` FOREIGN KEY (`user`) REFERENCES `utilisateur` (`User_id`);

--
-- Contraintes pour la table `avis_client`
--
ALTER TABLE `avis_client`
  ADD CONSTRAINT `avis_client_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`client_id`);

--
-- Contraintes pour la table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD CONSTRAINT `chauffeur_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `utilisateur` (`User_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`User`) REFERENCES `utilisateur` (`User_id`);

--
-- Contraintes pour la table `coli`
--
ALTER TABLE `coli`
  ADD CONSTRAINT `coli_ibfk_1` FOREIGN KEY (`demmande`) REFERENCES `demande` (`Demande_id`);

--
-- Contraintes pour la table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `demande_ibfk_1` FOREIGN KEY (`cllient`) REFERENCES `client` (`client_id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`demande`) REFERENCES `demande` (`Demande_id`),
  ADD CONSTRAINT `livraison_ibfk_2` FOREIGN KEY (`chauffeur`) REFERENCES `chauffeur` (`Chauffeur_id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`recepteur`) REFERENCES `utilisateur` (`User_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`emetteur`) REFERENCES `utilisateur` (`User_id`);

--
-- Contraintes pour la table `offre_proposer`
--
ALTER TABLE `offre_proposer`
  ADD CONSTRAINT `offre_proposer_ibfk_1` FOREIGN KEY (`Demande`) REFERENCES `demande` (`Demande_id`);

--
-- Contraintes pour la table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `payement_ibfk_1` FOREIGN KEY (`livraison`) REFERENCES `livraison` (`num_Livraison`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `validation_chauffeur`
--
ALTER TABLE `validation_chauffeur`
  ADD CONSTRAINT `validation_chauffeur_ibfk_1` FOREIGN KEY (`chauffeur`) REFERENCES `chauffeur` (`Chauffeur_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
