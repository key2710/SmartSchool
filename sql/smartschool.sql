-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 10, 2026 alle 18:29
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartschool`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `allegati`
--

CREATE TABLE `allegati` (
  `ID_allegato` int(11) NOT NULL,
  `nome_file` varchar(250) NOT NULL,
  `percorso_file` varchar(250) NOT NULL,
  `tipo_file` varchar(100) DEFAULT NULL,
  `id_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `classi`
--

CREATE TABLE `classi` (
  `ID_classe` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `sezione` varchar(5) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `genitori`
--

CREATE TABLE `genitori` (
  `ID_genitore` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cognome` varchar(70) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_studente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `moduli`
--

CREATE TABLE `moduli` (
  `ID_modulo` int(11) NOT NULL,
  `oggetto` varchar(300) NOT NULL,
  `contenuto` text NOT NULL,
  `data_invio` date NOT NULL,
  `id_studente` int(11) NOT NULL,
  `id_tipo_modulo` int(11) NOT NULL,
  `id_stato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `stati_richiesta`
--

CREATE TABLE `stati_richiesta` (
  `ID_stato` int(11) NOT NULL,
  `nome_stato` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `stati_richiesta`
--

INSERT INTO `stati_richiesta` (`ID_stato`, `nome_stato`) VALUES
(3, 'COMPLETATO'),
(2, 'IN LAVORAZIONE'),
(1, 'INVIATO'),
(4, 'RESPINTO');

-- --------------------------------------------------------

--
-- Struttura della tabella `storico_comunicazioni`
--

CREATE TABLE `storico_comunicazioni` (
  `ID_storico` int(11) NOT NULL,
  `messaggio` text NOT NULL,
  `data_comunicazione` date NOT NULL,
  `id_modulo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `ID_studente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `email_istituzionale` varchar(100) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `id_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipologie_modulo`
--

CREATE TABLE `tipologie_modulo` (
  `ID_tipo_modulo` int(11) NOT NULL,
  `nome_tipo` varchar(100) NOT NULL,
  `descrizione` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `allegati`
--
ALTER TABLE `allegati`
  ADD PRIMARY KEY (`ID_allegato`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`ID_classe`),
  ADD UNIQUE KEY `anno` (`anno`,`sezione`,`indirizzo`);

--
-- Indici per le tabelle `genitori`
--
ALTER TABLE `genitori`
  ADD PRIMARY KEY (`ID_genitore`),
  ADD KEY `id_studente` (`id_studente`);

--
-- Indici per le tabelle `moduli`
--
ALTER TABLE `moduli`
  ADD PRIMARY KEY (`ID_modulo`),
  ADD KEY `id_studente` (`id_studente`),
  ADD KEY `id_tipo_modulo` (`id_tipo_modulo`),
  ADD KEY `id_stato` (`id_stato`);

--
-- Indici per le tabelle `stati_richiesta`
--
ALTER TABLE `stati_richiesta`
  ADD PRIMARY KEY (`ID_stato`),
  ADD UNIQUE KEY `nome_stato` (`nome_stato`);

--
-- Indici per le tabelle `storico_comunicazioni`
--
ALTER TABLE `storico_comunicazioni`
  ADD PRIMARY KEY (`ID_storico`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`ID_studente`),
  ADD UNIQUE KEY `email_istituzionale` (`email_istituzionale`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Indici per le tabelle `tipologie_modulo`
--
ALTER TABLE `tipologie_modulo`
  ADD PRIMARY KEY (`ID_tipo_modulo`),
  ADD UNIQUE KEY `nome_tipo` (`nome_tipo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `allegati`
--
ALTER TABLE `allegati`
  MODIFY `ID_allegato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `classi`
--
ALTER TABLE `classi`
  MODIFY `ID_classe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `genitori`
--
ALTER TABLE `genitori`
  MODIFY `ID_genitore` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `moduli`
--
ALTER TABLE `moduli`
  MODIFY `ID_modulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `stati_richiesta`
--
ALTER TABLE `stati_richiesta`
  MODIFY `ID_stato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `storico_comunicazioni`
--
ALTER TABLE `storico_comunicazioni`
  MODIFY `ID_storico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `studenti`
--
ALTER TABLE `studenti`
  MODIFY `ID_studente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tipologie_modulo`
--
ALTER TABLE `tipologie_modulo`
  MODIFY `ID_tipo_modulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `allegati`
--
ALTER TABLE `allegati`
  ADD CONSTRAINT `allegati_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `moduli` (`ID_modulo`);

--
-- Limiti per la tabella `genitori`
--
ALTER TABLE `genitori`
  ADD CONSTRAINT `genitori_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`ID_studente`);

--
-- Limiti per la tabella `moduli`
--
ALTER TABLE `moduli`
  ADD CONSTRAINT `moduli_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`ID_studente`),
  ADD CONSTRAINT `moduli_ibfk_2` FOREIGN KEY (`id_tipo_modulo`) REFERENCES `tipologie_modulo` (`ID_tipo_modulo`),
  ADD CONSTRAINT `moduli_ibfk_3` FOREIGN KEY (`id_stato`) REFERENCES `stati_richiesta` (`ID_stato`);

--
-- Limiti per la tabella `storico_comunicazioni`
--
ALTER TABLE `storico_comunicazioni`
  ADD CONSTRAINT `storico_comunicazioni_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `moduli` (`ID_modulo`);

--
-- Limiti per la tabella `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`ID_classe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
