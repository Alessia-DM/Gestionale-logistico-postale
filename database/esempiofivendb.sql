-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Apr 13, 2026 alle 12:11
-- Versione del server: 5.7.24
-- Versione PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esempiofivendb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `idCliente` int(11) NOT NULL,
  `codiceCliente` varchar(50) NOT NULL,
  `ragioneSociale` varchar(255) NOT NULL,
  `partitaIva` varchar(50) NOT NULL,
  `descrizioneCliente` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`idCliente`, `codiceCliente`, `ragioneSociale`, `partitaIva`, `descrizioneCliente`) VALUES
(0, 'CL-0000', 'Privato', '00000000000', NULL),
(1, 'CL-0001', 'Pitti Immagine', '01234567890', 'Settore Moda - Campionari'),
(2, 'CL-0002', 'Gucci Logistica', '09876543210', 'Archivio Pelletteria'),
(3, 'CL-0003', 'Intesa San Paolo', '04455667788', 'Documentazione Mutui'),
(4, 'CL-0004', 'Generali Assicurazioni', '01122334455', 'Polizze Vita - Archivio'),
(22, 'CL-0005', 'Ferrari S.p.A.', '00173961361', 'Divisione Logistica Ricambi - Urgente'),
(23, 'CL-0006', 'Eni S.p.A.', '00905821006', 'Contratti Fornitura Gas/Luce'),
(25, 'CL-0008', 'Prada S.p.A.', '01340400525', 'Spedizioni Alta Moda - Showroom Milano'),
(26, 'CL-0009', 'UniCredit S.p.A.', '00348270101', 'Archivio Pratiche Fidi - Sede Centrale'),
(27, 'CL-0010', 'Luxottica Group S.p.A.', '10182640250', 'Logistica Montature e Accessori');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti_privati`
--

CREATE TABLE `clienti_privati` (
  `idPrivato` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `codiceFiscale` varchar(25) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idScatolaFK` int(11) DEFAULT NULL,
  `idSpedizioneFK` int(11) DEFAULT NULL,
  `idDdtFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `clienti_privati`
--

INSERT INTO `clienti_privati` (`idPrivato`, `nome`, `cognome`, `codiceFiscale`, `email`, `idScatolaFK`, `idSpedizioneFK`, `idDdtFK`) VALUES
(2, 'Michele', 'Cicoria', 'CCRMCL87P23B987I', 'micheche@gmail.com', 106, NULL, 9),
(3, 'Angelo', 'Lettera', 'LTTNGL97G27D123C', 'angilett@hotmail.it', 107, NULL, 9),
(4, 'Vincenzo', 'Amico', 'MCOVNC77P13D123H', 'vixami@live.it', 108, NULL, 9),
(5, 'Carlo', 'Cracco', 'CRCCRL89F13C765L', 'craccoca@yahoo.it', NULL, NULL, 11),
(6, 'Luigino', 'Barbieri', 'BRBLGN65M12L456P', 'ggbb@virgilio.it', 110, NULL, 11);

-- --------------------------------------------------------

--
-- Struttura della tabella `ddt`
--

CREATE TABLE `ddt` (
  `idDdt` int(11) UNSIGNED NOT NULL,
  `idSpedizioneFK` int(11) DEFAULT NULL,
  `codiceDdt` varchar(50) NOT NULL,
  `idOperatoreFK` int(11) NOT NULL,
  `idClienteFK` int(11) NOT NULL,
  `dataCreazione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataArrivo` datetime DEFAULT NULL,
  `numeroColliDichiarati` int(11) DEFAULT NULL,
  `statoDdt` enum('Creato','In Attesa','In Arrivo','In Lavorazione','In Giacenza','Consegnato','Annullato') DEFAULT 'Creato',
  `descrizione` text,
  `noteVettore` text,
  `vettoreDdt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ddt`
--

INSERT INTO `ddt` (`idDdt`, `idSpedizioneFK`, `codiceDdt`, `idOperatoreFK`, `idClienteFK`, `dataCreazione`, `dataArrivo`, `numeroColliDichiarati`, `statoDdt`, `descrizione`, `noteVettore`, `vettoreDdt`) VALUES
(1, 1, 'DDT8899', 6, 1, '2026-02-26 12:08:19', '2026-02-20 09:15:00', 25, 'In Lavorazione', 'Campionari Tessili Pitti', 'Consegnare al magazzino 4', 'Bartolini'),
(2, 2, 'DDT9900', 9, 2, '2026-02-26 12:08:19', '2026-02-21 10:30:00', 25, 'In Giacenza', 'Archivio Pelletteria Gucci', 'Pacco voluminoso', 'SDA'),
(3, 3, 'DDT1011', 6, 3, '2026-02-24 12:08:19', '2026-02-22 14:00:00', 25, 'In Lavorazione', 'Pratiche Mutui Intesa San Paolo', 'Documenti Riservati', 'DHL'),
(4, 4, 'DDT1212', 9, 4, '2026-02-28 12:08:19', NULL, 25, 'Creato', 'Polizze Assicurative Generali', 'Ritiro programmato lunedì', 'Poste Italiane'),
(9, NULL, 'DDT1717', 1, 0, '2026-03-18 15:07:22', NULL, 6, 'Creato', '', NULL, NULL),
(11, NULL, 'DDT3001', 1, 0, '2026-03-19 11:29:16', NULL, 2, 'Creato', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `documenti`
--

CREATE TABLE `documenti` (
  `idDocumento` int(11) NOT NULL,
  `barcodeDocumento` varchar(100) NOT NULL,
  `tipoDocumento` varchar(100) NOT NULL DEFAULT 'Generico',
  `statoDocumento` enum('Inserito','In Preparazione','Indicizzato','Verificato','Da Scansionare','Scansionato','In Revisione','Scartato') NOT NULL DEFAULT 'Da Scansionare',
  `idMazzettaFK` int(11) NOT NULL,
  `percorsoFile` varchar(255) DEFAULT NULL,
  `dataScansione` timestamp NULL DEFAULT NULL,
  `note` text,
  `idOperatoreFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `documenti`
--

INSERT INTO `documenti` (`idDocumento`, `barcodeDocumento`, `tipoDocumento`, `statoDocumento`, `idMazzettaFK`, `percorsoFile`, `dataScansione`, `note`, `idOperatoreFK`) VALUES
(1, 'DOC-1-1', 'Contratto', 'Scansionato', 1, NULL, NULL, NULL, 9),
(2, 'DOC-1-2', 'Modulo Privacy', 'Scansionato', 1, NULL, NULL, NULL, 9),
(3, 'DOC-1-3', 'Documento Identità', 'Scansionato', 1, NULL, NULL, 'Firma mancante', 9),
(4, 'DOC-1-4', 'Fattura', 'Scansionato', 1, NULL, NULL, NULL, 9),
(5, 'DOC-1-5', 'Contratto', 'Scansionato', 1, NULL, NULL, NULL, 9),
(6, 'DOC-32-1', 'Contratto', 'In Revisione', 32, NULL, NULL, NULL, 1),
(7, 'DOC-32-2', 'Modulo Privacy', 'In Revisione', 32, NULL, NULL, NULL, 1),
(8, 'DOC-32-3', 'Documento Identità', 'In Revisione', 32, NULL, NULL, 'Firma mancante', 1),
(9, 'DOC-32-4', 'Fattura', 'In Revisione', 32, NULL, NULL, NULL, 1),
(10, 'DOC-32-5', 'Contratto', 'In Revisione', 32, NULL, NULL, NULL, 1),
(11, 'DOC-2-1', 'Contratto', 'In Revisione', 2, NULL, NULL, NULL, 1),
(12, 'DOC-2-2', 'Modulo Privacy', 'In Revisione', 2, NULL, NULL, NULL, 1),
(13, 'DOC-2-3', 'Documento Identità', 'In Revisione', 2, NULL, NULL, 'Firma mancante', 1),
(14, 'DOC-2-4', 'Fattura', 'In Revisione', 2, NULL, NULL, NULL, 1),
(15, 'DOC-2-5', 'Contratto', 'In Revisione', 2, NULL, NULL, NULL, 1),
(16, 'DOC-33-1', 'Contratto', 'Da Scansionare', 33, NULL, NULL, NULL, 2),
(17, 'DOC-33-2', 'Modulo Privacy', 'Da Scansionare', 33, NULL, NULL, NULL, 2),
(18, 'DOC-33-3', 'Documento Identità', 'Da Scansionare', 33, NULL, NULL, 'Firma mancante', 2),
(19, 'DOC-33-4', 'Fattura', 'Da Scansionare', 33, NULL, NULL, NULL, 2),
(20, 'DOC-33-5', 'Contratto', 'Da Scansionare', 33, NULL, NULL, NULL, 2),
(21, 'DOC-3-1', 'Contratto', 'Da Scansionare', 3, NULL, NULL, NULL, 2),
(22, 'DOC-3-2', 'Modulo Privacy', 'Da Scansionare', 3, NULL, NULL, NULL, 2),
(23, 'DOC-3-3', 'Documento Identità', 'Da Scansionare', 3, NULL, NULL, 'Firma mancante', 2),
(24, 'DOC-3-4', 'Fattura', 'Da Scansionare', 3, NULL, NULL, NULL, 2),
(25, 'DOC-3-5', 'Contratto', 'Da Scansionare', 3, NULL, NULL, NULL, 2),
(26, 'DOC-34-1', 'Contratto', 'Scansionato', 34, NULL, NULL, NULL, 3),
(27, 'DOC-34-2', 'Modulo Privacy', 'Scansionato', 34, NULL, NULL, NULL, 3),
(28, 'DOC-34-3', 'Documento Identità', 'Scansionato', 34, NULL, NULL, 'Firma mancante', 3),
(29, 'DOC-34-4', 'Fattura', 'Scansionato', 34, NULL, NULL, NULL, 3),
(30, 'DOC-34-5', 'Contratto', 'Scansionato', 34, NULL, NULL, NULL, 3),
(31, 'DOC-4-1', 'Contratto', 'Scansionato', 4, NULL, NULL, NULL, 3),
(32, 'DOC-4-2', 'Modulo Privacy', 'Scansionato', 4, NULL, NULL, NULL, 3),
(33, 'DOC-4-3', 'Documento Identità', 'Scansionato', 4, NULL, NULL, 'Firma mancante', 3),
(34, 'DOC-4-4', 'Fattura', 'Scansionato', 4, NULL, NULL, NULL, 3),
(35, 'DOC-4-5', 'Contratto', 'Scansionato', 4, NULL, NULL, NULL, 3),
(36, 'DOC-35-1', 'Contratto', 'In Revisione', 35, NULL, NULL, NULL, 12),
(37, 'DOC-35-2', 'Modulo Privacy', 'In Revisione', 35, NULL, NULL, NULL, 12),
(38, 'DOC-35-3', 'Documento Identità', 'In Revisione', 35, NULL, NULL, 'Firma mancante', 12),
(39, 'DOC-35-4', 'Fattura', 'In Revisione', 35, NULL, NULL, NULL, 12),
(40, 'DOC-35-5', 'Contratto', 'In Revisione', 35, NULL, NULL, NULL, 12),
(41, 'DOC-5-1', 'Contratto', 'In Revisione', 5, NULL, NULL, NULL, 12),
(42, 'DOC-5-2', 'Modulo Privacy', 'In Revisione', 5, NULL, NULL, NULL, 12),
(43, 'DOC-5-3', 'Documento Identità', 'In Revisione', 5, NULL, NULL, 'Firma mancante', 12),
(44, 'DOC-5-4', 'Fattura', 'In Revisione', 5, NULL, NULL, NULL, 12),
(45, 'DOC-5-5', 'Contratto', 'In Revisione', 5, NULL, NULL, NULL, 12),
(46, 'DOC-36-1', 'Contratto', 'Da Scansionare', 36, NULL, NULL, NULL, 6),
(47, 'DOC-36-2', 'Modulo Privacy', 'Da Scansionare', 36, NULL, NULL, NULL, 6),
(48, 'DOC-36-3', 'Documento Identità', 'Da Scansionare', 36, NULL, NULL, 'Firma mancante', 6),
(49, 'DOC-36-4', 'Fattura', 'Da Scansionare', 36, NULL, NULL, NULL, 6),
(50, 'DOC-36-5', 'Contratto', 'Da Scansionare', 36, NULL, NULL, NULL, 6),
(51, 'DOC-6-1', 'Contratto', 'Da Scansionare', 6, NULL, NULL, NULL, 6),
(52, 'DOC-6-2', 'Modulo Privacy', 'Da Scansionare', 6, NULL, NULL, NULL, 6),
(53, 'DOC-6-3', 'Documento Identità', 'Da Scansionare', 6, NULL, NULL, 'Firma mancante', 6),
(54, 'DOC-6-4', 'Fattura', 'Da Scansionare', 6, NULL, NULL, NULL, 6),
(55, 'DOC-6-5', 'Contratto', 'Da Scansionare', 6, NULL, NULL, NULL, 6),
(56, 'DOC-37-1', 'Contratto', 'Scansionato', 37, NULL, NULL, NULL, 9),
(57, 'DOC-37-2', 'Modulo Privacy', 'Scansionato', 37, NULL, NULL, NULL, 9),
(58, 'DOC-37-3', 'Documento Identità', 'Scansionato', 37, NULL, NULL, 'Firma mancante', 9),
(59, 'DOC-37-4', 'Fattura', 'Scansionato', 37, NULL, NULL, NULL, 9),
(60, 'DOC-37-5', 'Contratto', 'Scansionato', 37, NULL, NULL, NULL, 9),
(61, 'DOC-7-1', 'Contratto', 'Scansionato', 7, NULL, NULL, NULL, 9),
(62, 'DOC-7-2', 'Modulo Privacy', 'Scansionato', 7, NULL, NULL, NULL, 9),
(63, 'DOC-7-3', 'Documento Identità', 'Scansionato', 7, NULL, NULL, 'Firma mancante', 9),
(64, 'DOC-7-4', 'Fattura', 'Scansionato', 7, NULL, NULL, NULL, 9),
(65, 'DOC-7-5', 'Contratto', 'Scansionato', 7, NULL, NULL, NULL, 9),
(66, 'DOC-38-1', 'Contratto', 'In Revisione', 38, NULL, NULL, NULL, 1),
(67, 'DOC-38-2', 'Modulo Privacy', 'In Revisione', 38, NULL, NULL, NULL, 1),
(68, 'DOC-38-3', 'Documento Identità', 'In Revisione', 38, NULL, NULL, 'Firma mancante', 1),
(69, 'DOC-38-4', 'Fattura', 'In Revisione', 38, NULL, NULL, NULL, 1),
(70, 'DOC-38-5', 'Contratto', 'In Revisione', 38, NULL, NULL, NULL, 1),
(71, 'DOC-8-1', 'Contratto', 'In Revisione', 8, NULL, NULL, NULL, 1),
(72, 'DOC-8-2', 'Modulo Privacy', 'In Revisione', 8, NULL, NULL, NULL, 1),
(73, 'DOC-8-3', 'Documento Identità', 'In Revisione', 8, NULL, NULL, 'Firma mancante', 1),
(74, 'DOC-8-4', 'Fattura', 'In Revisione', 8, NULL, NULL, NULL, 1),
(75, 'DOC-8-5', 'Contratto', 'In Revisione', 8, NULL, NULL, NULL, 1),
(76, 'DOC-39-1', 'Contratto', 'Da Scansionare', 39, NULL, NULL, NULL, 2),
(77, 'DOC-39-2', 'Modulo Privacy', 'Da Scansionare', 39, NULL, NULL, NULL, 2),
(78, 'DOC-39-3', 'Documento Identità', 'Da Scansionare', 39, NULL, NULL, 'Firma mancante', 2),
(79, 'DOC-39-4', 'Fattura', 'Da Scansionare', 39, NULL, NULL, NULL, 2),
(80, 'DOC-39-5', 'Contratto', 'Da Scansionare', 39, NULL, NULL, NULL, 2),
(81, 'DOC-9-1', 'Contratto', 'Da Scansionare', 9, NULL, NULL, NULL, 2),
(82, 'DOC-9-2', 'Modulo Privacy', 'Da Scansionare', 9, NULL, NULL, NULL, 2),
(83, 'DOC-9-3', 'Documento Identità', 'Da Scansionare', 9, NULL, NULL, 'Firma mancante', 2),
(84, 'DOC-9-4', 'Fattura', 'Da Scansionare', 9, NULL, NULL, NULL, 2),
(85, 'DOC-9-5', 'Contratto', 'Da Scansionare', 9, NULL, NULL, NULL, 2),
(86, 'DOC-40-1', 'Contratto', 'Scansionato', 40, NULL, NULL, NULL, 3),
(87, 'DOC-40-2', 'Modulo Privacy', 'Scansionato', 40, NULL, NULL, NULL, 3),
(88, 'DOC-40-3', 'Documento Identità', 'Scansionato', 40, NULL, NULL, 'Firma mancante', 3),
(89, 'DOC-40-4', 'Fattura', 'Scansionato', 40, NULL, NULL, NULL, 3),
(90, 'DOC-40-5', 'Contratto', 'Scansionato', 40, NULL, NULL, NULL, 3),
(91, 'DOC-10-1', 'Contratto', 'Scansionato', 10, NULL, NULL, NULL, 3),
(92, 'DOC-10-2', 'Modulo Privacy', 'Scansionato', 10, NULL, NULL, NULL, 3),
(93, 'DOC-10-3', 'Documento Identità', 'Scansionato', 10, NULL, NULL, 'Firma mancante', 3),
(94, 'DOC-10-4', 'Fattura', 'Scansionato', 10, NULL, NULL, NULL, 3),
(95, 'DOC-10-5', 'Contratto', 'Scansionato', 10, NULL, NULL, NULL, 3),
(96, 'DOC-41-1', 'Contratto', 'In Revisione', 41, NULL, NULL, NULL, 12),
(97, 'DOC-41-2', 'Modulo Privacy', 'In Revisione', 41, NULL, NULL, NULL, 12),
(98, 'DOC-41-3', 'Documento Identità', 'In Revisione', 41, NULL, NULL, 'Firma mancante', 12),
(99, 'DOC-41-4', 'Fattura', 'In Revisione', 41, NULL, NULL, NULL, 12),
(100, 'DOC-41-5', 'Contratto', 'In Revisione', 41, NULL, NULL, NULL, 12),
(101, 'DOC-11-1', 'Contratto', 'In Revisione', 11, NULL, NULL, NULL, 12),
(102, 'DOC-11-2', 'Modulo Privacy', 'In Revisione', 11, NULL, NULL, NULL, 12),
(103, 'DOC-11-3', 'Documento Identità', 'In Revisione', 11, NULL, NULL, 'Firma mancante', 12),
(104, 'DOC-11-4', 'Fattura', 'In Revisione', 11, NULL, NULL, NULL, 12),
(105, 'DOC-11-5', 'Contratto', 'In Revisione', 11, NULL, NULL, NULL, 12),
(106, 'DOC-42-1', 'Contratto', 'Da Scansionare', 42, NULL, NULL, NULL, 6),
(107, 'DOC-42-2', 'Modulo Privacy', 'Da Scansionare', 42, NULL, NULL, NULL, 6),
(108, 'DOC-42-3', 'Documento Identità', 'Da Scansionare', 42, NULL, NULL, 'Firma mancante', 6),
(109, 'DOC-42-4', 'Fattura', 'Da Scansionare', 42, NULL, NULL, NULL, 6),
(110, 'DOC-42-5', 'Contratto', 'Da Scansionare', 42, NULL, NULL, NULL, 6),
(111, 'DOC-12-1', 'Contratto', 'Da Scansionare', 12, NULL, NULL, NULL, 6),
(112, 'DOC-12-2', 'Modulo Privacy', 'Da Scansionare', 12, NULL, NULL, NULL, 6),
(113, 'DOC-12-3', 'Documento Identità', 'Da Scansionare', 12, NULL, NULL, 'Firma mancante', 6),
(114, 'DOC-12-4', 'Fattura', 'Da Scansionare', 12, NULL, NULL, NULL, 6),
(115, 'DOC-12-5', 'Contratto', 'Da Scansionare', 12, NULL, NULL, NULL, 6),
(116, 'DOC-43-1', 'Contratto', 'Scansionato', 43, NULL, NULL, NULL, 9),
(117, 'DOC-43-2', 'Modulo Privacy', 'Scansionato', 43, NULL, NULL, NULL, 9),
(118, 'DOC-43-3', 'Documento Identità', 'Scansionato', 43, NULL, NULL, 'Firma mancante', 9),
(119, 'DOC-43-4', 'Fattura', 'Scansionato', 43, NULL, NULL, NULL, 9),
(120, 'DOC-43-5', 'Contratto', 'Scansionato', 43, NULL, NULL, NULL, 9),
(121, 'DOC-13-1', 'Contratto', 'Scansionato', 13, NULL, NULL, NULL, 9),
(122, 'DOC-13-2', 'Modulo Privacy', 'Scansionato', 13, NULL, NULL, NULL, 9),
(123, 'DOC-13-3', 'Documento Identità', 'Scansionato', 13, NULL, NULL, 'Firma mancante', 9),
(124, 'DOC-13-4', 'Fattura', 'Scansionato', 13, NULL, NULL, NULL, 9),
(125, 'DOC-13-5', 'Contratto', 'Scansionato', 13, NULL, NULL, NULL, 9),
(126, 'DOC-44-1', 'Contratto', 'In Revisione', 44, NULL, NULL, NULL, 1),
(127, 'DOC-44-2', 'Modulo Privacy', 'In Revisione', 44, NULL, NULL, NULL, 1),
(128, 'DOC-44-3', 'Documento Identità', 'In Revisione', 44, NULL, NULL, 'Firma mancante', 1),
(129, 'DOC-44-4', 'Fattura', 'In Revisione', 44, NULL, NULL, NULL, 1),
(130, 'DOC-44-5', 'Contratto', 'In Revisione', 44, NULL, NULL, NULL, 1),
(131, 'DOC-14-1', 'Contratto', 'In Revisione', 14, NULL, NULL, NULL, 1),
(132, 'DOC-14-2', 'Modulo Privacy', 'In Revisione', 14, NULL, NULL, NULL, 1),
(133, 'DOC-14-3', 'Documento Identità', 'In Revisione', 14, NULL, NULL, 'Firma mancante', 1),
(134, 'DOC-14-4', 'Fattura', 'In Revisione', 14, NULL, NULL, NULL, 1),
(135, 'DOC-14-5', 'Contratto', 'In Revisione', 14, NULL, NULL, NULL, 1),
(136, 'DOC-45-1', 'Contratto', 'Da Scansionare', 45, NULL, NULL, NULL, 2),
(137, 'DOC-45-2', 'Modulo Privacy', 'Da Scansionare', 45, NULL, NULL, NULL, 2),
(138, 'DOC-45-3', 'Documento Identità', 'Da Scansionare', 45, NULL, NULL, 'Firma mancante', 2),
(139, 'DOC-45-4', 'Fattura', 'Da Scansionare', 45, NULL, NULL, NULL, 2),
(140, 'DOC-45-5', 'Contratto', 'Da Scansionare', 45, NULL, NULL, NULL, 2),
(141, 'DOC-15-1', 'Contratto', 'Da Scansionare', 15, NULL, NULL, NULL, 2),
(142, 'DOC-15-2', 'Modulo Privacy', 'Da Scansionare', 15, NULL, NULL, NULL, 2),
(143, 'DOC-15-3', 'Documento Identità', 'Da Scansionare', 15, NULL, NULL, 'Firma mancante', 2),
(144, 'DOC-15-4', 'Fattura', 'Da Scansionare', 15, NULL, NULL, NULL, 2),
(145, 'DOC-15-5', 'Contratto', 'Da Scansionare', 15, NULL, NULL, NULL, 2),
(146, 'DOC-46-1', 'Contratto', 'Scansionato', 46, NULL, NULL, NULL, 3),
(147, 'DOC-46-2', 'Modulo Privacy', 'Scansionato', 46, NULL, NULL, NULL, 3),
(148, 'DOC-46-3', 'Documento Identità', 'Scansionato', 46, NULL, NULL, 'Firma mancante', 3),
(149, 'DOC-46-4', 'Fattura', 'Scansionato', 46, NULL, NULL, NULL, 3),
(150, 'DOC-46-5', 'Contratto', 'Scansionato', 46, NULL, NULL, NULL, 3),
(151, 'DOC-16-1', 'Contratto', 'Scansionato', 16, NULL, NULL, NULL, 3),
(152, 'DOC-16-2', 'Modulo Privacy', 'Scansionato', 16, NULL, NULL, NULL, 3),
(153, 'DOC-16-3', 'Documento Identità', 'Scansionato', 16, NULL, NULL, 'Firma mancante', 3),
(154, 'DOC-16-4', 'Fattura', 'Scansionato', 16, NULL, NULL, NULL, 3),
(155, 'DOC-16-5', 'Contratto', 'Scansionato', 16, NULL, NULL, NULL, 3),
(156, 'DOC-47-1', 'Contratto', 'In Revisione', 47, NULL, NULL, NULL, 12),
(157, 'DOC-47-2', 'Modulo Privacy', 'In Revisione', 47, NULL, NULL, NULL, 12),
(158, 'DOC-47-3', 'Documento Identità', 'In Revisione', 47, NULL, NULL, 'Firma mancante', 12),
(159, 'DOC-47-4', 'Fattura', 'In Revisione', 47, NULL, NULL, NULL, 12),
(160, 'DOC-47-5', 'Contratto', 'In Revisione', 47, NULL, NULL, NULL, 12),
(161, 'DOC-17-1', 'Contratto', 'In Revisione', 17, NULL, NULL, NULL, 12),
(162, 'DOC-17-2', 'Modulo Privacy', 'In Revisione', 17, NULL, NULL, NULL, 12),
(163, 'DOC-17-3', 'Documento Identità', 'In Revisione', 17, NULL, NULL, 'Firma mancante', 12),
(164, 'DOC-17-4', 'Fattura', 'In Revisione', 17, NULL, NULL, NULL, 12),
(165, 'DOC-17-5', 'Contratto', 'In Revisione', 17, NULL, NULL, NULL, 12),
(166, 'DOC-48-1', 'Contratto', 'Da Scansionare', 48, NULL, NULL, NULL, 6),
(167, 'DOC-48-2', 'Modulo Privacy', 'Da Scansionare', 48, NULL, NULL, NULL, 6),
(168, 'DOC-48-3', 'Documento Identità', 'Da Scansionare', 48, NULL, NULL, 'Firma mancante', 6),
(169, 'DOC-48-4', 'Fattura', 'Da Scansionare', 48, NULL, NULL, NULL, 6),
(170, 'DOC-48-5', 'Contratto', 'Da Scansionare', 48, NULL, NULL, NULL, 6),
(171, 'DOC-18-1', 'Contratto', 'Da Scansionare', 18, NULL, NULL, NULL, 6),
(172, 'DOC-18-2', 'Modulo Privacy', 'Da Scansionare', 18, NULL, NULL, NULL, 6),
(173, 'DOC-18-3', 'Documento Identità', 'Da Scansionare', 18, NULL, NULL, 'Firma mancante', 6),
(174, 'DOC-18-4', 'Fattura', 'Da Scansionare', 18, NULL, NULL, NULL, 6),
(175, 'DOC-18-5', 'Contratto', 'Da Scansionare', 18, NULL, NULL, NULL, 6),
(176, 'DOC-49-1', 'Contratto', 'Scansionato', 49, NULL, NULL, NULL, 9),
(177, 'DOC-49-2', 'Modulo Privacy', 'Scansionato', 49, NULL, NULL, NULL, 9),
(178, 'DOC-49-3', 'Documento Identità', 'Scansionato', 49, NULL, NULL, 'Firma mancante', 9),
(179, 'DOC-49-4', 'Fattura', 'Scansionato', 49, NULL, NULL, NULL, 9),
(180, 'DOC-49-5', 'Contratto', 'Scansionato', 49, NULL, NULL, NULL, 9),
(181, 'DOC-19-1', 'Contratto', 'Scansionato', 19, NULL, NULL, NULL, 9),
(182, 'DOC-19-2', 'Modulo Privacy', 'Scansionato', 19, NULL, NULL, NULL, 9),
(183, 'DOC-19-3', 'Documento Identità', 'Scansionato', 19, NULL, NULL, 'Firma mancante', 9),
(184, 'DOC-19-4', 'Fattura', 'Scansionato', 19, NULL, NULL, NULL, 9),
(185, 'DOC-19-5', 'Contratto', 'Scansionato', 19, NULL, NULL, NULL, 9),
(186, 'DOC-50-1', 'Contratto', 'In Revisione', 50, NULL, NULL, NULL, 1),
(187, 'DOC-50-2', 'Modulo Privacy', 'In Revisione', 50, NULL, NULL, NULL, 1),
(188, 'DOC-50-3', 'Documento Identità', 'In Revisione', 50, NULL, NULL, 'Firma mancante', 1),
(189, 'DOC-50-4', 'Fattura', 'In Revisione', 50, NULL, NULL, NULL, 1),
(190, 'DOC-50-5', 'Contratto', 'In Revisione', 50, NULL, NULL, NULL, 1),
(191, 'DOC-20-1', 'Contratto', 'In Revisione', 20, NULL, NULL, NULL, 1),
(192, 'DOC-20-2', 'Modulo Privacy', 'In Revisione', 20, NULL, NULL, NULL, 1),
(193, 'DOC-20-3', 'Documento Identità', 'In Revisione', 20, NULL, NULL, 'Firma mancante', 1),
(194, 'DOC-20-4', 'Fattura', 'In Revisione', 20, NULL, NULL, NULL, 1),
(195, 'DOC-20-5', 'Contratto', 'In Revisione', 20, NULL, NULL, NULL, 1),
(196, 'DOC-51-1', 'Contratto', 'Da Scansionare', 51, NULL, NULL, NULL, 2),
(197, 'DOC-51-2', 'Modulo Privacy', 'Da Scansionare', 51, NULL, NULL, NULL, 2),
(198, 'DOC-51-3', 'Documento Identità', 'Da Scansionare', 51, NULL, NULL, 'Firma mancante', 2),
(199, 'DOC-51-4', 'Fattura', 'Da Scansionare', 51, NULL, NULL, NULL, 2),
(200, 'DOC-51-5', 'Contratto', 'Da Scansionare', 51, NULL, NULL, NULL, 2),
(501, 'DOC-43-6', 'Modulo Privacy', 'Da Scansionare', 43, NULL, NULL, NULL, 7),
(502, 'DOC-67-1', 'Nota Spese', 'Da Scansionare', 67, NULL, NULL, NULL, 13),
(503, 'DOC-79-1', 'Fattura', 'Da Scansionare', 79, NULL, NULL, NULL, 11),
(504, 'DOC-3-6', 'Fattura', 'Da Scansionare', 3, NULL, NULL, NULL, 10),
(505, 'DOC-99-1', 'Nota Spese', 'Da Scansionare', 99, NULL, NULL, NULL, 15),
(506, 'DOC-99-2', 'Contratto', 'Da Scansionare', 99, NULL, NULL, NULL, 10),
(507, 'DOC-44-6', 'Contratto', 'Da Scansionare', 44, NULL, NULL, NULL, 9),
(508, 'DOC-99-3', 'Nota Spese', 'Da Scansionare', 99, NULL, NULL, NULL, 11),
(509, 'DOC-80-1', 'Contratto', 'Da Scansionare', 80, NULL, NULL, NULL, 15),
(510, 'DOC-99-4', 'Nota Spese', 'Da Scansionare', 99, NULL, NULL, NULL, 4),
(511, 'DOC-19-6', 'Nota Spese', 'Da Scansionare', 19, NULL, NULL, NULL, 12),
(512, 'DOC-74-1', 'Modulo Privacy', 'Da Scansionare', 74, NULL, NULL, NULL, 15),
(513, 'DOC-107-1', 'Fattura', 'Da Scansionare', 107, NULL, NULL, NULL, 11),
(514, 'DOC-1-6', 'Contratto', 'Da Scansionare', 1, NULL, NULL, NULL, 11),
(515, 'DOC-78-1', 'Fattura', 'Da Scansionare', 78, NULL, NULL, NULL, 2),
(516, 'DOC-110-1', 'Nota Spese', 'Da Scansionare', 110, NULL, NULL, NULL, 1),
(517, 'DOC-80-2', 'Fattura', 'Da Scansionare', 80, NULL, NULL, NULL, 6),
(518, 'DOC-95-1', 'Modulo Privacy', 'Da Scansionare', 95, NULL, NULL, NULL, 6),
(519, 'DOC-70-1', 'Nota Spese', 'Da Scansionare', 70, NULL, NULL, NULL, 14),
(520, 'DOC-1-7', 'Modulo Privacy', 'Da Scansionare', 1, NULL, NULL, NULL, 3),
(521, 'DOC-69-1', 'Nota Spese', 'Da Scansionare', 69, NULL, NULL, NULL, 4),
(522, 'DOC-42-6', 'Modulo Privacy', 'Da Scansionare', 42, NULL, NULL, NULL, 11),
(523, 'DOC-82-1', 'Contratto', 'Da Scansionare', 82, NULL, NULL, NULL, 6),
(524, 'DOC-40-6', 'Contratto', 'Da Scansionare', 40, NULL, NULL, NULL, 9),
(525, 'DOC-63-1', 'Contratto', 'Da Scansionare', 63, NULL, NULL, NULL, 5),
(526, 'DOC-39-6', 'Contratto', 'Da Scansionare', 39, NULL, NULL, NULL, 4),
(527, 'DOC-107-2', 'Contratto', 'Da Scansionare', 107, NULL, NULL, NULL, 4),
(528, 'DOC-8-6', 'Modulo Privacy', 'Da Scansionare', 8, NULL, NULL, NULL, 12),
(529, 'DOC-45-6', 'Fattura', 'Da Scansionare', 45, NULL, NULL, NULL, 11),
(530, 'DOC-94-1', 'Contratto', 'Da Scansionare', 94, NULL, NULL, NULL, 4),
(531, 'DOC-39-7', 'Contratto', 'Da Scansionare', 39, NULL, NULL, NULL, 4),
(532, 'DOC-6-6', 'Fattura', 'Da Scansionare', 6, NULL, NULL, NULL, 4),
(533, 'DOC-46-6', 'Fattura', 'Da Scansionare', 46, NULL, NULL, NULL, 5),
(534, 'DOC-95-2', 'Nota Spese', 'Da Scansionare', 95, NULL, NULL, NULL, 12),
(535, 'DOC-43-7', 'Nota Spese', 'Da Scansionare', 43, NULL, NULL, NULL, 4),
(536, 'DOC-39-8', 'Fattura', 'Da Scansionare', 39, NULL, NULL, NULL, 11),
(537, 'DOC-108-1', 'Contratto', 'Da Scansionare', 108, NULL, NULL, NULL, 6),
(538, 'DOC-69-2', 'Nota Spese', 'Da Scansionare', 69, NULL, NULL, NULL, 4),
(539, 'DOC-49-6', 'Fattura', 'Da Scansionare', 49, NULL, NULL, NULL, 14),
(540, 'DOC-12-6', 'Fattura', 'Da Scansionare', 12, NULL, NULL, NULL, 9),
(541, 'DOC-39-9', 'Nota Spese', 'Da Scansionare', 39, NULL, NULL, NULL, 6),
(542, 'DOC-48-6', 'Contratto', 'Da Scansionare', 48, NULL, NULL, NULL, 1),
(543, 'DOC-19-7', 'Contratto', 'Da Scansionare', 19, NULL, NULL, NULL, 9),
(544, 'DOC-70-2', 'Contratto', 'Da Scansionare', 70, NULL, NULL, NULL, 2),
(545, 'DOC-16-6', 'Fattura', 'Da Scansionare', 16, NULL, NULL, NULL, 7),
(546, 'DOC-6-7', 'Nota Spese', 'Da Scansionare', 6, NULL, NULL, NULL, 2),
(547, 'DOC-10-6', 'Fattura', 'Da Scansionare', 10, NULL, NULL, NULL, 10),
(548, 'DOC-65-1', 'Modulo Privacy', 'Da Scansionare', 65, NULL, NULL, NULL, 1),
(549, 'DOC-11-6', 'Modulo Privacy', 'Da Scansionare', 11, NULL, NULL, NULL, 6),
(550, 'DOC-106-1', 'Fattura', 'Da Scansionare', 106, NULL, NULL, NULL, 11),
(551, 'DOC-50-6', 'Nota Spese', 'Da Scansionare', 50, NULL, NULL, NULL, 15),
(552, 'DOC-80-3', 'Modulo Privacy', 'Da Scansionare', 80, NULL, NULL, NULL, 9),
(553, 'DOC-51-6', 'Fattura', 'Da Scansionare', 51, NULL, NULL, NULL, 6),
(554, 'DOC-49-7', 'Fattura', 'Da Scansionare', 49, NULL, NULL, NULL, 4),
(555, 'DOC-109-1', 'Fattura', 'Da Scansionare', 109, NULL, NULL, NULL, 1),
(556, 'DOC-33-6', 'Modulo Privacy', 'Da Scansionare', 33, NULL, NULL, NULL, 11),
(557, 'DOC-14-6', 'Contratto', 'Da Scansionare', 14, NULL, NULL, NULL, 12),
(558, 'DOC-73-1', 'Fattura', 'Da Scansionare', 73, NULL, NULL, NULL, 12),
(559, 'DOC-70-3', 'Contratto', 'Da Scansionare', 70, NULL, NULL, NULL, 1),
(560, 'DOC-96-1', 'Modulo Privacy', 'Da Scansionare', 96, NULL, NULL, NULL, 8),
(561, 'DOC-94-2', 'Fattura', 'Da Scansionare', 94, NULL, NULL, NULL, 14),
(562, 'DOC-36-6', 'Nota Spese', 'Da Scansionare', 36, NULL, NULL, NULL, 15),
(563, 'DOC-6-8', 'Fattura', 'Da Scansionare', 6, NULL, NULL, NULL, 3),
(564, 'DOC-5-6', 'Fattura', 'Da Scansionare', 5, NULL, NULL, NULL, 11),
(565, 'DOC-37-6', 'Fattura', 'Da Scansionare', 37, NULL, NULL, NULL, 13),
(566, 'DOC-38-6', 'Contratto', 'Da Scansionare', 38, NULL, NULL, NULL, 3),
(567, 'DOC-95-3', 'Nota Spese', 'Da Scansionare', 95, NULL, NULL, NULL, 6),
(568, 'DOC-41-6', 'Contratto', 'Da Scansionare', 41, NULL, NULL, NULL, 15),
(569, 'DOC-9-6', 'Fattura', 'Da Scansionare', 9, NULL, NULL, NULL, 11),
(570, 'DOC-97-1', 'Nota Spese', 'Da Scansionare', 97, NULL, NULL, NULL, 2),
(571, 'DOC-3-7', 'Nota Spese', 'Da Scansionare', 3, NULL, NULL, NULL, 13),
(572, 'DOC-63-2', 'Contratto', 'Da Scansionare', 63, NULL, NULL, NULL, 15),
(573, 'DOC-42-7', 'Contratto', 'Da Scansionare', 42, NULL, NULL, NULL, 5),
(574, 'DOC-36-7', 'Nota Spese', 'Da Scansionare', 36, NULL, NULL, NULL, 9),
(575, 'DOC-44-7', 'Modulo Privacy', 'Da Scansionare', 44, NULL, NULL, NULL, 6),
(576, 'DOC-103-1', 'Fattura', 'Da Scansionare', 103, NULL, NULL, NULL, 4),
(577, 'DOC-9-7', 'Contratto', 'Da Scansionare', 9, NULL, NULL, NULL, 3),
(578, 'DOC-80-4', 'Contratto', 'Da Scansionare', 80, NULL, NULL, NULL, 4),
(579, 'DOC-66-1', 'Fattura', 'Da Scansionare', 66, NULL, NULL, NULL, 15),
(580, 'DOC-73-2', 'Contratto', 'Da Scansionare', 73, NULL, NULL, NULL, 15),
(581, 'DOC-72-1', 'Fattura', 'Da Scansionare', 72, NULL, NULL, NULL, 11),
(582, 'DOC-13-6', 'Modulo Privacy', 'Da Scansionare', 13, NULL, NULL, NULL, 3),
(583, 'DOC-78-2', 'Modulo Privacy', 'Da Scansionare', 78, NULL, NULL, NULL, 6),
(584, 'DOC-68-1', 'Contratto', 'Da Scansionare', 68, NULL, NULL, NULL, 6),
(585, 'DOC-37-7', 'Fattura', 'Da Scansionare', 37, NULL, NULL, NULL, 7),
(586, 'DOC-2-6', 'Contratto', 'Da Scansionare', 2, NULL, NULL, NULL, 8),
(587, 'DOC-97-2', 'Contratto', 'Da Scansionare', 97, NULL, NULL, NULL, 2),
(588, 'DOC-39-10', 'Fattura', 'Da Scansionare', 39, NULL, NULL, NULL, 5),
(589, 'DOC-97-3', 'Contratto', 'Da Scansionare', 97, NULL, NULL, NULL, 13),
(590, 'DOC-33-7', 'Fattura', 'Da Scansionare', 33, NULL, NULL, NULL, 12),
(591, 'DOC-95-4', 'Modulo Privacy', 'Da Scansionare', 95, NULL, NULL, NULL, 5),
(592, 'DOC-41-7', 'Nota Spese', 'Da Scansionare', 41, NULL, NULL, NULL, 7),
(593, 'DOC-14-7', 'Modulo Privacy', 'Da Scansionare', 14, NULL, NULL, NULL, 10),
(594, 'DOC-101-1', 'Fattura', 'Da Scansionare', 101, NULL, NULL, NULL, 6),
(595, 'DOC-68-2', 'Contratto', 'Da Scansionare', 68, NULL, NULL, NULL, 14),
(596, 'DOC-80-5', 'Contratto', 'Da Scansionare', 80, NULL, NULL, NULL, 3),
(597, 'DOC-8-7', 'Modulo Privacy', 'Da Scansionare', 8, NULL, NULL, NULL, 2),
(598, 'DOC-49-8', 'Contratto', 'Da Scansionare', 49, NULL, NULL, NULL, 6),
(599, 'DOC-74-2', 'Contratto', 'Da Scansionare', 74, NULL, NULL, NULL, 14),
(600, 'DOC-66-2', 'Fattura', 'Da Scansionare', 66, NULL, NULL, NULL, 3),
(601, 'DOC-72-2', 'Nota Spese', 'Da Scansionare', 72, NULL, NULL, NULL, 14),
(602, 'DOC-35-6', 'Nota Spese', 'Da Scansionare', 35, NULL, NULL, NULL, 1),
(603, 'DOC-66-3', 'Nota Spese', 'Da Scansionare', 66, NULL, NULL, NULL, 15),
(604, 'DOC-80-6', 'Modulo Privacy', 'Da Scansionare', 80, NULL, NULL, NULL, 5),
(605, 'DOC-37-8', 'Fattura', 'Da Scansionare', 37, NULL, NULL, NULL, 11),
(606, 'DOC-12-7', 'Fattura', 'Da Scansionare', 12, NULL, NULL, NULL, 10),
(607, 'DOC-102-1', 'Fattura', 'Da Scansionare', 102, NULL, NULL, NULL, 6),
(608, 'DOC-20-6', 'Nota Spese', 'Da Scansionare', 20, NULL, NULL, NULL, 6),
(609, 'DOC-49-9', 'Contratto', 'Da Scansionare', 49, NULL, NULL, NULL, 7),
(610, 'DOC-99-5', 'Fattura', 'Da Scansionare', 99, NULL, NULL, NULL, 2),
(611, 'DOC-99-6', 'Modulo Privacy', 'Da Scansionare', 99, NULL, NULL, NULL, 6),
(612, 'DOC-13-7', 'Fattura', 'Da Scansionare', 13, NULL, NULL, NULL, 10),
(613, 'DOC-41-8', 'Nota Spese', 'Da Scansionare', 41, NULL, NULL, NULL, 14),
(614, 'DOC-32-6', 'Modulo Privacy', 'Da Scansionare', 32, NULL, NULL, NULL, 6),
(615, 'DOC-65-2', 'Contratto', 'Da Scansionare', 65, NULL, NULL, NULL, 14),
(616, 'DOC-1-8', 'Modulo Privacy', 'Da Scansionare', 1, NULL, NULL, NULL, 4),
(617, 'DOC-80-7', 'Modulo Privacy', 'Da Scansionare', 80, NULL, NULL, NULL, 8),
(618, 'DOC-11-7', 'Modulo Privacy', 'Da Scansionare', 11, NULL, NULL, NULL, 3),
(619, 'DOC-9-8', 'Contratto', 'Da Scansionare', 9, NULL, NULL, NULL, 11),
(620, 'DOC-3-8', 'Modulo Privacy', 'Da Scansionare', 3, NULL, NULL, NULL, 2),
(621, 'DOC-78-3', 'Nota Spese', 'Da Scansionare', 78, NULL, NULL, NULL, 14),
(622, 'DOC-108-2', 'Modulo Privacy', 'Da Scansionare', 108, NULL, NULL, NULL, 7),
(623, 'DOC-15-6', 'Nota Spese', 'Da Scansionare', 15, NULL, NULL, NULL, 14),
(624, 'DOC-2-7', 'Fattura', 'Da Scansionare', 2, NULL, NULL, NULL, 6),
(625, 'DOC-65-3', 'Modulo Privacy', 'Da Scansionare', 65, NULL, NULL, NULL, 14),
(626, 'DOC-109-2', 'Fattura', 'Da Scansionare', 109, NULL, NULL, NULL, 3),
(627, 'DOC-107-3', 'Fattura', 'Da Scansionare', 107, NULL, NULL, NULL, 14),
(628, 'DOC-41-9', 'Modulo Privacy', 'Da Scansionare', 41, NULL, NULL, NULL, 14),
(629, 'DOC-39-11', 'Modulo Privacy', 'Da Scansionare', 39, NULL, NULL, NULL, 1),
(630, 'DOC-82-2', 'Modulo Privacy', 'Da Scansionare', 82, NULL, NULL, NULL, 6),
(631, 'DOC-40-7', 'Fattura', 'Da Scansionare', 40, NULL, NULL, NULL, 12),
(632, 'DOC-2-8', 'Modulo Privacy', 'Da Scansionare', 2, NULL, NULL, NULL, 10),
(633, 'DOC-48-7', 'Nota Spese', 'Da Scansionare', 48, NULL, NULL, NULL, 5),
(634, 'DOC-69-3', 'Fattura', 'Da Scansionare', 69, NULL, NULL, NULL, 3),
(635, 'DOC-1-9', 'Contratto', 'Da Scansionare', 1, NULL, NULL, NULL, 12),
(636, 'DOC-45-7', 'Modulo Privacy', 'Da Scansionare', 45, NULL, NULL, NULL, 4),
(637, 'DOC-12-8', 'Modulo Privacy', 'Da Scansionare', 12, NULL, NULL, NULL, 12),
(638, 'DOC-46-7', 'Modulo Privacy', 'Da Scansionare', 46, NULL, NULL, NULL, 7),
(639, 'DOC-72-3', 'Nota Spese', 'Da Scansionare', 72, NULL, NULL, NULL, 2),
(640, 'DOC-102-2', 'Contratto', 'Da Scansionare', 102, NULL, NULL, NULL, 3),
(641, 'DOC-79-2', 'Nota Spese', 'Da Scansionare', 79, NULL, NULL, NULL, 14),
(642, 'DOC-40-8', 'Contratto', 'Da Scansionare', 40, NULL, NULL, NULL, 7),
(643, 'DOC-33-8', 'Nota Spese', 'Da Scansionare', 33, NULL, NULL, NULL, 8),
(644, 'DOC-19-8', 'Modulo Privacy', 'Da Scansionare', 19, NULL, NULL, NULL, 8),
(645, 'DOC-13-8', 'Modulo Privacy', 'Da Scansionare', 13, NULL, NULL, NULL, 4),
(646, 'DOC-42-8', 'Fattura', 'Da Scansionare', 42, NULL, NULL, NULL, 8),
(647, 'DOC-39-12', 'Modulo Privacy', 'Da Scansionare', 39, NULL, NULL, NULL, 11),
(648, 'DOC-32-7', 'Nota Spese', 'Da Scansionare', 32, NULL, NULL, NULL, 7),
(649, 'DOC-2-9', 'Nota Spese', 'Da Scansionare', 2, NULL, NULL, NULL, 3),
(650, 'DOC-12-9', 'Nota Spese', 'Da Scansionare', 12, NULL, NULL, NULL, 8),
(651, 'DOC-38-7', 'Nota Spese', 'Da Scansionare', 38, NULL, NULL, NULL, 14),
(652, 'DOC-96-2', 'Nota Spese', 'Da Scansionare', 96, NULL, NULL, NULL, 13),
(653, 'DOC-112-1', 'Modulo Privacy', 'Da Scansionare', 112, NULL, NULL, NULL, 14),
(654, 'DOC-105-1', 'Nota Spese', 'Da Scansionare', 105, NULL, NULL, NULL, 8),
(655, 'DOC-113-1', 'Fattura', 'Da Scansionare', 113, NULL, NULL, NULL, 15),
(656, 'DOC-96-3', 'Nota Spese', 'Da Scansionare', 96, NULL, NULL, NULL, 6),
(657, 'DOC-77-1', 'Modulo Privacy', 'Da Scansionare', 77, NULL, NULL, NULL, 3),
(658, 'DOC-20-7', 'Fattura', 'Da Scansionare', 20, NULL, NULL, NULL, 14),
(659, 'DOC-10-7', 'Modulo Privacy', 'Da Scansionare', 10, NULL, NULL, NULL, 7),
(660, 'DOC-101-2', 'Fattura', 'Da Scansionare', 101, NULL, NULL, NULL, 4),
(661, 'DOC-41-10', 'Nota Spese', 'Da Scansionare', 41, NULL, NULL, NULL, 15),
(662, 'DOC-12-10', 'Contratto', 'Da Scansionare', 12, NULL, NULL, NULL, 1),
(663, 'DOC-106-2', 'Contratto', 'Da Scansionare', 106, NULL, NULL, NULL, 8),
(664, 'DOC-9-9', 'Contratto', 'Da Scansionare', 9, NULL, NULL, NULL, 3),
(665, 'DOC-13-9', 'Fattura', 'Da Scansionare', 13, NULL, NULL, NULL, 3),
(666, 'DOC-33-9', 'Contratto', 'Da Scansionare', 33, NULL, NULL, NULL, 11),
(667, 'DOC-95-5', 'Modulo Privacy', 'Da Scansionare', 95, NULL, NULL, NULL, 2),
(668, 'DOC-13-10', 'Fattura', 'Da Scansionare', 13, NULL, NULL, NULL, 5),
(669, 'DOC-49-10', 'Modulo Privacy', 'Da Scansionare', 49, NULL, NULL, NULL, 10),
(670, 'DOC-70-4', 'Fattura', 'Da Scansionare', 70, NULL, NULL, NULL, 7),
(671, 'DOC-38-8', 'Nota Spese', 'Da Scansionare', 38, NULL, NULL, NULL, 6),
(672, 'DOC-112-2', 'Modulo Privacy', 'Da Scansionare', 112, NULL, NULL, NULL, 5),
(673, 'DOC-36-8', 'Modulo Privacy', 'Da Scansionare', 36, NULL, NULL, NULL, 2),
(674, 'DOC-111-1', 'Nota Spese', 'Da Scansionare', 111, NULL, NULL, NULL, 3),
(675, 'DOC-12-11', 'Modulo Privacy', 'Da Scansionare', 12, NULL, NULL, NULL, 13),
(676, 'DOC-45-8', 'Contratto', 'Da Scansionare', 45, NULL, NULL, NULL, 5),
(677, 'DOC-107-4', 'Nota Spese', 'Da Scansionare', 107, NULL, NULL, NULL, 13),
(678, 'DOC-72-4', 'Fattura', 'Da Scansionare', 72, NULL, NULL, NULL, 9),
(679, 'DOC-70-5', 'Modulo Privacy', 'Da Scansionare', 70, NULL, NULL, NULL, 10),
(680, 'DOC-82-3', 'Fattura', 'Da Scansionare', 82, NULL, NULL, NULL, 3),
(681, 'DOC-110-2', 'Fattura', 'Da Scansionare', 110, NULL, NULL, NULL, 4),
(682, 'DOC-38-9', 'Contratto', 'Da Scansionare', 38, NULL, NULL, NULL, 12),
(683, 'DOC-39-13', 'Nota Spese', 'Da Scansionare', 39, NULL, NULL, NULL, 7),
(684, 'DOC-5-7', 'Nota Spese', 'Da Scansionare', 5, NULL, NULL, NULL, 5),
(685, 'DOC-8-8', 'Fattura', 'Da Scansionare', 8, NULL, NULL, NULL, 14),
(686, 'DOC-100-1', 'Fattura', 'Da Scansionare', 100, NULL, NULL, NULL, 11),
(687, 'DOC-97-4', 'Contratto', 'Da Scansionare', 97, NULL, NULL, NULL, 15),
(688, 'DOC-65-4', 'Modulo Privacy', 'Da Scansionare', 65, NULL, NULL, NULL, 7),
(689, 'DOC-102-3', 'Modulo Privacy', 'Da Scansionare', 102, NULL, NULL, NULL, 4),
(690, 'DOC-1-10', 'Modulo Privacy', 'Da Scansionare', 1, NULL, NULL, NULL, 15),
(691, 'DOC-33-10', 'Nota Spese', 'Da Scansionare', 33, NULL, NULL, NULL, 13),
(692, 'DOC-43-8', 'Nota Spese', 'Da Scansionare', 43, NULL, NULL, NULL, 12),
(693, 'DOC-109-3', 'Contratto', 'Da Scansionare', 109, NULL, NULL, NULL, 13),
(694, 'DOC-75-1', 'Modulo Privacy', 'Da Scansionare', 75, NULL, NULL, NULL, 1),
(695, 'DOC-32-8', 'Fattura', 'Da Scansionare', 32, NULL, NULL, NULL, 7),
(696, 'DOC-103-2', 'Modulo Privacy', 'Da Scansionare', 103, NULL, NULL, NULL, 14),
(697, 'DOC-42-9', 'Contratto', 'Da Scansionare', 42, NULL, NULL, NULL, 10),
(698, 'DOC-66-4', 'Modulo Privacy', 'Da Scansionare', 66, NULL, NULL, NULL, 5),
(699, 'DOC-81-1', 'Fattura', 'Da Scansionare', 81, NULL, NULL, NULL, 5),
(700, 'DOC-6-9', 'Nota Spese', 'Da Scansionare', 6, NULL, NULL, NULL, 8),
(701, 'DOC-42-10', 'Modulo Privacy', 'Da Scansionare', 42, NULL, NULL, NULL, 15),
(702, 'DOC-46-8', 'Contratto', 'Da Scansionare', 46, NULL, NULL, NULL, 3),
(703, 'DOC-40-9', 'Modulo Privacy', 'Da Scansionare', 40, NULL, NULL, NULL, 2),
(704, 'DOC-14-8', 'Contratto', 'Da Scansionare', 14, NULL, NULL, NULL, 1),
(705, 'DOC-95-6', 'Fattura', 'Da Scansionare', 95, NULL, NULL, NULL, 7),
(706, 'DOC-2-10', 'Contratto', 'Da Scansionare', 2, NULL, NULL, NULL, 14),
(707, 'DOC-107-5', 'Contratto', 'Da Scansionare', 107, NULL, NULL, NULL, 2),
(708, 'DOC-110-3', 'Modulo Privacy', 'Da Scansionare', 110, NULL, NULL, NULL, 6),
(709, 'DOC-9-10', 'Modulo Privacy', 'Da Scansionare', 9, NULL, NULL, NULL, 13),
(710, 'DOC-15-7', 'Nota Spese', 'Da Scansionare', 15, NULL, NULL, NULL, 9),
(711, 'DOC-112-3', 'Modulo Privacy', 'Da Scansionare', 112, NULL, NULL, NULL, 14),
(712, 'DOC-100-2', 'Fattura', 'Da Scansionare', 100, NULL, NULL, NULL, 9),
(713, 'DOC-11-8', 'Modulo Privacy', 'Da Scansionare', 11, NULL, NULL, NULL, 10),
(714, 'DOC-36-9', 'Contratto', 'Da Scansionare', 36, NULL, NULL, NULL, 9),
(715, 'DOC-40-10', 'Contratto', 'Da Scansionare', 40, NULL, NULL, NULL, 8),
(716, 'DOC-76-1', 'Modulo Privacy', 'Da Scansionare', 76, NULL, NULL, NULL, 6),
(717, 'DOC-68-3', 'Nota Spese', 'Da Scansionare', 68, NULL, NULL, NULL, 4),
(718, 'DOC-18-6', 'Fattura', 'Da Scansionare', 18, NULL, NULL, NULL, 3),
(719, 'DOC-109-4', 'Modulo Privacy', 'Da Scansionare', 109, NULL, NULL, NULL, 2),
(720, 'DOC-13-11', 'Modulo Privacy', 'Da Scansionare', 13, NULL, NULL, NULL, 8),
(721, 'DOC-51-7', 'Fattura', 'Da Scansionare', 51, NULL, NULL, NULL, 6),
(722, 'DOC-36-10', 'Nota Spese', 'Da Scansionare', 36, NULL, NULL, NULL, 9),
(723, 'DOC-94-3', 'Contratto', 'Da Scansionare', 94, NULL, NULL, NULL, 3),
(724, 'DOC-112-4', 'Nota Spese', 'Da Scansionare', 112, NULL, NULL, NULL, 12),
(725, 'DOC-77-2', 'Modulo Privacy', 'Da Scansionare', 77, NULL, NULL, NULL, 7),
(726, 'DOC-75-2', 'Modulo Privacy', 'Da Scansionare', 75, NULL, NULL, NULL, 1),
(727, 'DOC-7-6', 'Contratto', 'Da Scansionare', 7, NULL, NULL, NULL, 14),
(728, 'DOC-43-9', 'Nota Spese', 'Da Scansionare', 43, NULL, NULL, NULL, 11),
(729, 'DOC-81-2', 'Nota Spese', 'Da Scansionare', 81, NULL, NULL, NULL, 3),
(730, 'DOC-97-5', 'Contratto', 'Da Scansionare', 97, NULL, NULL, NULL, 7),
(731, 'DOC-12-12', 'Fattura', 'Da Scansionare', 12, NULL, NULL, NULL, 10),
(732, 'DOC-65-5', 'Contratto', 'Da Scansionare', 65, NULL, NULL, NULL, 10),
(733, 'DOC-8-9', 'Fattura', 'Da Scansionare', 8, NULL, NULL, NULL, 9),
(734, 'DOC-66-5', 'Contratto', 'Da Scansionare', 66, NULL, NULL, NULL, 15),
(735, 'DOC-32-9', 'Contratto', 'Da Scansionare', 32, NULL, NULL, NULL, 15),
(736, 'DOC-66-6', 'Modulo Privacy', 'Da Scansionare', 66, NULL, NULL, NULL, 1),
(737, 'DOC-6-10', 'Contratto', 'Da Scansionare', 6, NULL, NULL, NULL, 4),
(738, 'DOC-78-4', 'Modulo Privacy', 'Da Scansionare', 78, NULL, NULL, NULL, 6),
(739, 'DOC-33-11', 'Modulo Privacy', 'Da Scansionare', 33, NULL, NULL, NULL, 5),
(740, 'DOC-10-8', 'Contratto', 'Da Scansionare', 10, NULL, NULL, NULL, 2),
(741, 'DOC-66-7', 'Modulo Privacy', 'Da Scansionare', 66, NULL, NULL, NULL, 8),
(742, 'DOC-112-5', 'Fattura', 'Da Scansionare', 112, NULL, NULL, NULL, 12),
(743, 'DOC-99-7', 'Nota Spese', 'Da Scansionare', 99, NULL, NULL, NULL, 4),
(744, 'DOC-11-9', 'Contratto', 'Da Scansionare', 11, NULL, NULL, NULL, 13),
(745, 'DOC-105-2', 'Contratto', 'Da Scansionare', 105, NULL, NULL, NULL, 7),
(746, 'DOC-18-7', 'Nota Spese', 'Da Scansionare', 18, NULL, NULL, NULL, 3),
(747, 'DOC-43-10', 'Contratto', 'Da Scansionare', 43, NULL, NULL, NULL, 3),
(748, 'DOC-65-6', 'Modulo Privacy', 'Da Scansionare', 65, NULL, NULL, NULL, 4),
(749, 'DOC-109-5', 'Contratto', 'Da Scansionare', 109, NULL, NULL, NULL, 2),
(750, 'DOC-6-11', 'Fattura', 'Da Scansionare', 6, NULL, NULL, NULL, 11),
(751, 'DOC-71-1', 'Modulo Privacy', 'Da Scansionare', 71, NULL, NULL, NULL, 1),
(752, 'DOC-68-4', 'Contratto', 'Da Scansionare', 68, NULL, NULL, NULL, 6),
(753, 'DOC-105-3', 'Fattura', 'Da Scansionare', 105, NULL, NULL, NULL, 6),
(754, 'DOC-95-7', 'Fattura', 'Da Scansionare', 95, NULL, NULL, NULL, 3),
(755, 'DOC-99-8', 'Nota Spese', 'Da Scansionare', 99, NULL, NULL, NULL, 6),
(756, 'DOC-47-6', 'Nota Spese', 'Da Scansionare', 47, NULL, NULL, NULL, 11),
(757, 'DOC-40-11', 'Nota Spese', 'Da Scansionare', 40, NULL, NULL, NULL, 12),
(758, 'DOC-71-2', 'Contratto', 'Da Scansionare', 71, NULL, NULL, NULL, 6),
(759, 'DOC-2-11', 'Contratto', 'Da Scansionare', 2, NULL, NULL, NULL, 7),
(760, 'DOC-75-3', 'Modulo Privacy', 'Da Scansionare', 75, NULL, NULL, NULL, 8),
(761, 'DOC-39-14', 'Contratto', 'Da Scansionare', 39, NULL, NULL, NULL, 4),
(762, 'DOC-82-4', 'Fattura', 'Da Scansionare', 82, NULL, NULL, NULL, 8),
(763, 'DOC-78-5', 'Nota Spese', 'Da Scansionare', 78, NULL, NULL, NULL, 2),
(764, 'DOC-49-11', 'Contratto', 'Da Scansionare', 49, NULL, NULL, NULL, 2),
(765, 'DOC-74-3', 'Nota Spese', 'Da Scansionare', 74, NULL, NULL, NULL, 15),
(766, 'DOC-98-1', 'Contratto', 'Da Scansionare', 98, NULL, NULL, NULL, 2),
(767, 'DOC-11-10', 'Modulo Privacy', 'Da Scansionare', 11, NULL, NULL, NULL, 10),
(768, 'DOC-39-15', 'Nota Spese', 'Da Scansionare', 39, NULL, NULL, NULL, 1),
(769, 'DOC-111-2', 'Modulo Privacy', 'Da Scansionare', 111, NULL, NULL, NULL, 8),
(770, 'DOC-16-7', 'Fattura', 'Da Scansionare', 16, NULL, NULL, NULL, 4),
(771, 'DOC-94-4', 'Contratto', 'Da Scansionare', 94, NULL, NULL, NULL, 3),
(772, 'DOC-72-5', 'Contratto', 'Da Scansionare', 72, NULL, NULL, NULL, 15),
(773, 'DOC-64-1', 'Fattura', 'Da Scansionare', 64, NULL, NULL, NULL, 5),
(774, 'DOC-66-8', 'Modulo Privacy', 'Da Scansionare', 66, NULL, NULL, NULL, 6),
(775, 'DOC-43-11', 'Modulo Privacy', 'Da Scansionare', 43, NULL, NULL, NULL, 10),
(776, 'DOC-110-4', 'Fattura', 'Da Scansionare', 110, NULL, NULL, NULL, 11),
(777, 'DOC-108-3', 'Modulo Privacy', 'Da Scansionare', 108, NULL, NULL, NULL, 10),
(778, 'DOC-32-10', 'Nota Spese', 'Da Scansionare', 32, NULL, NULL, NULL, 6),
(779, 'DOC-72-6', 'Modulo Privacy', 'Da Scansionare', 72, NULL, NULL, NULL, 1),
(780, 'DOC-79-3', 'Nota Spese', 'Da Scansionare', 79, NULL, NULL, NULL, 11),
(781, 'DOC-104-1', 'Nota Spese', 'Da Scansionare', 104, NULL, NULL, NULL, 3),
(782, 'DOC-2-12', 'Fattura', 'Da Scansionare', 2, NULL, NULL, NULL, 13),
(783, 'DOC-2-13', 'Modulo Privacy', 'Da Scansionare', 2, NULL, NULL, NULL, 11),
(784, 'DOC-37-9', 'Nota Spese', 'Da Scansionare', 37, NULL, NULL, NULL, 4),
(785, 'DOC-69-4', 'Nota Spese', 'Da Scansionare', 69, NULL, NULL, NULL, 6),
(786, 'DOC-44-8', 'Fattura', 'Da Scansionare', 44, NULL, NULL, NULL, 11),
(787, 'DOC-40-12', 'Modulo Privacy', 'Da Scansionare', 40, NULL, NULL, NULL, 6),
(788, 'DOC-34-6', 'Fattura', 'Da Scansionare', 34, NULL, NULL, NULL, 12),
(789, 'DOC-95-8', 'Modulo Privacy', 'Da Scansionare', 95, NULL, NULL, NULL, 15),
(790, 'DOC-67-2', 'Nota Spese', 'Da Scansionare', 67, NULL, NULL, NULL, 9),
(791, 'DOC-71-3', 'Nota Spese', 'Da Scansionare', 71, NULL, NULL, NULL, 4),
(792, 'DOC-95-9', 'Modulo Privacy', 'Da Scansionare', 95, NULL, NULL, NULL, 1),
(793, 'DOC-15-8', 'Contratto', 'Da Scansionare', 15, NULL, NULL, NULL, 12),
(794, 'DOC-103-3', 'Fattura', 'Da Scansionare', 103, NULL, NULL, NULL, 8),
(795, 'DOC-111-3', 'Modulo Privacy', 'Da Scansionare', 111, NULL, NULL, NULL, 10),
(796, 'DOC-110-5', 'Modulo Privacy', 'Da Scansionare', 110, NULL, NULL, NULL, 9),
(797, 'DOC-63-3', 'Contratto', 'Da Scansionare', 63, NULL, NULL, NULL, 12),
(798, 'DOC-14-9', 'Fattura', 'Da Scansionare', 14, NULL, NULL, NULL, 7),
(799, 'DOC-16-8', 'Contratto', 'Da Scansionare', 16, NULL, NULL, NULL, 13),
(800, 'DOC-69-5', 'Contratto', 'Da Scansionare', 69, NULL, NULL, NULL, 3),
(801, 'DOC-241-1', 'Contratto', 'Da Scansionare', 241, NULL, NULL, NULL, 1),
(802, 'DOC-241-2', 'Fattura', 'Da Scansionare', 241, NULL, NULL, NULL, 1),
(803, 'DOC-241-3', 'Modulo Privacy', 'Da Scansionare', 241, NULL, NULL, NULL, 1),
(804, 'DOC-241-4', 'DDT', 'Da Scansionare', 241, NULL, NULL, NULL, 1),
(805, 'DOC-241-5', 'Nota Spese', 'Da Scansionare', 241, NULL, NULL, NULL, 1),
(806, 'DOC-242-1', 'Contratto', 'Da Scansionare', 242, NULL, NULL, NULL, 1),
(807, 'DOC-242-2', 'Fattura', 'Da Scansionare', 242, NULL, NULL, NULL, 1),
(808, 'DOC-242-3', 'Modulo Privacy', 'Da Scansionare', 242, NULL, NULL, NULL, 1),
(809, 'DOC-242-4', 'DDT', 'Da Scansionare', 242, NULL, NULL, NULL, 1),
(810, 'DOC-242-5', 'Nota Spese', 'Da Scansionare', 242, NULL, NULL, NULL, 1),
(811, 'DOC-243-1', 'Contratto', 'Da Scansionare', 243, NULL, NULL, NULL, 1),
(812, 'DOC-243-2', 'Fattura', 'Da Scansionare', 243, NULL, NULL, NULL, 1),
(813, 'DOC-243-3', 'Modulo Privacy', 'Da Scansionare', 243, NULL, NULL, NULL, 1),
(814, 'DOC-243-4', 'DDT', 'Da Scansionare', 243, NULL, NULL, NULL, 1),
(815, 'DOC-243-5', 'Nota Spese', 'Da Scansionare', 243, NULL, NULL, NULL, 1),
(816, 'DOC-244-1', 'Contratto', 'Da Scansionare', 244, NULL, NULL, NULL, 1),
(817, 'DOC-244-2', 'Fattura', 'Da Scansionare', 244, NULL, NULL, NULL, 1),
(818, 'DOC-244-3', 'Modulo Privacy', 'Da Scansionare', 244, NULL, NULL, NULL, 1),
(819, 'DOC-244-4', 'DDT', 'Da Scansionare', 244, NULL, NULL, NULL, 1),
(820, 'DOC-244-5', 'Nota Spese', 'Da Scansionare', 244, NULL, NULL, NULL, 1),
(821, 'DOC-245-1', 'Contratto', 'Da Scansionare', 245, NULL, NULL, NULL, 1),
(822, 'DOC-245-2', 'Fattura', 'Da Scansionare', 245, NULL, NULL, NULL, 1),
(823, 'DOC-245-3', 'Modulo Privacy', 'Da Scansionare', 245, NULL, NULL, NULL, 1),
(824, 'DOC-245-4', 'DDT', 'Da Scansionare', 245, NULL, NULL, NULL, 1),
(825, 'DOC-245-5', 'Nota Spese', 'Da Scansionare', 245, NULL, NULL, NULL, 1),
(826, 'DOC-246-1', 'Contratto', 'Da Scansionare', 246, NULL, NULL, NULL, 1),
(827, 'DOC-246-2', 'Fattura', 'Da Scansionare', 246, NULL, NULL, NULL, 1),
(828, 'DOC-246-3', 'Modulo Privacy', 'Da Scansionare', 246, NULL, NULL, NULL, 1),
(829, 'DOC-246-4', 'DDT', 'Da Scansionare', 246, NULL, NULL, NULL, 1),
(830, 'DOC-246-5', 'Nota Spese', 'Da Scansionare', 246, NULL, NULL, NULL, 1),
(831, 'DOC-247-1', 'Contratto', 'Da Scansionare', 247, NULL, NULL, NULL, 1),
(832, 'DOC-247-2', 'Fattura', 'Da Scansionare', 247, NULL, NULL, NULL, 1),
(833, 'DOC-247-3', 'Modulo Privacy', 'Da Scansionare', 247, NULL, NULL, NULL, 1),
(834, 'DOC-247-4', 'DDT', 'Da Scansionare', 247, NULL, NULL, NULL, 1),
(835, 'DOC-247-5', 'Nota Spese', 'Da Scansionare', 247, NULL, NULL, NULL, 1),
(836, 'DOC-248-1', 'Contratto', 'Da Scansionare', 248, NULL, NULL, NULL, 1),
(837, 'DOC-248-2', 'Fattura', 'Da Scansionare', 248, NULL, NULL, NULL, 1),
(838, 'DOC-248-3', 'Modulo Privacy', 'Da Scansionare', 248, NULL, NULL, NULL, 1),
(839, 'DOC-248-4', 'DDT', 'Da Scansionare', 248, NULL, NULL, NULL, 1),
(840, 'DOC-248-5', 'Nota Spese', 'Da Scansionare', 248, NULL, NULL, NULL, 1),
(841, 'DOC-249-1', 'Contratto', 'Da Scansionare', 249, NULL, NULL, NULL, 1),
(842, 'DOC-249-2', 'Fattura', 'Da Scansionare', 249, NULL, NULL, NULL, 1),
(843, 'DOC-249-3', 'Modulo Privacy', 'Da Scansionare', 249, NULL, NULL, NULL, 1),
(844, 'DOC-249-4', 'DDT', 'Da Scansionare', 249, NULL, NULL, NULL, 1),
(845, 'DOC-249-5', 'Nota Spese', 'Da Scansionare', 249, NULL, NULL, NULL, 1),
(846, 'DOC-250-1', 'Contratto', 'Da Scansionare', 250, NULL, NULL, NULL, 1),
(847, 'DOC-250-2', 'Fattura', 'Da Scansionare', 250, NULL, NULL, NULL, 1),
(848, 'DOC-250-3', 'Modulo Privacy', 'Da Scansionare', 250, NULL, NULL, NULL, 1),
(849, 'DOC-250-4', 'DDT', 'Da Scansionare', 250, NULL, NULL, NULL, 1),
(850, 'DOC-250-5', 'Nota Spese', 'Da Scansionare', 250, NULL, NULL, NULL, 1),
(851, 'DOC-251-1', 'Contratto', 'Da Scansionare', 251, NULL, NULL, NULL, 1),
(852, 'DOC-251-2', 'Fattura', 'Da Scansionare', 251, NULL, NULL, NULL, 1),
(853, 'DOC-251-3', 'Modulo Privacy', 'Da Scansionare', 251, NULL, NULL, NULL, 1),
(854, 'DOC-251-4', 'DDT', 'Da Scansionare', 251, NULL, NULL, NULL, 1),
(855, 'DOC-251-5', 'Nota Spese', 'Da Scansionare', 251, NULL, NULL, NULL, 1),
(856, 'DOC-252-1', 'Contratto', 'Da Scansionare', 252, NULL, NULL, NULL, 1),
(857, 'DOC-252-2', 'Fattura', 'Da Scansionare', 252, NULL, NULL, NULL, 1),
(858, 'DOC-252-3', 'Modulo Privacy', 'Da Scansionare', 252, NULL, NULL, NULL, 1),
(859, 'DOC-252-4', 'DDT', 'Da Scansionare', 252, NULL, NULL, NULL, 1),
(860, 'DOC-252-5', 'Nota Spese', 'Da Scansionare', 252, NULL, NULL, NULL, 1),
(861, 'DOC-253-1', 'Contratto', 'Da Scansionare', 253, NULL, NULL, NULL, 1),
(862, 'DOC-253-2', 'Fattura', 'Da Scansionare', 253, NULL, NULL, NULL, 1),
(863, 'DOC-253-3', 'Modulo Privacy', 'Da Scansionare', 253, NULL, NULL, NULL, 1),
(864, 'DOC-253-4', 'DDT', 'Da Scansionare', 253, NULL, NULL, NULL, 1),
(865, 'DOC-253-5', 'Nota Spese', 'Da Scansionare', 253, NULL, NULL, NULL, 1),
(866, 'DOC-254-1', 'Contratto', 'Da Scansionare', 254, NULL, NULL, NULL, 1),
(867, 'DOC-254-2', 'Fattura', 'Da Scansionare', 254, NULL, NULL, NULL, 1),
(868, 'DOC-254-3', 'Modulo Privacy', 'Da Scansionare', 254, NULL, NULL, NULL, 1),
(869, 'DOC-254-4', 'DDT', 'Da Scansionare', 254, NULL, NULL, NULL, 1),
(870, 'DOC-254-5', 'Nota Spese', 'Da Scansionare', 254, NULL, NULL, NULL, 1),
(871, 'DOC-255-1', 'Contratto', 'Da Scansionare', 255, NULL, NULL, NULL, 1),
(872, 'DOC-255-2', 'Fattura', 'Da Scansionare', 255, NULL, NULL, NULL, 1),
(873, 'DOC-255-3', 'Modulo Privacy', 'Da Scansionare', 255, NULL, NULL, NULL, 1),
(874, 'DOC-255-4', 'DDT', 'Da Scansionare', 255, NULL, NULL, NULL, 1),
(875, 'DOC-255-5', 'Nota Spese', 'Da Scansionare', 255, NULL, NULL, NULL, 1),
(876, 'DOC-256-1', 'Contratto', 'Da Scansionare', 256, NULL, NULL, NULL, 1),
(877, 'DOC-256-2', 'Fattura', 'Da Scansionare', 256, NULL, NULL, NULL, 1),
(878, 'DOC-256-3', 'Modulo Privacy', 'Da Scansionare', 256, NULL, NULL, NULL, 1),
(879, 'DOC-256-4', 'DDT', 'Da Scansionare', 256, NULL, NULL, NULL, 1),
(880, 'DOC-256-5', 'Nota Spese', 'Da Scansionare', 256, NULL, NULL, NULL, 1),
(881, 'DOC-257-1', 'Contratto', 'Da Scansionare', 257, NULL, NULL, NULL, 1),
(882, 'DOC-257-2', 'Fattura', 'Da Scansionare', 257, NULL, NULL, NULL, 1),
(883, 'DOC-257-3', 'Modulo Privacy', 'Da Scansionare', 257, NULL, NULL, NULL, 1),
(884, 'DOC-257-4', 'DDT', 'Da Scansionare', 257, NULL, NULL, NULL, 1),
(885, 'DOC-257-5', 'Nota Spese', 'Da Scansionare', 257, NULL, NULL, NULL, 1),
(886, 'DOC-258-1', 'Contratto', 'Da Scansionare', 258, NULL, NULL, NULL, 1),
(887, 'DOC-258-2', 'Fattura', 'Da Scansionare', 258, NULL, NULL, NULL, 1),
(888, 'DOC-258-3', 'Modulo Privacy', 'Da Scansionare', 258, NULL, NULL, NULL, 1),
(889, 'DOC-258-4', 'DDT', 'Da Scansionare', 258, NULL, NULL, NULL, 1),
(890, 'DOC-258-5', 'Nota Spese', 'Da Scansionare', 258, NULL, NULL, NULL, 1),
(891, 'DOC-259-1', 'Contratto', 'Da Scansionare', 259, NULL, NULL, NULL, 1),
(892, 'DOC-259-2', 'Fattura', 'Da Scansionare', 259, NULL, NULL, NULL, 1),
(893, 'DOC-259-3', 'Modulo Privacy', 'Da Scansionare', 259, NULL, NULL, NULL, 1),
(894, 'DOC-259-4', 'DDT', 'Da Scansionare', 259, NULL, NULL, NULL, 1),
(895, 'DOC-259-5', 'Nota Spese', 'Da Scansionare', 259, NULL, NULL, NULL, 1),
(896, 'DOC-260-1', 'Contratto', 'Da Scansionare', 260, NULL, NULL, NULL, 1),
(897, 'DOC-260-2', 'Fattura', 'Da Scansionare', 260, NULL, NULL, NULL, 1),
(898, 'DOC-260-3', 'Modulo Privacy', 'Da Scansionare', 260, NULL, NULL, NULL, 1),
(899, 'DOC-260-4', 'DDT', 'Da Scansionare', 260, NULL, NULL, NULL, 1),
(900, 'DOC-260-5', 'Nota Spese', 'Da Scansionare', 260, NULL, NULL, NULL, 1),
(901, 'DOC-261-1', 'Contratto', 'Da Scansionare', 261, NULL, NULL, NULL, 1),
(902, 'DOC-261-2', 'Fattura', 'Da Scansionare', 261, NULL, NULL, NULL, 1),
(903, 'DOC-261-3', 'Modulo Privacy', 'Da Scansionare', 261, NULL, NULL, NULL, 1),
(904, 'DOC-261-4', 'DDT', 'Da Scansionare', 261, NULL, NULL, NULL, 1),
(905, 'DOC-261-5', 'Nota Spese', 'Da Scansionare', 261, NULL, NULL, NULL, 1),
(906, 'DOC-262-1', 'Contratto', 'Da Scansionare', 262, NULL, NULL, NULL, 1),
(907, 'DOC-262-2', 'Fattura', 'Da Scansionare', 262, NULL, NULL, NULL, 1),
(908, 'DOC-262-3', 'Modulo Privacy', 'Da Scansionare', 262, NULL, NULL, NULL, 1),
(909, 'DOC-262-4', 'DDT', 'Da Scansionare', 262, NULL, NULL, NULL, 1),
(910, 'DOC-262-5', 'Nota Spese', 'Da Scansionare', 262, NULL, NULL, NULL, 1),
(911, 'DOC-263-1', 'Contratto', 'Da Scansionare', 263, NULL, NULL, NULL, 1),
(912, 'DOC-263-2', 'Fattura', 'Da Scansionare', 263, NULL, NULL, NULL, 1),
(913, 'DOC-263-3', 'Modulo Privacy', 'Da Scansionare', 263, NULL, NULL, NULL, 1),
(914, 'DOC-263-4', 'DDT', 'Da Scansionare', 263, NULL, NULL, NULL, 1),
(915, 'DOC-263-5', 'Nota Spese', 'Da Scansionare', 263, NULL, NULL, NULL, 1),
(916, 'DOC-264-1', 'Contratto', 'Da Scansionare', 264, NULL, NULL, NULL, 1),
(917, 'DOC-264-2', 'Fattura', 'Da Scansionare', 264, NULL, NULL, NULL, 1),
(918, 'DOC-264-3', 'Modulo Privacy', 'Da Scansionare', 264, NULL, NULL, NULL, 1),
(919, 'DOC-264-4', 'DDT', 'Da Scansionare', 264, NULL, NULL, NULL, 1),
(920, 'DOC-264-5', 'Nota Spese', 'Da Scansionare', 264, NULL, NULL, NULL, 1),
(921, 'DOC-265-1', 'Contratto', 'Da Scansionare', 265, NULL, NULL, NULL, 1),
(922, 'DOC-265-2', 'Fattura', 'Da Scansionare', 265, NULL, NULL, NULL, 1),
(923, 'DOC-265-3', 'Modulo Privacy', 'Da Scansionare', 265, NULL, NULL, NULL, 1),
(924, 'DOC-265-4', 'DDT', 'Da Scansionare', 265, NULL, NULL, NULL, 1),
(925, 'DOC-265-5', 'Nota Spese', 'Da Scansionare', 265, NULL, NULL, NULL, 1),
(926, 'DOC-266-1', 'Contratto', 'Da Scansionare', 266, NULL, NULL, NULL, 1),
(927, 'DOC-266-2', 'Fattura', 'Da Scansionare', 266, NULL, NULL, NULL, 1),
(928, 'DOC-266-3', 'Modulo Privacy', 'Da Scansionare', 266, NULL, NULL, NULL, 1),
(929, 'DOC-266-4', 'DDT', 'Da Scansionare', 266, NULL, NULL, NULL, 1),
(930, 'DOC-266-5', 'Nota Spese', 'Da Scansionare', 266, NULL, NULL, NULL, 1),
(931, 'DOC-267-1', 'Contratto', 'Da Scansionare', 267, NULL, NULL, NULL, 1),
(932, 'DOC-267-2', 'Fattura', 'Da Scansionare', 267, NULL, NULL, NULL, 1),
(933, 'DOC-267-3', 'Modulo Privacy', 'Da Scansionare', 267, NULL, NULL, NULL, 1),
(934, 'DOC-267-4', 'DDT', 'Da Scansionare', 267, NULL, NULL, NULL, 1),
(935, 'DOC-267-5', 'Nota Spese', 'Da Scansionare', 267, NULL, NULL, NULL, 1),
(936, 'DOC-268-1', 'Contratto', 'Da Scansionare', 268, NULL, NULL, NULL, 1),
(937, 'DOC-268-2', 'Fattura', 'Da Scansionare', 268, NULL, NULL, NULL, 1),
(938, 'DOC-268-3', 'Modulo Privacy', 'Da Scansionare', 268, NULL, NULL, NULL, 1),
(939, 'DOC-268-4', 'DDT', 'Da Scansionare', 268, NULL, NULL, NULL, 1),
(940, 'DOC-268-5', 'Nota Spese', 'Da Scansionare', 268, NULL, NULL, NULL, 1),
(941, 'DOC-269-1', 'Contratto', 'Da Scansionare', 269, NULL, NULL, NULL, 1),
(942, 'DOC-269-2', 'Fattura', 'Da Scansionare', 269, NULL, NULL, NULL, 1),
(943, 'DOC-269-3', 'Modulo Privacy', 'Da Scansionare', 269, NULL, NULL, NULL, 1),
(944, 'DOC-269-4', 'DDT', 'Da Scansionare', 269, NULL, NULL, NULL, 1),
(945, 'DOC-269-5', 'Nota Spese', 'Da Scansionare', 269, NULL, NULL, NULL, 1),
(946, 'DOC-270-1', 'Contratto', 'Da Scansionare', 270, NULL, NULL, NULL, 1),
(947, 'DOC-270-2', 'Fattura', 'Da Scansionare', 270, NULL, NULL, NULL, 1),
(948, 'DOC-270-3', 'Modulo Privacy', 'Da Scansionare', 270, NULL, NULL, NULL, 1),
(949, 'DOC-270-4', 'DDT', 'Da Scansionare', 270, NULL, NULL, NULL, 1),
(950, 'DOC-270-5', 'Nota Spese', 'Da Scansionare', 270, NULL, NULL, NULL, 1),
(951, 'DOC-271-1', 'Contratto', 'Da Scansionare', 271, NULL, NULL, NULL, 1),
(952, 'DOC-271-2', 'Fattura', 'Da Scansionare', 271, NULL, NULL, NULL, 1),
(953, 'DOC-271-3', 'Modulo Privacy', 'Da Scansionare', 271, NULL, NULL, NULL, 1),
(954, 'DOC-271-4', 'DDT', 'Da Scansionare', 271, NULL, NULL, NULL, 1),
(955, 'DOC-271-5', 'Nota Spese', 'Da Scansionare', 271, NULL, NULL, NULL, 1),
(956, 'DOC-272-1', 'Contratto', 'Da Scansionare', 272, NULL, NULL, NULL, 1),
(957, 'DOC-272-2', 'Fattura', 'Da Scansionare', 272, NULL, NULL, NULL, 1),
(958, 'DOC-272-3', 'Modulo Privacy', 'Da Scansionare', 272, NULL, NULL, NULL, 1),
(959, 'DOC-272-4', 'DDT', 'Da Scansionare', 272, NULL, NULL, NULL, 1),
(960, 'DOC-272-5', 'Nota Spese', 'Da Scansionare', 272, NULL, NULL, NULL, 1),
(961, 'DOC-273-1', 'Contratto', 'Da Scansionare', 273, NULL, NULL, NULL, 1),
(962, 'DOC-273-2', 'Fattura', 'Da Scansionare', 273, NULL, NULL, NULL, 1),
(963, 'DOC-273-3', 'Modulo Privacy', 'Da Scansionare', 273, NULL, NULL, NULL, 1),
(964, 'DOC-273-4', 'DDT', 'Da Scansionare', 273, NULL, NULL, NULL, 1),
(965, 'DOC-273-5', 'Nota Spese', 'Da Scansionare', 273, NULL, NULL, NULL, 1);
INSERT INTO `documenti` (`idDocumento`, `barcodeDocumento`, `tipoDocumento`, `statoDocumento`, `idMazzettaFK`, `percorsoFile`, `dataScansione`, `note`, `idOperatoreFK`) VALUES
(966, 'DOC-274-1', 'Contratto', 'Da Scansionare', 274, NULL, NULL, NULL, 1),
(967, 'DOC-274-2', 'Fattura', 'Da Scansionare', 274, NULL, NULL, NULL, 1),
(968, 'DOC-274-3', 'Modulo Privacy', 'Da Scansionare', 274, NULL, NULL, NULL, 1),
(969, 'DOC-274-4', 'DDT', 'Da Scansionare', 274, NULL, NULL, NULL, 1),
(970, 'DOC-274-5', 'Nota Spese', 'Da Scansionare', 274, NULL, NULL, NULL, 1),
(971, 'DOC-275-1', 'Contratto', 'Da Scansionare', 275, NULL, NULL, NULL, 1),
(972, 'DOC-275-2', 'Fattura', 'Da Scansionare', 275, NULL, NULL, NULL, 1),
(973, 'DOC-275-3', 'Modulo Privacy', 'Da Scansionare', 275, NULL, NULL, NULL, 1),
(974, 'DOC-275-4', 'DDT', 'Da Scansionare', 275, NULL, NULL, NULL, 1),
(975, 'DOC-275-5', 'Nota Spese', 'Da Scansionare', 275, NULL, NULL, NULL, 1),
(976, 'DOC-276-1', 'Contratto', 'Da Scansionare', 276, NULL, NULL, NULL, 1),
(977, 'DOC-276-2', 'Fattura', 'Da Scansionare', 276, NULL, NULL, NULL, 1),
(978, 'DOC-276-3', 'Modulo Privacy', 'Da Scansionare', 276, NULL, NULL, NULL, 1),
(979, 'DOC-276-4', 'DDT', 'Da Scansionare', 276, NULL, NULL, NULL, 1),
(980, 'DOC-276-5', 'Nota Spese', 'Da Scansionare', 276, NULL, NULL, NULL, 1),
(981, 'DOC-277-1', 'Contratto', 'Da Scansionare', 277, NULL, NULL, NULL, 1),
(982, 'DOC-277-2', 'Fattura', 'Da Scansionare', 277, NULL, NULL, NULL, 1),
(983, 'DOC-277-3', 'Modulo Privacy', 'Da Scansionare', 277, NULL, NULL, NULL, 1),
(984, 'DOC-277-4', 'DDT', 'Da Scansionare', 277, NULL, NULL, NULL, 1),
(985, 'DOC-277-5', 'Nota Spese', 'Da Scansionare', 277, NULL, NULL, NULL, 1),
(986, 'DOC-278-1', 'Contratto', 'Da Scansionare', 278, NULL, NULL, NULL, 1),
(987, 'DOC-278-2', 'Fattura', 'Da Scansionare', 278, NULL, NULL, NULL, 1),
(988, 'DOC-278-3', 'Modulo Privacy', 'Da Scansionare', 278, NULL, NULL, NULL, 1),
(989, 'DOC-278-4', 'DDT', 'Da Scansionare', 278, NULL, NULL, NULL, 1),
(990, 'DOC-278-5', 'Nota Spese', 'Da Scansionare', 278, NULL, NULL, NULL, 1),
(991, 'DOC-279-1', 'Contratto', 'Da Scansionare', 279, NULL, NULL, NULL, 1),
(992, 'DOC-279-2', 'Fattura', 'Da Scansionare', 279, NULL, NULL, NULL, 1),
(993, 'DOC-279-3', 'Modulo Privacy', 'Da Scansionare', 279, NULL, NULL, NULL, 1),
(994, 'DOC-279-4', 'DDT', 'Da Scansionare', 279, NULL, NULL, NULL, 1),
(995, 'DOC-279-5', 'Nota Spese', 'Da Scansionare', 279, NULL, NULL, NULL, 1),
(996, 'DOC-280-1', 'Contratto', 'Da Scansionare', 280, NULL, NULL, NULL, 1),
(997, 'DOC-280-2', 'Fattura', 'Da Scansionare', 280, NULL, NULL, NULL, 1),
(998, 'DOC-280-3', 'Modulo Privacy', 'Da Scansionare', 280, NULL, NULL, NULL, 1),
(999, 'DOC-280-4', 'DDT', 'Da Scansionare', 280, NULL, NULL, NULL, 1),
(1000, 'DOC-280-5', 'Nota Spese', 'Da Scansionare', 280, NULL, NULL, NULL, 1),
(1001, 'DOC-281-1', 'Contratto', 'Da Scansionare', 281, NULL, NULL, NULL, 1),
(1002, 'DOC-281-2', 'Fattura', 'Da Scansionare', 281, NULL, NULL, NULL, 1),
(1003, 'DOC-281-3', 'Modulo Privacy', 'Da Scansionare', 281, NULL, NULL, NULL, 1),
(1004, 'DOC-281-4', 'DDT', 'Da Scansionare', 281, NULL, NULL, NULL, 1),
(1005, 'DOC-281-5', 'Nota Spese', 'Da Scansionare', 281, NULL, NULL, NULL, 1),
(1006, 'DOC-282-1', 'Contratto', 'Da Scansionare', 282, NULL, NULL, NULL, 1),
(1007, 'DOC-282-2', 'Fattura', 'Da Scansionare', 282, NULL, NULL, NULL, 1),
(1008, 'DOC-282-3', 'Modulo Privacy', 'Da Scansionare', 282, NULL, NULL, NULL, 1),
(1009, 'DOC-282-4', 'DDT', 'Da Scansionare', 282, NULL, NULL, NULL, 1),
(1010, 'DOC-282-5', 'Nota Spese', 'Da Scansionare', 282, NULL, NULL, NULL, 1),
(1011, 'DOC-283-1', 'Contratto', 'Da Scansionare', 283, NULL, NULL, NULL, 1),
(1012, 'DOC-283-2', 'Fattura', 'Da Scansionare', 283, NULL, NULL, NULL, 1),
(1013, 'DOC-283-3', 'Modulo Privacy', 'Da Scansionare', 283, NULL, NULL, NULL, 1),
(1014, 'DOC-283-4', 'DDT', 'Da Scansionare', 283, NULL, NULL, NULL, 1),
(1015, 'DOC-283-5', 'Nota Spese', 'Da Scansionare', 283, NULL, NULL, NULL, 1),
(1016, 'DOC-284-1', 'Contratto', 'Da Scansionare', 284, NULL, NULL, NULL, 1),
(1017, 'DOC-284-2', 'Fattura', 'Da Scansionare', 284, NULL, NULL, NULL, 1),
(1018, 'DOC-284-3', 'Modulo Privacy', 'Da Scansionare', 284, NULL, NULL, NULL, 1),
(1019, 'DOC-284-4', 'DDT', 'Da Scansionare', 284, NULL, NULL, NULL, 1),
(1020, 'DOC-284-5', 'Nota Spese', 'Da Scansionare', 284, NULL, NULL, NULL, 1),
(1021, 'DOC-285-1', 'Contratto', 'Da Scansionare', 285, NULL, NULL, NULL, 1),
(1022, 'DOC-285-2', 'Fattura', 'Da Scansionare', 285, NULL, NULL, NULL, 1),
(1023, 'DOC-285-3', 'Modulo Privacy', 'Da Scansionare', 285, NULL, NULL, NULL, 1),
(1024, 'DOC-285-4', 'DDT', 'Da Scansionare', 285, NULL, NULL, NULL, 1),
(1025, 'DOC-285-5', 'Nota Spese', 'Da Scansionare', 285, NULL, NULL, NULL, 1),
(1026, 'DOC-286-1', 'Contratto', 'Da Scansionare', 286, NULL, NULL, NULL, 1),
(1027, 'DOC-286-2', 'Fattura', 'Da Scansionare', 286, NULL, NULL, NULL, 1),
(1028, 'DOC-286-3', 'Modulo Privacy', 'Da Scansionare', 286, NULL, NULL, NULL, 1),
(1029, 'DOC-286-4', 'DDT', 'Da Scansionare', 286, NULL, NULL, NULL, 1),
(1030, 'DOC-286-5', 'Nota Spese', 'Da Scansionare', 286, NULL, NULL, NULL, 1),
(1031, 'DOC-287-1', 'Contratto', 'Da Scansionare', 287, NULL, NULL, NULL, 1),
(1032, 'DOC-287-2', 'Fattura', 'Da Scansionare', 287, NULL, NULL, NULL, 1),
(1033, 'DOC-287-3', 'Modulo Privacy', 'Da Scansionare', 287, NULL, NULL, NULL, 1),
(1034, 'DOC-287-4', 'DDT', 'Da Scansionare', 287, NULL, NULL, NULL, 1),
(1035, 'DOC-287-5', 'Nota Spese', 'Da Scansionare', 287, NULL, NULL, NULL, 1),
(1036, 'DOC-288-1', 'Contratto', 'Da Scansionare', 288, NULL, NULL, NULL, 1),
(1037, 'DOC-288-2', 'Fattura', 'Da Scansionare', 288, NULL, NULL, NULL, 1),
(1038, 'DOC-288-3', 'Modulo Privacy', 'Da Scansionare', 288, NULL, NULL, NULL, 1),
(1039, 'DOC-288-4', 'DDT', 'Da Scansionare', 288, NULL, NULL, NULL, 1),
(1040, 'DOC-288-5', 'Nota Spese', 'Da Scansionare', 288, NULL, NULL, NULL, 1),
(1041, 'DOC-289-1', 'Contratto', 'Da Scansionare', 289, NULL, NULL, NULL, 1),
(1042, 'DOC-289-2', 'Fattura', 'Da Scansionare', 289, NULL, NULL, NULL, 1),
(1043, 'DOC-289-3', 'Modulo Privacy', 'Da Scansionare', 289, NULL, NULL, NULL, 1),
(1044, 'DOC-289-4', 'DDT', 'Da Scansionare', 289, NULL, NULL, NULL, 1),
(1045, 'DOC-289-5', 'Nota Spese', 'Da Scansionare', 289, NULL, NULL, NULL, 1),
(1046, 'DOC-290-1', 'Contratto', 'Da Scansionare', 290, NULL, NULL, NULL, 1),
(1047, 'DOC-290-2', 'Fattura', 'Da Scansionare', 290, NULL, NULL, NULL, 1),
(1048, 'DOC-290-3', 'Modulo Privacy', 'Da Scansionare', 290, NULL, NULL, NULL, 1),
(1049, 'DOC-290-4', 'DDT', 'Da Scansionare', 290, NULL, NULL, NULL, 1),
(1050, 'DOC-290-5', 'Nota Spese', 'Da Scansionare', 290, NULL, NULL, NULL, 1),
(1051, 'DOC-291-1', 'Contratto', 'Da Scansionare', 291, NULL, NULL, NULL, 1),
(1052, 'DOC-291-2', 'Fattura', 'Da Scansionare', 291, NULL, NULL, NULL, 1),
(1053, 'DOC-291-3', 'Modulo Privacy', 'Da Scansionare', 291, NULL, NULL, NULL, 1),
(1054, 'DOC-291-4', 'DDT', 'Da Scansionare', 291, NULL, NULL, NULL, 1),
(1055, 'DOC-291-5', 'Nota Spese', 'Da Scansionare', 291, NULL, NULL, NULL, 1),
(1056, 'DOC-292-1', 'Contratto', 'Da Scansionare', 292, NULL, NULL, NULL, 1),
(1057, 'DOC-292-2', 'Fattura', 'Da Scansionare', 292, NULL, NULL, NULL, 1),
(1058, 'DOC-292-3', 'Modulo Privacy', 'Da Scansionare', 292, NULL, NULL, NULL, 1),
(1059, 'DOC-292-4', 'DDT', 'Da Scansionare', 292, NULL, NULL, NULL, 1),
(1060, 'DOC-292-5', 'Nota Spese', 'Da Scansionare', 292, NULL, NULL, NULL, 1),
(1061, 'DOC-293-1', 'Contratto', 'Da Scansionare', 293, NULL, NULL, NULL, 1),
(1062, 'DOC-293-2', 'Fattura', 'Da Scansionare', 293, NULL, NULL, NULL, 1),
(1063, 'DOC-293-3', 'Modulo Privacy', 'Da Scansionare', 293, NULL, NULL, NULL, 1),
(1064, 'DOC-293-4', 'DDT', 'Da Scansionare', 293, NULL, NULL, NULL, 1),
(1065, 'DOC-293-5', 'Nota Spese', 'Da Scansionare', 293, NULL, NULL, NULL, 1),
(1066, 'DOC-294-1', 'Contratto', 'Da Scansionare', 294, NULL, NULL, NULL, 1),
(1067, 'DOC-294-2', 'Fattura', 'Da Scansionare', 294, NULL, NULL, NULL, 1),
(1068, 'DOC-294-3', 'Modulo Privacy', 'Da Scansionare', 294, NULL, NULL, NULL, 1),
(1069, 'DOC-294-4', 'DDT', 'Da Scansionare', 294, NULL, NULL, NULL, 1),
(1070, 'DOC-294-5', 'Nota Spese', 'Da Scansionare', 294, NULL, NULL, NULL, 1),
(1071, 'DOC-295-1', 'Contratto', 'Da Scansionare', 295, NULL, NULL, NULL, 1),
(1072, 'DOC-295-2', 'Fattura', 'Da Scansionare', 295, NULL, NULL, NULL, 1),
(1073, 'DOC-295-3', 'Modulo Privacy', 'Da Scansionare', 295, NULL, NULL, NULL, 1),
(1074, 'DOC-295-4', 'DDT', 'Da Scansionare', 295, NULL, NULL, NULL, 1),
(1075, 'DOC-295-5', 'Nota Spese', 'Da Scansionare', 295, NULL, NULL, NULL, 1),
(1076, 'DOC-296-1', 'Contratto', 'Da Scansionare', 296, NULL, NULL, NULL, 1),
(1077, 'DOC-296-2', 'Fattura', 'Da Scansionare', 296, NULL, NULL, NULL, 1),
(1078, 'DOC-296-3', 'Modulo Privacy', 'Da Scansionare', 296, NULL, NULL, NULL, 1),
(1079, 'DOC-296-4', 'DDT', 'Da Scansionare', 296, NULL, NULL, NULL, 1),
(1080, 'DOC-296-5', 'Nota Spese', 'Da Scansionare', 296, NULL, NULL, NULL, 1),
(1081, 'DOC-297-1', 'Contratto', 'Da Scansionare', 297, NULL, NULL, NULL, 1),
(1082, 'DOC-297-2', 'Fattura', 'Da Scansionare', 297, NULL, NULL, NULL, 1),
(1083, 'DOC-297-3', 'Modulo Privacy', 'Da Scansionare', 297, NULL, NULL, NULL, 1),
(1084, 'DOC-297-4', 'DDT', 'Da Scansionare', 297, NULL, NULL, NULL, 1),
(1085, 'DOC-297-5', 'Nota Spese', 'Da Scansionare', 297, NULL, NULL, NULL, 1),
(1086, 'DOC-298-1', 'Contratto', 'Da Scansionare', 298, NULL, NULL, NULL, 1),
(1087, 'DOC-298-2', 'Fattura', 'Da Scansionare', 298, NULL, NULL, NULL, 1),
(1088, 'DOC-298-3', 'Modulo Privacy', 'Da Scansionare', 298, NULL, NULL, NULL, 1),
(1089, 'DOC-298-4', 'DDT', 'Da Scansionare', 298, NULL, NULL, NULL, 1),
(1090, 'DOC-298-5', 'Nota Spese', 'Da Scansionare', 298, NULL, NULL, NULL, 1),
(1091, 'DOC-299-1', 'Contratto', 'Da Scansionare', 299, NULL, NULL, NULL, 1),
(1092, 'DOC-299-2', 'Fattura', 'Da Scansionare', 299, NULL, NULL, NULL, 1),
(1093, 'DOC-299-3', 'Modulo Privacy', 'Da Scansionare', 299, NULL, NULL, NULL, 1),
(1094, 'DOC-299-4', 'DDT', 'Da Scansionare', 299, NULL, NULL, NULL, 1),
(1095, 'DOC-299-5', 'Nota Spese', 'Da Scansionare', 299, NULL, NULL, NULL, 1),
(1096, 'DOC-300-1', 'Contratto', 'Da Scansionare', 300, NULL, NULL, NULL, 1),
(1097, 'DOC-300-2', 'Fattura', 'Da Scansionare', 300, NULL, NULL, NULL, 1),
(1098, 'DOC-300-3', 'Modulo Privacy', 'Da Scansionare', 300, NULL, NULL, NULL, 1),
(1099, 'DOC-300-4', 'DDT', 'Da Scansionare', 300, NULL, NULL, NULL, 1),
(1100, 'DOC-300-5', 'Nota Spese', 'Da Scansionare', 300, NULL, NULL, NULL, 1),
(1101, 'DOC-301-1', 'Contratto', 'Da Scansionare', 301, NULL, NULL, NULL, 1),
(1102, 'DOC-301-2', 'Fattura', 'Da Scansionare', 301, NULL, NULL, NULL, 1),
(1103, 'DOC-301-3', 'Modulo Privacy', 'Da Scansionare', 301, NULL, NULL, NULL, 1),
(1104, 'DOC-301-4', 'DDT', 'Da Scansionare', 301, NULL, NULL, NULL, 1),
(1105, 'DOC-301-5', 'Nota Spese', 'Da Scansionare', 301, NULL, NULL, NULL, 1),
(1106, 'DOC-302-1', 'Contratto', 'Da Scansionare', 302, NULL, NULL, NULL, 1),
(1107, 'DOC-302-2', 'Fattura', 'Da Scansionare', 302, NULL, NULL, NULL, 1),
(1108, 'DOC-302-3', 'Modulo Privacy', 'Da Scansionare', 302, NULL, NULL, NULL, 1),
(1109, 'DOC-302-4', 'DDT', 'Da Scansionare', 302, NULL, NULL, NULL, 1),
(1110, 'DOC-302-5', 'Nota Spese', 'Da Scansionare', 302, NULL, NULL, NULL, 1),
(1111, 'DOC-303-1', 'Contratto', 'Da Scansionare', 303, NULL, NULL, NULL, 1),
(1112, 'DOC-303-2', 'Fattura', 'Da Scansionare', 303, NULL, NULL, NULL, 1),
(1113, 'DOC-303-3', 'Modulo Privacy', 'Da Scansionare', 303, NULL, NULL, NULL, 1),
(1114, 'DOC-303-4', 'DDT', 'Da Scansionare', 303, NULL, NULL, NULL, 1),
(1115, 'DOC-303-5', 'Nota Spese', 'Da Scansionare', 303, NULL, NULL, NULL, 1),
(1116, 'DOC-304-1', 'Contratto', 'Da Scansionare', 304, NULL, NULL, NULL, 1),
(1117, 'DOC-304-2', 'Fattura', 'Da Scansionare', 304, NULL, NULL, NULL, 1),
(1118, 'DOC-304-3', 'Modulo Privacy', 'Da Scansionare', 304, NULL, NULL, NULL, 1),
(1119, 'DOC-304-4', 'DDT', 'Da Scansionare', 304, NULL, NULL, NULL, 1),
(1120, 'DOC-304-5', 'Nota Spese', 'Da Scansionare', 304, NULL, NULL, NULL, 1),
(1121, 'DOC-305-1', 'Contratto', 'Da Scansionare', 305, NULL, NULL, NULL, 1),
(1122, 'DOC-305-2', 'Fattura', 'Da Scansionare', 305, NULL, NULL, NULL, 1),
(1123, 'DOC-305-3', 'Modulo Privacy', 'Da Scansionare', 305, NULL, NULL, NULL, 1),
(1124, 'DOC-305-4', 'DDT', 'Da Scansionare', 305, NULL, NULL, NULL, 1),
(1125, 'DOC-305-5', 'Nota Spese', 'Da Scansionare', 305, NULL, NULL, NULL, 1),
(1126, 'DOC-306-1', 'Contratto', 'Da Scansionare', 306, NULL, NULL, NULL, 1),
(1127, 'DOC-306-2', 'Fattura', 'Da Scansionare', 306, NULL, NULL, NULL, 1),
(1128, 'DOC-306-3', 'Modulo Privacy', 'Da Scansionare', 306, NULL, NULL, NULL, 1),
(1129, 'DOC-306-4', 'DDT', 'Da Scansionare', 306, NULL, NULL, NULL, 1),
(1130, 'DOC-306-5', 'Nota Spese', 'Da Scansionare', 306, NULL, NULL, NULL, 1),
(1131, 'DOC-307-1', 'Contratto', 'Da Scansionare', 307, NULL, NULL, NULL, 1),
(1132, 'DOC-307-2', 'Fattura', 'Da Scansionare', 307, NULL, NULL, NULL, 1),
(1133, 'DOC-307-3', 'Modulo Privacy', 'Da Scansionare', 307, NULL, NULL, NULL, 1),
(1134, 'DOC-307-4', 'DDT', 'Da Scansionare', 307, NULL, NULL, NULL, 1),
(1135, 'DOC-307-5', 'Nota Spese', 'Da Scansionare', 307, NULL, NULL, NULL, 1),
(1136, 'DOC-308-1', 'Contratto', 'Da Scansionare', 308, NULL, NULL, NULL, 1),
(1137, 'DOC-308-2', 'Fattura', 'Da Scansionare', 308, NULL, NULL, NULL, 1),
(1138, 'DOC-308-3', 'Modulo Privacy', 'Da Scansionare', 308, NULL, NULL, NULL, 1),
(1139, 'DOC-308-4', 'DDT', 'Da Scansionare', 308, NULL, NULL, NULL, 1),
(1140, 'DOC-308-5', 'Nota Spese', 'Da Scansionare', 308, NULL, NULL, NULL, 1),
(1141, 'DOC-309-1', 'Contratto', 'Da Scansionare', 309, NULL, NULL, NULL, 1),
(1142, 'DOC-309-2', 'Fattura', 'Da Scansionare', 309, NULL, NULL, NULL, 1),
(1143, 'DOC-309-3', 'Modulo Privacy', 'Da Scansionare', 309, NULL, NULL, NULL, 1),
(1144, 'DOC-309-4', 'DDT', 'Da Scansionare', 309, NULL, NULL, NULL, 1),
(1145, 'DOC-309-5', 'Nota Spese', 'Da Scansionare', 309, NULL, NULL, NULL, 1),
(1146, 'DOC-310-1', 'Contratto', 'Da Scansionare', 310, NULL, NULL, NULL, 1),
(1147, 'DOC-310-2', 'Fattura', 'Da Scansionare', 310, NULL, NULL, NULL, 1),
(1148, 'DOC-310-3', 'Modulo Privacy', 'Da Scansionare', 310, NULL, NULL, NULL, 1),
(1149, 'DOC-310-4', 'DDT', 'Da Scansionare', 310, NULL, NULL, NULL, 1),
(1150, 'DOC-310-5', 'Nota Spese', 'Da Scansionare', 310, NULL, NULL, NULL, 1),
(1151, 'DOC-311-1', 'Contratto', 'Da Scansionare', 311, NULL, NULL, NULL, 1),
(1152, 'DOC-311-2', 'Fattura', 'Da Scansionare', 311, NULL, NULL, NULL, 1),
(1153, 'DOC-311-3', 'Modulo Privacy', 'Da Scansionare', 311, NULL, NULL, NULL, 1),
(1154, 'DOC-311-4', 'DDT', 'Da Scansionare', 311, NULL, NULL, NULL, 1),
(1155, 'DOC-311-5', 'Nota Spese', 'Da Scansionare', 311, NULL, NULL, NULL, 1),
(1156, 'DOC-312-1', 'Contratto', 'Da Scansionare', 312, NULL, NULL, NULL, 1),
(1157, 'DOC-312-2', 'Fattura', 'Da Scansionare', 312, NULL, NULL, NULL, 1),
(1158, 'DOC-312-3', 'Modulo Privacy', 'Da Scansionare', 312, NULL, NULL, NULL, 1),
(1159, 'DOC-312-4', 'DDT', 'Da Scansionare', 312, NULL, NULL, NULL, 1),
(1160, 'DOC-312-5', 'Nota Spese', 'Da Scansionare', 312, NULL, NULL, NULL, 1),
(1161, 'DOC-313-1', 'Contratto', 'Da Scansionare', 313, NULL, NULL, NULL, 1),
(1162, 'DOC-313-2', 'Fattura', 'Da Scansionare', 313, NULL, NULL, NULL, 1),
(1163, 'DOC-313-3', 'Modulo Privacy', 'Da Scansionare', 313, NULL, NULL, NULL, 1),
(1164, 'DOC-313-4', 'DDT', 'Da Scansionare', 313, NULL, NULL, NULL, 1),
(1165, 'DOC-313-5', 'Nota Spese', 'Da Scansionare', 313, NULL, NULL, NULL, 1),
(1166, 'DOC-314-1', 'Contratto', 'Da Scansionare', 314, NULL, NULL, NULL, 1),
(1167, 'DOC-314-2', 'Fattura', 'Da Scansionare', 314, NULL, NULL, NULL, 1),
(1168, 'DOC-314-3', 'Modulo Privacy', 'Da Scansionare', 314, NULL, NULL, NULL, 1),
(1169, 'DOC-314-4', 'DDT', 'Da Scansionare', 314, NULL, NULL, NULL, 1),
(1170, 'DOC-314-5', 'Nota Spese', 'Da Scansionare', 314, NULL, NULL, NULL, 1),
(1171, 'DOC-315-1', 'Contratto', 'Da Scansionare', 315, NULL, NULL, NULL, 1),
(1172, 'DOC-315-2', 'Fattura', 'Da Scansionare', 315, NULL, NULL, NULL, 1),
(1173, 'DOC-315-3', 'Modulo Privacy', 'Da Scansionare', 315, NULL, NULL, NULL, 1),
(1174, 'DOC-315-4', 'DDT', 'Da Scansionare', 315, NULL, NULL, NULL, 1),
(1175, 'DOC-315-5', 'Nota Spese', 'Da Scansionare', 315, NULL, NULL, NULL, 1),
(1176, 'DOC-316-1', 'Contratto', 'Da Scansionare', 316, NULL, NULL, NULL, 1),
(1177, 'DOC-316-2', 'Fattura', 'Da Scansionare', 316, NULL, NULL, NULL, 1),
(1178, 'DOC-316-3', 'Modulo Privacy', 'Da Scansionare', 316, NULL, NULL, NULL, 1),
(1179, 'DOC-316-4', 'DDT', 'Da Scansionare', 316, NULL, NULL, NULL, 1),
(1180, 'DOC-316-5', 'Nota Spese', 'Da Scansionare', 316, NULL, NULL, NULL, 1),
(1181, 'DOC-317-1', 'Contratto', 'Da Scansionare', 317, NULL, NULL, NULL, 1),
(1182, 'DOC-317-2', 'Fattura', 'Da Scansionare', 317, NULL, NULL, NULL, 1),
(1183, 'DOC-317-3', 'Modulo Privacy', 'Da Scansionare', 317, NULL, NULL, NULL, 1),
(1184, 'DOC-317-4', 'DDT', 'Da Scansionare', 317, NULL, NULL, NULL, 1),
(1185, 'DOC-317-5', 'Nota Spese', 'Da Scansionare', 317, NULL, NULL, NULL, 1),
(1186, 'DOC-318-1', 'Contratto', 'Da Scansionare', 318, NULL, NULL, NULL, 1),
(1187, 'DOC-318-2', 'Fattura', 'Da Scansionare', 318, NULL, NULL, NULL, 1),
(1188, 'DOC-318-3', 'Modulo Privacy', 'Da Scansionare', 318, NULL, NULL, NULL, 1),
(1189, 'DOC-318-4', 'DDT', 'Da Scansionare', 318, NULL, NULL, NULL, 1),
(1190, 'DOC-318-5', 'Nota Spese', 'Da Scansionare', 318, NULL, NULL, NULL, 1),
(1191, 'DOC-319-1', 'Contratto', 'Da Scansionare', 319, NULL, NULL, NULL, 1),
(1192, 'DOC-319-2', 'Fattura', 'Da Scansionare', 319, NULL, NULL, NULL, 1),
(1193, 'DOC-319-3', 'Modulo Privacy', 'Da Scansionare', 319, NULL, NULL, NULL, 1),
(1194, 'DOC-319-4', 'DDT', 'Da Scansionare', 319, NULL, NULL, NULL, 1),
(1195, 'DOC-319-5', 'Nota Spese', 'Da Scansionare', 319, NULL, NULL, NULL, 1),
(1196, 'DOC-320-1', 'Contratto', 'Da Scansionare', 320, NULL, NULL, NULL, 1),
(1197, 'DOC-320-2', 'Fattura', 'Da Scansionare', 320, NULL, NULL, NULL, 1),
(1198, 'DOC-320-3', 'Modulo Privacy', 'Da Scansionare', 320, NULL, NULL, NULL, 1),
(1199, 'DOC-320-4', 'DDT', 'Da Scansionare', 320, NULL, NULL, NULL, 1),
(1200, 'DOC-320-5', 'Nota Spese', 'Da Scansionare', 320, NULL, NULL, NULL, 1),
(1201, 'DOC-321-1', 'Contratto', 'Da Scansionare', 321, NULL, NULL, NULL, 1),
(1202, 'DOC-321-2', 'Fattura', 'Da Scansionare', 321, NULL, NULL, NULL, 1),
(1203, 'DOC-321-3', 'Modulo Privacy', 'Da Scansionare', 321, NULL, NULL, NULL, 1),
(1204, 'DOC-321-4', 'DDT', 'Da Scansionare', 321, NULL, NULL, NULL, 1),
(1205, 'DOC-321-5', 'Nota Spese', 'Da Scansionare', 321, NULL, NULL, NULL, 1),
(1206, 'DOC-322-1', 'Contratto', 'Da Scansionare', 322, NULL, NULL, NULL, 1),
(1207, 'DOC-322-2', 'Fattura', 'Da Scansionare', 322, NULL, NULL, NULL, 1),
(1208, 'DOC-322-3', 'Modulo Privacy', 'Da Scansionare', 322, NULL, NULL, NULL, 1),
(1209, 'DOC-322-4', 'DDT', 'Da Scansionare', 322, NULL, NULL, NULL, 1),
(1210, 'DOC-322-5', 'Nota Spese', 'Da Scansionare', 322, NULL, NULL, NULL, 1),
(1211, 'DOC-323-1', 'Contratto', 'Da Scansionare', 323, NULL, NULL, NULL, 1),
(1212, 'DOC-323-2', 'Fattura', 'Da Scansionare', 323, NULL, NULL, NULL, 1),
(1213, 'DOC-323-3', 'Modulo Privacy', 'Da Scansionare', 323, NULL, NULL, NULL, 1),
(1214, 'DOC-323-4', 'DDT', 'Da Scansionare', 323, NULL, NULL, NULL, 1),
(1215, 'DOC-323-5', 'Nota Spese', 'Da Scansionare', 323, NULL, NULL, NULL, 1),
(1216, 'DOC-324-1', 'Contratto', 'Da Scansionare', 324, NULL, NULL, NULL, 1),
(1217, 'DOC-324-2', 'Fattura', 'Da Scansionare', 324, NULL, NULL, NULL, 1),
(1218, 'DOC-324-3', 'Modulo Privacy', 'Da Scansionare', 324, NULL, NULL, NULL, 1),
(1219, 'DOC-324-4', 'DDT', 'Da Scansionare', 324, NULL, NULL, NULL, 1),
(1220, 'DOC-324-5', 'Nota Spese', 'Da Scansionare', 324, NULL, NULL, NULL, 1),
(1221, 'DOC-325-1', 'Contratto', 'Da Scansionare', 325, NULL, NULL, NULL, 1),
(1222, 'DOC-325-2', 'Fattura', 'Da Scansionare', 325, NULL, NULL, NULL, 1),
(1223, 'DOC-325-3', 'Modulo Privacy', 'Da Scansionare', 325, NULL, NULL, NULL, 1),
(1224, 'DOC-325-4', 'DDT', 'Da Scansionare', 325, NULL, NULL, NULL, 1),
(1225, 'DOC-325-5', 'Nota Spese', 'Da Scansionare', 325, NULL, NULL, NULL, 1),
(1226, 'DOC-326-1', 'Contratto', 'Da Scansionare', 326, NULL, NULL, NULL, 1),
(1227, 'DOC-326-2', 'Fattura', 'Da Scansionare', 326, NULL, NULL, NULL, 1),
(1228, 'DOC-326-3', 'Modulo Privacy', 'Da Scansionare', 326, NULL, NULL, NULL, 1),
(1229, 'DOC-326-4', 'DDT', 'Da Scansionare', 326, NULL, NULL, NULL, 1),
(1230, 'DOC-326-5', 'Nota Spese', 'Da Scansionare', 326, NULL, NULL, NULL, 1),
(1231, 'DOC-327-1', 'Contratto', 'Da Scansionare', 327, NULL, NULL, NULL, 1),
(1232, 'DOC-327-2', 'Fattura', 'Da Scansionare', 327, NULL, NULL, NULL, 1),
(1233, 'DOC-327-3', 'Modulo Privacy', 'Da Scansionare', 327, NULL, NULL, NULL, 1),
(1234, 'DOC-327-4', 'DDT', 'Da Scansionare', 327, NULL, NULL, NULL, 1),
(1235, 'DOC-327-5', 'Nota Spese', 'Da Scansionare', 327, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `qta` int(11) NOT NULL DEFAULT '0',
  `descrizione` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `inventario`
--

INSERT INTO `inventario` (`id`, `tipo`, `qta`, `descrizione`) VALUES
(1, 'Scatola A4 standard', 997, 'Ideale per documenti d ufficio'),
(2, 'Busta imbottita A3', 498, 'Per spedizioni fragili'),
(3, 'Pallet Legno 80x120', 45, 'Pedane EPAL omologate'),
(4, 'Nastro adesivo PPL', 120, 'Rotoli per sigillatura colli'),
(5, 'Pacco Postale Standard', 499, 'Scatola in cartone onda singola, ideale per spedizioni standard fino a 20kg.'),
(6, 'Busta Imbottita A3', 1198, 'Busta con protezione interna in pluriball, formato 30x45cm per documenti e oggettistica leggera.'),
(7, 'Scatola Archivio Rigida', 299, 'Contenitore in cartone ultra-resistente con maniglie, specifico per stoccaggio documenti a lungo termine.'),
(8, 'Busta Lettera Pro', 1996, 'Busta in carta rinforzata con striscia autoadesiva, specifica per corrispondenza aziendale tracciata.'),
(9, 'Tubo Spedizioni (Small)', 150, 'Cilindro in cartone rigido con tappi in plastica, ideale per mappe, progetti e poster senza pieghe.'),
(10, 'Pacco Extra Large (XL)', 79, 'Scatola in cartone doppia onda rinforzata per carichi pesanti o voluminosi fino a 50kg.'),
(11, 'Contenitore Merci Pericolose', 24, 'Imballaggio omologato ONU per il trasporto sicuro di sostanze classificate o batterie al litio.'),
(12, 'Scatola Isotermica (Food)', 39, 'Contenitore in polistirolo espanso ad alta densità per spedizioni a temperatura controllata.'),
(13, 'Pacco Triplo Strato (Fragile)', 98, 'Imballaggio a massima protezione con tripla parete di cartone per cristalli, ceramiche o elettronica.');

-- --------------------------------------------------------

--
-- Struttura della tabella `macroservizi`
--

CREATE TABLE `macroservizi` (
  `id` int(11) NOT NULL,
  `nomeMacros` varchar(255) NOT NULL,
  `descrizioneMacros` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `macroservizi`
--

INSERT INTO `macroservizi` (`id`, `nomeMacros`, `descrizioneMacros`) VALUES
(2, 'Digitalizzazione', 'Scansione ottica, indicizzazione OCR e conservazione sostitutiva dei documenti.'),
(3, 'Logistica Postale', 'Gestione spedizioni, smistamento buste e servizi di corriere espresso.'),
(4, 'Archiviazione Fisica', 'Stoccaggio sicuro di faldoni cartacei, gestione scadenziari e distruzione certificata.'),
(5, 'Servizi Digitali Certificati', 'Gestione di identità digitale, firme elettroniche e comunicazioni con valore legale.'),
(6, 'Data Management', 'Bonifica database, normalizzazione indirizzi per spedizioni e data entry.');

-- --------------------------------------------------------

--
-- Struttura della tabella `mazzette`
--

CREATE TABLE `mazzette` (
  `idMazzetta` int(11) NOT NULL,
  `codiceMazzetta` varchar(100) NOT NULL,
  `posizione` int(11) NOT NULL DEFAULT '1',
  `numeroDocumenti` int(11) NOT NULL DEFAULT '0',
  `idScatolaFK` int(11) NOT NULL,
  `stato` enum('In Attesa','In Lavorazione','Scansionata','Completata','Anomala') DEFAULT 'In Attesa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `mazzette`
--

INSERT INTO `mazzette` (`idMazzetta`, `codiceMazzetta`, `posizione`, `numeroDocumenti`, `idScatolaFK`, `stato`) VALUES
(1, 'MAZ-001-A', 1, 10, 1, 'In Lavorazione'),
(2, 'MAZ-002-A', 1, 13, 2, 'Scansionata'),
(3, 'MAZ-003-A', 1, 8, 3, 'Anomala'),
(4, 'MAZ-004-A', 1, 5, 4, 'In Attesa'),
(5, 'MAZ-005-A', 1, 7, 5, 'In Lavorazione'),
(6, 'MAZ-006-A', 1, 11, 6, 'Scansionata'),
(7, 'MAZ-007-A', 1, 6, 7, 'Anomala'),
(8, 'MAZ-008-A', 1, 9, 8, 'In Attesa'),
(9, 'MAZ-009-A', 1, 10, 9, 'In Lavorazione'),
(10, 'MAZ-010-A', 1, 8, 25, 'Scansionata'),
(11, 'MAZ-011-A', 1, 10, 11, 'Anomala'),
(12, 'MAZ-012-A', 1, 12, 12, 'In Attesa'),
(13, 'MAZ-013-A', 1, 11, 13, 'In Lavorazione'),
(14, 'MAZ-014-A', 1, 9, 14, 'Scansionata'),
(15, 'MAZ-015-A', 1, 8, 15, 'Anomala'),
(16, 'MAZ-016-A', 1, 8, 16, 'In Attesa'),
(17, 'MAZ-017-A', 1, 5, 17, 'In Lavorazione'),
(18, 'MAZ-018-A', 1, 7, 18, 'Scansionata'),
(19, 'MAZ-019-A', 1, 8, 19, 'Anomala'),
(20, 'MAZ-020-A', 1, 7, 17, 'In Attesa'),
(32, 'MAZ-001-B', 2, 10, 1, 'Scansionata'),
(33, 'MAZ-002-B', 2, 11, 2, 'Anomala'),
(34, 'MAZ-003-B', 2, 6, 3, 'In Attesa'),
(35, 'MAZ-004-B', 2, 6, 4, 'In Lavorazione'),
(36, 'MAZ-005-B', 2, 10, 5, 'Scansionata'),
(37, 'MAZ-006-B', 2, 9, 6, 'Anomala'),
(38, 'MAZ-007-B', 2, 9, 7, 'In Attesa'),
(39, 'MAZ-008-B', 2, 15, 8, 'In Lavorazione'),
(40, 'MAZ-009-B', 2, 12, 9, 'Scansionata'),
(41, 'MAZ-010-B', 2, 10, 10, 'Anomala'),
(42, 'MAZ-011-B', 2, 10, 11, 'In Attesa'),
(43, 'MAZ-012-B', 2, 11, 12, 'In Lavorazione'),
(44, 'MAZ-013-B', 2, 8, 13, 'Scansionata'),
(45, 'MAZ-014-B', 2, 8, 14, 'Anomala'),
(46, 'MAZ-015-B', 2, 8, 15, 'In Attesa'),
(47, 'MAZ-016-B', 2, 6, 16, 'In Lavorazione'),
(48, 'MAZ-017-B', 2, 7, 17, 'Scansionata'),
(49, 'MAZ-018-B', 2, 11, 18, 'Anomala'),
(50, 'MAZ-019-B', 2, 6, 19, 'In Attesa'),
(51, 'MAZ-020-B', 2, 7, 20, 'In Lavorazione'),
(63, 'MAZ-001-A', 1, 3, 1, 'In Lavorazione'),
(64, 'MAZ-002-A', 1, 1, 2, 'Scansionata'),
(65, 'MAZ-003-A', 1, 6, 3, 'Anomala'),
(66, 'MAZ-004-A', 1, 8, 4, 'In Attesa'),
(67, 'MAZ-005-A', 1, 2, 5, 'In Lavorazione'),
(68, 'MAZ-006-A', 1, 4, 6, 'Scansionata'),
(69, 'MAZ-007-A', 1, 5, 7, 'Anomala'),
(70, 'MAZ-008-A', 1, 5, 8, 'In Attesa'),
(71, 'MAZ-009-A', 1, 3, 9, 'In Lavorazione'),
(72, 'MAZ-010-A', 1, 6, 10, 'Scansionata'),
(73, 'MAZ-011-A', 1, 2, 11, 'Anomala'),
(74, 'MAZ-012-A', 1, 3, 12, 'In Attesa'),
(75, 'MAZ-013-A', 1, 3, 13, 'In Lavorazione'),
(76, 'MAZ-014-A', 1, 1, 14, 'Scansionata'),
(77, 'MAZ-015-A', 1, 2, 15, 'Anomala'),
(78, 'MAZ-016-A', 1, 5, 16, 'In Attesa'),
(79, 'MAZ-017-A', 1, 3, 17, 'In Lavorazione'),
(80, 'MAZ-018-A', 1, 7, 18, 'Scansionata'),
(81, 'MAZ-019-A', 1, 2, 19, 'Anomala'),
(82, 'MAZ-020-A', 1, 4, 20, 'In Attesa'),
(94, 'MAZ-001-B', 2, 4, 1, 'Scansionata'),
(95, 'MAZ-002-B', 2, 9, 2, 'Anomala'),
(96, 'MAZ-003-B', 2, 3, 3, 'In Attesa'),
(97, 'MAZ-004-B', 2, 5, 4, 'In Lavorazione'),
(98, 'MAZ-005-B', 2, 1, 5, 'Scansionata'),
(99, 'MAZ-006-B', 2, 8, 6, 'Anomala'),
(100, 'MAZ-007-B', 2, 2, 7, 'In Attesa'),
(101, 'MAZ-008-B', 2, 2, 8, 'In Lavorazione'),
(102, 'MAZ-009-B', 2, 3, 9, 'Scansionata'),
(103, 'MAZ-010-B', 2, 3, 10, 'Anomala'),
(104, 'MAZ-011-B', 2, 1, 11, 'In Attesa'),
(105, 'MAZ-012-B', 2, 3, 12, 'In Lavorazione'),
(106, 'MAZ-013-B', 2, 2, 13, 'Scansionata'),
(107, 'MAZ-014-B', 2, 5, 14, 'Anomala'),
(108, 'MAZ-015-B', 2, 3, 15, 'In Attesa'),
(109, 'MAZ-016-B', 2, 5, 16, 'In Lavorazione'),
(110, 'MAZ-017-B', 2, 5, 17, 'Scansionata'),
(111, 'MAZ-018-B', 2, 3, 18, 'Anomala'),
(112, 'MAZ-019-B', 2, 5, 19, 'In Attesa'),
(113, 'MAZ-020-B', 2, 1, 20, 'In Lavorazione'),
(241, 'MAZ-2026-101', 1, 5, 24, 'In Attesa'),
(242, 'MAZ-2026-102', 1, 5, 30, 'In Attesa'),
(243, 'MAZ-2026-103', 1, 5, 36, 'In Attesa'),
(244, 'MAZ-2026-104', 1, 5, 42, 'In Attesa'),
(245, 'MAZ-2026-105', 1, 5, 48, 'In Attesa'),
(246, 'MAZ-2026-106', 1, 5, 54, 'In Attesa'),
(247, 'MAZ-2026-107', 1, 5, 60, 'In Attesa'),
(248, 'MAZ-2026-108', 1, 5, 66, 'In Attesa'),
(249, 'MAZ-2026-109', 1, 5, 72, 'In Attesa'),
(250, 'MAZ-2026-110', 1, 5, 78, 'In Attesa'),
(251, 'MAZ-2026-111', 1, 5, 84, 'In Attesa'),
(252, 'MAZ-2026-112', 1, 5, 90, 'In Attesa'),
(253, 'MAZ-2026-113', 1, 5, 96, 'In Attesa'),
(254, 'MAZ-2026-114', 1, 5, 105, 'In Attesa'),
(255, 'MAZ-2026-115', 1, 5, 106, 'In Attesa'),
(256, 'MAZ-2026-116', 1, 5, 107, 'In Attesa'),
(257, 'MAZ-2026-117', 1, 5, 108, 'In Attesa'),
(258, 'MAZ-2026-118', 1, 5, 109, 'In Attesa'),
(259, 'MAZ-2026-119', 1, 5, 110, 'In Attesa'),
(260, 'MAZ-2026-120', 1, 5, 111, 'In Attesa'),
(261, 'MAZ-2026-121', 1, 5, 112, 'In Attesa'),
(262, 'MAZ-2026-122', 1, 5, 31, 'In Attesa'),
(263, 'MAZ-2026-123', 1, 5, 37, 'In Attesa'),
(264, 'MAZ-2026-124', 1, 5, 43, 'In Attesa'),
(265, 'MAZ-2026-125', 1, 5, 49, 'In Attesa'),
(266, 'MAZ-2026-126', 1, 5, 55, 'In Attesa'),
(267, 'MAZ-2026-127', 1, 5, 61, 'In Attesa'),
(268, 'MAZ-2026-128', 1, 5, 67, 'In Attesa'),
(269, 'MAZ-2026-129', 1, 5, 73, 'In Attesa'),
(270, 'MAZ-2026-130', 1, 5, 79, 'In Attesa'),
(271, 'MAZ-2026-131', 1, 5, 85, 'In Attesa'),
(272, 'MAZ-2026-132', 1, 5, 91, 'In Attesa'),
(273, 'MAZ-2026-133', 1, 5, 97, 'In Attesa'),
(274, 'MAZ-2026-134', 1, 5, 26, 'In Attesa'),
(275, 'MAZ-2026-135', 1, 5, 32, 'In Attesa'),
(276, 'MAZ-2026-136', 1, 5, 38, 'In Attesa'),
(277, 'MAZ-2026-137', 1, 5, 44, 'In Attesa'),
(278, 'MAZ-2026-138', 1, 5, 50, 'In Attesa'),
(279, 'MAZ-2026-139', 1, 5, 56, 'In Attesa'),
(280, 'MAZ-2026-140', 1, 5, 62, 'In Attesa'),
(281, 'MAZ-2026-141', 1, 5, 68, 'In Attesa'),
(282, 'MAZ-2026-142', 1, 5, 74, 'In Attesa'),
(283, 'MAZ-2026-143', 1, 5, 80, 'In Attesa'),
(284, 'MAZ-2026-144', 1, 5, 86, 'In Attesa'),
(285, 'MAZ-2026-145', 1, 5, 92, 'In Attesa'),
(286, 'MAZ-2026-146', 1, 5, 98, 'In Attesa'),
(287, 'MAZ-2026-147', 1, 5, 21, 'In Attesa'),
(288, 'MAZ-2026-148', 1, 5, 27, 'In Attesa'),
(289, 'MAZ-2026-149', 1, 5, 33, 'In Attesa'),
(290, 'MAZ-2026-150', 1, 5, 39, 'In Attesa'),
(291, 'MAZ-2026-151', 1, 5, 45, 'In Attesa'),
(292, 'MAZ-2026-152', 1, 5, 51, 'In Attesa'),
(293, 'MAZ-2026-153', 1, 5, 57, 'In Attesa'),
(294, 'MAZ-2026-154', 1, 5, 63, 'In Attesa'),
(295, 'MAZ-2026-155', 1, 5, 69, 'In Attesa'),
(296, 'MAZ-2026-156', 1, 5, 75, 'In Attesa'),
(297, 'MAZ-2026-157', 1, 5, 81, 'In Attesa'),
(298, 'MAZ-2026-158', 1, 5, 87, 'In Attesa'),
(299, 'MAZ-2026-159', 1, 5, 93, 'In Attesa'),
(300, 'MAZ-2026-160', 1, 5, 99, 'In Attesa'),
(301, 'MAZ-2026-161', 1, 5, 22, 'In Attesa'),
(302, 'MAZ-2026-162', 1, 5, 28, 'In Attesa'),
(303, 'MAZ-2026-163', 1, 5, 34, 'In Attesa'),
(304, 'MAZ-2026-164', 1, 5, 40, 'In Attesa'),
(305, 'MAZ-2026-165', 1, 5, 46, 'In Attesa'),
(306, 'MAZ-2026-166', 1, 5, 52, 'In Attesa'),
(307, 'MAZ-2026-167', 1, 5, 58, 'In Attesa'),
(308, 'MAZ-2026-168', 1, 5, 64, 'In Attesa'),
(309, 'MAZ-2026-169', 1, 5, 70, 'In Attesa'),
(310, 'MAZ-2026-170', 1, 5, 76, 'In Attesa'),
(311, 'MAZ-2026-171', 1, 5, 82, 'In Attesa'),
(312, 'MAZ-2026-172', 1, 5, 88, 'In Attesa'),
(313, 'MAZ-2026-173', 1, 5, 94, 'In Attesa'),
(314, 'MAZ-2026-174', 1, 5, 100, 'In Attesa'),
(315, 'MAZ-2026-175', 1, 5, 23, 'In Attesa'),
(316, 'MAZ-2026-176', 1, 5, 29, 'In Attesa'),
(317, 'MAZ-2026-177', 1, 5, 35, 'In Attesa'),
(318, 'MAZ-2026-178', 1, 5, 41, 'In Attesa'),
(319, 'MAZ-2026-179', 1, 5, 47, 'In Attesa'),
(320, 'MAZ-2026-180', 1, 5, 53, 'In Attesa'),
(321, 'MAZ-2026-181', 1, 5, 59, 'In Attesa'),
(322, 'MAZ-2026-182', 1, 5, 65, 'In Attesa'),
(323, 'MAZ-2026-183', 1, 5, 71, 'In Attesa'),
(324, 'MAZ-2026-184', 1, 5, 77, 'In Attesa'),
(325, 'MAZ-2026-185', 1, 5, 83, 'In Attesa'),
(326, 'MAZ-2026-186', 1, 5, 89, 'In Attesa'),
(327, 'MAZ-2026-187', 1, 5, 95, 'In Attesa');

-- --------------------------------------------------------

--
-- Struttura della tabella `pallet`
--

CREATE TABLE `pallet` (
  `idPallet` int(11) NOT NULL,
  `codicePallet` varchar(50) NOT NULL,
  `dataCreazione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataArrivo` datetime DEFAULT NULL,
  `stato` int(11) NOT NULL,
  `statoDescrizione` varchar(50) NOT NULL DEFAULT '''In lavorazione''',
  `idOperatoreFK` int(11) NOT NULL,
  `note` text,
  `idSpedizioneFK` int(11) DEFAULT NULL,
  `idDdtFK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `pallet`
--

INSERT INTO `pallet` (`idPallet`, `codicePallet`, `dataCreazione`, `dataArrivo`, `stato`, `statoDescrizione`, `idOperatoreFK`, `note`, `idSpedizioneFK`, `idDdtFK`) VALUES
(5, 'PALL20260325-001', '2026-03-25 15:27:35', NULL, 1, 'Chiuso', 1, 'Contenuto fragile', NULL, 9),
(6, 'PALL20260325-002', '2026-03-25 15:31:46', NULL, 1, 'Chiuso', 1, '', NULL, 11),
(7, 'PALL20260325-003', '2026-03-25 15:31:57', NULL, 1, 'Chiuso', 1, '', NULL, 9),
(8, 'PALL20260325-004', '2026-03-25 15:32:14', NULL, 1, 'Chiuso', 1, '', NULL, 4),
(9, 'PALL20260325-005', '2026-03-25 15:34:00', NULL, 1, 'Chiuso', 1, '', NULL, 4),
(10, 'PALL20260413-001', '2026-04-13 11:40:57', NULL, 1, 'Chiuso', 1, '', NULL, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `scatole`
--

CREATE TABLE `scatole` (
  `idScatola` int(11) NOT NULL,
  `codiceScatola` varchar(100) NOT NULL,
  `idDdtFK` int(11) UNSIGNED DEFAULT NULL,
  `idOperatoreFK` int(11) NOT NULL,
  `tipologia` varchar(100) DEFAULT 'Pacco Postale Standard',
  `stato` int(11) NOT NULL DEFAULT '1',
  `statoDescrizione` varchar(100) NOT NULL DEFAULT 'Ricevuta',
  `idClienteFK` int(11) NOT NULL,
  `idSpedizioneFK` int(11) DEFAULT NULL,
  `dataCreazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idPalletFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `scatole`
--

INSERT INTO `scatole` (`idScatola`, `codiceScatola`, `idDdtFK`, `idOperatoreFK`, `tipologia`, `stato`, `statoDescrizione`, `idClienteFK`, `idSpedizioneFK`, `dataCreazione`, `idPalletFK`) VALUES
(1, 'SCAT001', 1, 2, 'Busta Imbottita A3', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(2, 'SCAT002', 1, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(3, 'SCAT003', 1, 6, 'Pacco Postale Standard', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(4, 'SCAT004', 1, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(5, 'SCAT005', 1, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(6, 'SCAT006', 1, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(7, 'SCAT007', 1, 2, 'Busta Imbottita A3', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(8, 'SCAT008', 1, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(9, 'SCAT009', 1, 6, 'Pacco Postale Standard', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(10, 'SCAT010', 1, 9, 'Busta Imbottita A3', 3, 'Completata', 1, 1, '2026-02-26 16:10:25', NULL),
(11, 'SCAT011', 1, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(12, 'SCAT012', 1, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(13, 'SCAT013', 1, 2, 'Busta Imbottita A3', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(14, 'SCAT014', 1, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(15, 'SCAT015', 1, 6, 'Pacco Postale Standard', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(16, 'SCAT016', 1, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(17, 'SCAT017', 1, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(18, 'SCAT018', 1, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(19, 'SCAT019', 1, 2, 'Busta Imbottita A3', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(20, 'SCAT020', 1, 3, 'Scatola Archivio Rigida', 3, 'Completata', 1, 1, '2026-02-26 16:10:25', NULL),
(21, 'SCAT021', 1, 6, 'Pacco Postale Standard', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(22, 'SCAT022', 1, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(23, 'SCAT023', 1, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(24, 'SCAT024', 1, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 1, 1, '2026-02-26 16:10:25', NULL),
(25, 'SCAT025', 1, 2, 'Busta Imbottita A3', 1, 'Inserita', 1, 1, '2026-02-26 16:10:25', NULL),
(26, 'SCAT026', 2, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(27, 'SCAT027', 2, 6, 'Pacco Postale Standard', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(28, 'SCAT028', 2, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(29, 'SCAT029', 2, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(30, 'SCAT030', 2, 1, 'Pacco Postale Standard', 3, 'Completata', 2, 2, '2026-02-26 16:10:25', NULL),
(31, 'SCAT031', 2, 2, 'Busta Imbottita A3', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(32, 'SCAT032', 2, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(33, 'SCAT033', 2, 6, 'Pacco Postale Standard', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(34, 'SCAT034', 2, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(35, 'SCAT035', 2, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(36, 'SCAT036', 2, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(37, 'SCAT037', 2, 2, 'Busta Imbottita A3', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(38, 'SCAT038', 2, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(39, 'SCAT039', 2, 6, 'Pacco Postale Standard', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(40, 'SCAT040', 2, 9, 'Busta Imbottita A3', 3, 'Completata', 2, 2, '2026-02-26 16:10:25', NULL),
(41, 'SCAT041', 2, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(42, 'SCAT042', 2, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(43, 'SCAT043', 2, 2, 'Busta Imbottita A3', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(44, 'SCAT044', 2, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(45, 'SCAT045', 2, 6, 'Pacco Postale Standard', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(46, 'SCAT046', 2, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(47, 'SCAT047', 2, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(48, 'SCAT048', 2, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 2, 2, '2026-02-26 16:10:25', NULL),
(49, 'SCAT049', 2, 2, 'Busta Imbottita A3', 1, 'Inserita', 2, 2, '2026-02-26 16:10:25', NULL),
(50, 'SCAT050', 2, 3, 'Scatola Archivio Rigida', 3, 'Completata', 2, 2, '2026-02-26 16:10:25', NULL),
(51, 'SCAT051', 3, 6, 'Pacco Postale Standard', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(52, 'SCAT052', 3, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(53, 'SCAT053', 3, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(54, 'SCAT054', 3, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(55, 'SCAT055', 3, 2, 'Busta Imbottita A3', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(56, 'SCAT056', 3, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(57, 'SCAT057', 3, 6, 'Pacco Postale Standard', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(58, 'SCAT058', 3, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(59, 'SCAT059', 3, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', 10),
(60, 'SCAT060', 3, 1, 'Pacco Postale Standard', 3, 'Completata', 3, 3, '2026-02-26 16:10:25', 10),
(61, 'SCAT061', 3, 2, 'Busta Imbottita A3', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(62, 'SCAT062', 3, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(63, 'SCAT063', 3, 6, 'Pacco Postale Standard', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(64, 'SCAT064', 3, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', 10),
(65, 'SCAT065', 3, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(66, 'SCAT066', 3, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(67, 'SCAT067', 3, 2, 'Busta Imbottita A3', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(68, 'SCAT068', 3, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(69, 'SCAT069', 3, 6, 'Pacco Postale Standard', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(70, 'SCAT070', 3, 9, 'Busta Imbottita A3', 3, 'Completata', 3, 3, '2026-02-26 16:10:25', NULL),
(71, 'SCAT071', 3, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(72, 'SCAT072', 3, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(73, 'SCAT073', 3, 2, 'Busta Imbottita A3', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(74, 'SCAT074', 3, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 3, 3, '2026-02-26 16:10:25', NULL),
(75, 'SCAT075', 3, 6, 'Pacco Postale Standard', 1, 'Inserita', 3, 3, '2026-02-26 16:10:25', NULL),
(76, 'SCAT076', 4, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', NULL),
(77, 'SCAT077', 4, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', NULL),
(78, 'SCAT078', 4, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', NULL),
(79, 'SCAT079', 4, 2, 'Busta Imbottita A3', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', NULL),
(80, 'SCAT080', 4, 3, 'Scatola Archivio Rigida', 3, 'Completata', 4, 4, '2026-02-26 16:10:25', NULL),
(81, 'SCAT081', 4, 6, 'Pacco Postale Standard', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 9),
(82, 'SCAT082', 4, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', 8),
(83, 'SCAT083', 4, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 8),
(84, 'SCAT084', 4, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', 9),
(85, 'SCAT085', 4, 2, 'Busta Imbottita A3', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 8),
(86, 'SCAT086', 4, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', 8),
(87, 'SCAT087', 4, 6, 'Pacco Postale Standard', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 9),
(88, 'SCAT088', 4, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', NULL),
(89, 'SCAT089', 4, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', NULL),
(90, 'SCAT090', 4, 1, 'Pacco Postale Standard', 3, 'Completata', 4, 4, '2026-02-26 16:10:25', NULL),
(91, 'SCAT091', 4, 2, 'Busta Imbottita A3', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 9),
(92, 'SCAT092', 4, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', NULL),
(93, 'SCAT093', 4, 6, 'Pacco Postale Standard', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', NULL),
(94, 'SCAT094', 4, 9, 'Busta Imbottita A3', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', 8),
(95, 'SCAT095', 4, 12, 'Scatola Archivio Rigida', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 9),
(96, 'SCAT096', 4, 1, 'Pacco Postale Standard', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', 9),
(97, 'SCAT097', 4, 2, 'Busta Imbottita A3', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', NULL),
(98, 'SCAT098', 4, 3, 'Scatola Archivio Rigida', 2, 'In Lavorazione', 4, 4, '2026-02-26 16:10:25', 8),
(99, 'SCAT099', 4, 6, 'Pacco Postale Standard', 1, 'Inserita', 4, 4, '2026-02-26 16:10:25', 8),
(100, 'SCAT100', 4, 9, 'Busta Imbottita A3', 3, 'Completata', 4, 4, '2026-02-26 16:10:25', NULL),
(105, 'SCAT6654', 9, 1, 'Pacco Triplo Strato (Fragile)', 1, 'Inserita', 3, NULL, '2026-03-18 15:53:42', 5),
(106, 'SCAT6655', 9, 1, 'Busta Lettera Pro', 1, 'Inserita', 0, NULL, '2026-03-18 15:54:11', 7),
(107, 'SCAT6653', 9, 1, 'Busta Imbottita A3', 1, 'Inserita', 0, NULL, '2026-03-18 15:54:56', 7),
(108, 'SCAT4850', 9, 1, 'Contenitore Merci Pericolose', 1, 'Inserita', 0, NULL, '2026-03-18 15:56:10', 5),
(109, 'SCAT5555', 11, 1, 'Busta Lettera Pro', 1, 'Inserita', 27, NULL, '2026-03-19 10:30:00', 6),
(110, 'SCAT1234', 11, 1, 'Pacco Triplo Strato (Fragile)', 1, 'Inserita', 0, NULL, '2026-03-19 10:31:30', 6),
(111, 'SCAT3457', 9, 1, 'Pacco Extra Large (XL)', 1, 'Inserita', 26, NULL, '2026-03-25 15:01:14', NULL),
(112, 'SCAT7778', 9, 1, 'Busta Lettera Pro', 1, 'Inserita', 22, NULL, '2026-03-25 15:01:23', NULL);

--
-- Trigger `scatole`
--
DELIMITER $$
CREATE TRIGGER `dopo_eliminazione_scatola` AFTER DELETE ON `scatole` FOR EACH ROW BEGIN
	UPDATE ddt
    SET numeroColliDichiarati=(SELECT COUNT(*) FROM scatole WHERE idDdtFK=OLD.idDdtFK)
    WHERE idDdt=OLD.idDdtFK;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dopo_inserimento_scatola` AFTER INSERT ON `scatole` FOR EACH ROW BEGIN
	UPDATE ddt
    SET numeroColliDichiarati=(SELECT COUNT(*) FROM scatole WHERE idDdtFK=NEW.idDdtFK)
    WHERE idDdt=NEW.idDdtFK;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `servizi`
--

CREATE TABLE `servizi` (
  `id` int(11) NOT NULL,
  `nomeServizio` varchar(255) NOT NULL,
  `macroservizioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `servizi`
--

INSERT INTO `servizi` (`id`, `nomeServizio`, `macroservizioId`) VALUES
(1, 'Scansione Documenti Contabili', 2),
(2, 'Indicizzazione Pratiche Fidi', 2),
(3, 'Conservazione a Norma (PEC/Fatture)', 2),
(4, 'Raccomandata A/R Business', 3),
(5, 'Corriere Espresso Nazionale', 3),
(6, 'Smistamento Corrispondenza Interna', 3),
(7, 'Stampa e Imbustamento (Massiva)', 3),
(8, 'Ritiro e Catalogazione Scatole', 4),
(9, 'Consultazione Archivio (Fast Delivery)', 4),
(10, 'Mero Macero Certificato', 4),
(11, 'Rilascio Firma Digitale / Smart Card', 5),
(12, 'Attivazione e Gestione PEC', 5),
(13, 'Notifiche Digitali (Piattaforma SEND)', 5),
(14, 'Conservazione Sostitutiva Libri Unici', 5),
(15, 'Normalizzazione Indirizzi (Geocodifica)', 6),
(16, 'Data Entry Anagrafiche Clienti', 6),
(17, 'Gestione Resi e Aggiornamento Database', 6),
(18, 'Internazionalizzazione Documentale (Dogana)', 3),
(19, 'Fornitura Materiale da Imballaggio', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `spedizioni`
--

CREATE TABLE `spedizioni` (
  `idSpedizione` int(11) NOT NULL,
  `codiceSpedizione` varchar(50) NOT NULL,
  `idOperatoreFK` int(11) NOT NULL,
  `idClienteFK` int(11) NOT NULL,
  `vettore` varchar(100) DEFAULT NULL,
  `dataPartenza` datetime DEFAULT NULL,
  `statoSpedizione` enum('In Preparazione','Pronto per Reggiatura','Pallettizzato','In Attesa DDT','Spedito','Consegnato','Annullato') NOT NULL DEFAULT 'In Preparazione',
  `targa` varchar(20) DEFAULT NULL,
  `destinazione` varchar(255) DEFAULT NULL,
  `dataArrivo` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `spedizioni`
--

INSERT INTO `spedizioni` (`idSpedizione`, `codiceSpedizione`, `idOperatoreFK`, `idClienteFK`, `vettore`, `dataPartenza`, `statoSpedizione`, `targa`, `destinazione`, `dataArrivo`) VALUES
(1, 'SPED-2026-001', 12, 1, 'Bartolini', '2026-02-20 10:00:00', 'In Preparazione', NULL, NULL, NULL),
(2, 'SPED-2026-002', 3, 2, 'SDA', '2026-02-21 09:30:00', 'In Preparazione', NULL, NULL, NULL),
(3, 'SPED-2026-003', 1, 3, 'DHL', '2026-02-22 14:00:00', 'In Preparazione', NULL, NULL, NULL),
(4, 'SPED-2026-004', 2, 4, 'Poste Italiane', '2026-02-23 08:00:00', 'In Preparazione', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `idOperatore` int(11) NOT NULL,
  `codiceOperatore` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telFisso` varchar(20) DEFAULT NULL,
  `telMobile` varchar(20) NOT NULL,
  `centroDematId` int(20) NOT NULL,
  `profiloId` int(20) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `tentativiFalliti` int(11) NOT NULL DEFAULT '0',
  `dataInserimento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`idOperatore`, `codiceOperatore`, `username`, `password`, `descrizione`, `email`, `telFisso`, `telMobile`, `centroDematId`, `profiloId`, `enabled`, `tentativiFalliti`, `dataInserimento`) VALUES
(1, 'ADM-001', 'alessia', '$2a$10$KC9CmfwU4kxViNnJiQ9Gbun3FWQh3h2Tw.iVT4s9j0tVdfMzbDuUW', 'Alessia Di Maio', 'alessia.dimaio@poste.it', '0823445567', '3330000009', 3, 1, 1, 0, '2026-02-10 18:22:23'),
(2, 'ACC-002', 'marco', '$2a$10$wMXoMwluJ56xcWqnJPy2GOjTe3BSSbpMBsrmFMWdQrqE5TMBZeYqi', 'Marco Ferrari', 'marco.ferrari@poste.it', '06555002', '3330000002', 4, 2, 1, 0, '2026-02-10 18:22:23'),
(3, 'LOG-003', 'sergio', '$2a$10$lmSy8BgcomrTeSX3QQ7xcefZow0V5HUs8aIA6xJ3C04A9Ce4Bq3sG', 'Sergio Esposito', 'sergio.esposito@poste.it', '06555003', '3330000003', 13, 3, 1, 0, '2026-02-10 18:22:23'),
(4, 'ANO-004', 'giulia', 'pwd_hash_04', 'Giulia Romano', 'giulia.romano@poste.it', '06555004', '3330000004', 1, 4, 1, 0, '2026-02-10 18:22:23'),
(5, 'MAT-005', 'claudio', 'pwd_hash_05', 'Claudio Gentile', 'claudio.gentile@poste.it', '06555005', '3330000005', 1, 5, 1, 0, '2026-02-10 18:22:23'),
(6, 'ACC-006', 'elisa', 'pwd_hash_06\r\n', 'Elisa Moretti', 'elisa.moretti@poste.it', '06555006', '3330000006', 4, 2, 1, 0, '2026-02-10 18:22:23'),
(7, 'LOG-007', 'roberto', 'pwd_hash_07', 'Roberto Marino', 'roberto.marino@poste.it', '06555007', '3330000007', 4, 3, 1, 0, '2026-02-10 18:22:23'),
(8, 'ANO-008', 'stefano', 'pwd_hash_08', 'Stefano Greco', 'stefano.greco@poste.it', '06555008', '3330000008', 3, 4, 1, 0, '2026-02-10 18:22:23'),
(9, 'MAT-009', 'paola', 'pwd_hash_09', 'Paola Lombardi', 'paola.lombardi@poste.it', '06555009', '3330000009', 1, 5, 1, 0, '2026-02-10 18:22:23'),
(10, 'ACC-010', 'michele', 'pwd_hash_10', 'Michele Barbieri', 'michele.barbieri@poste.it', '06555010', '3330000010', 18, 2, 1, 0, '2026-02-10 18:22:23'),
(11, 'LOG-011', 'valentina', 'pwd_hash_11', 'Valentina Fontana', 'valentina.fontana@poste.it', '06555011', '3330000011', 4, 3, 1, 0, '2026-02-10 18:22:23'),
(12, 'ANO-012', 'fabio', 'pwd_hash_12', 'Fabio Rizzo', 'fabio.rizzo@poste.it', '06555012', '3330000012', 5, 4, 1, 0, '2026-02-10 18:22:23'),
(13, 'MAT-013', 'elena', 'pwd_hash_13', 'Elena Conti', 'elena.conti@poste.it', '06555013', '3330000013', 11, 5, 1, 0, '2026-02-10 18:22:23'),
(14, 'MAT-014', 'alessandro', 'pwd_hash_14', 'Alessandro Gallo', 'alessandro.gallo@poste.it', '06555014', '3330000014', 2, 5, 1, 0, '2026-02-10 18:22:23'),
(15, 'LOG-015', 'simona', 'pwd_hash_15', 'Simona De Luca', 'simona.deluca@poste.it', '06555015', '3330000015', 19, 3, 1, 0, '2026-02-10 18:22:23');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `uk_codiceCliente` (`codiceCliente`),
  ADD UNIQUE KEY `partitaIva` (`partitaIva`);

--
-- Indici per le tabelle `clienti_privati`
--
ALTER TABLE `clienti_privati`
  ADD PRIMARY KEY (`idPrivato`),
  ADD UNIQUE KEY `codiceFiscale` (`codiceFiscale`),
  ADD KEY `fk_privato_scatola` (`idScatolaFK`);

--
-- Indici per le tabelle `ddt`
--
ALTER TABLE `ddt`
  ADD PRIMARY KEY (`idDdt`),
  ADD UNIQUE KEY `uk_codiceDdt` (`codiceDdt`),
  ADD KEY `fk_ddt_spedizione` (`idSpedizioneFK`),
  ADD KEY `idx_stato_ddt` (`statoDdt`),
  ADD KEY `idx_data_arrivo` (`dataArrivo`),
  ADD KEY `idx_cliente_stato` (`idClienteFK`,`statoDdt`),
  ADD KEY `fk_ddt_op` (`idOperatoreFK`);

--
-- Indici per le tabelle `documenti`
--
ALTER TABLE `documenti`
  ADD PRIMARY KEY (`idDocumento`),
  ADD UNIQUE KEY `uk_barcode_doc` (`barcodeDocumento`),
  ADD KEY `fk_doc_maz` (`idMazzettaFK`),
  ADD KEY `fk_doc_op` (`idOperatoreFK`);

--
-- Indici per le tabelle `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `macroservizi`
--
ALTER TABLE `macroservizi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `mazzette`
--
ALTER TABLE `mazzette`
  ADD PRIMARY KEY (`idMazzetta`),
  ADD KEY `fk_maz_scat` (`idScatolaFK`),
  ADD KEY `uk_codice_mazzetta` (`codiceMazzetta`) USING BTREE;

--
-- Indici per le tabelle `pallet`
--
ALTER TABLE `pallet`
  ADD PRIMARY KEY (`idPallet`),
  ADD UNIQUE KEY `codicePallet` (`codicePallet`),
  ADD UNIQUE KEY `codicePallet_2` (`codicePallet`),
  ADD KEY `fk_operatore_pallet` (`idOperatoreFK`),
  ADD KEY `fk_pallet_spedizione` (`idSpedizioneFK`),
  ADD KEY `fk_pallet_ddt` (`idDdtFK`);

--
-- Indici per le tabelle `scatole`
--
ALTER TABLE `scatole`
  ADD PRIMARY KEY (`idScatola`),
  ADD UNIQUE KEY `uk_codice_scatola` (`codiceScatola`),
  ADD KEY `fk_scat_op` (`idOperatoreFK`),
  ADD KEY `idDdtFK` (`idDdtFK`),
  ADD KEY `idClienteFK` (`idClienteFK`),
  ADD KEY `fk_scatole_pallet` (`idPalletFK`);

--
-- Indici per le tabelle `servizi`
--
ALTER TABLE `servizi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servizi_macro` (`macroservizioId`);

--
-- Indici per le tabelle `spedizioni`
--
ALTER TABLE `spedizioni`
  ADD PRIMARY KEY (`idSpedizione`),
  ADD UNIQUE KEY `uk_codiceSpedizione` (`codiceSpedizione`),
  ADD KEY `fk_sped_cliente` (`idClienteFK`),
  ADD KEY `fk_sped_op` (`idOperatoreFK`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idOperatore`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `codiceOperatore` (`codiceOperatore`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT per la tabella `clienti_privati`
--
ALTER TABLE `clienti_privati`
  MODIFY `idPrivato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `ddt`
--
ALTER TABLE `ddt`
  MODIFY `idDdt` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `documenti`
--
ALTER TABLE `documenti`
  MODIFY `idDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1236;

--
-- AUTO_INCREMENT per la tabella `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `macroservizi`
--
ALTER TABLE `macroservizi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `mazzette`
--
ALTER TABLE `mazzette`
  MODIFY `idMazzetta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT per la tabella `pallet`
--
ALTER TABLE `pallet`
  MODIFY `idPallet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `scatole`
--
ALTER TABLE `scatole`
  MODIFY `idScatola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT per la tabella `servizi`
--
ALTER TABLE `servizi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `spedizioni`
--
ALTER TABLE `spedizioni`
  MODIFY `idSpedizione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `clienti_privati`
--
ALTER TABLE `clienti_privati`
  ADD CONSTRAINT `fk_privato_scatola` FOREIGN KEY (`idScatolaFK`) REFERENCES `scatole` (`idScatola`);

--
-- Limiti per la tabella `ddt`
--
ALTER TABLE `ddt`
  ADD CONSTRAINT `fk_ddt_cliente` FOREIGN KEY (`idClienteFK`) REFERENCES `clienti` (`idCliente`),
  ADD CONSTRAINT `fk_ddt_op` FOREIGN KEY (`idOperatoreFK`) REFERENCES `users` (`idOperatore`),
  ADD CONSTRAINT `fk_ddt_spedizione` FOREIGN KEY (`idSpedizioneFK`) REFERENCES `spedizioni` (`idSpedizione`);

--
-- Limiti per la tabella `documenti`
--
ALTER TABLE `documenti`
  ADD CONSTRAINT `fk_doc_maz` FOREIGN KEY (`idMazzettaFK`) REFERENCES `mazzette` (`idMazzetta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_doc_op` FOREIGN KEY (`idOperatoreFK`) REFERENCES `users` (`idOperatore`);

--
-- Limiti per la tabella `mazzette`
--
ALTER TABLE `mazzette`
  ADD CONSTRAINT `fk_maz_scat` FOREIGN KEY (`idScatolaFK`) REFERENCES `scatole` (`idScatola`) ON DELETE CASCADE;

--
-- Limiti per la tabella `pallet`
--
ALTER TABLE `pallet`
  ADD CONSTRAINT `fk_operatore_pallet` FOREIGN KEY (`idOperatoreFK`) REFERENCES `users` (`idOperatore`),
  ADD CONSTRAINT `fk_pallet_ddt` FOREIGN KEY (`idDdtFK`) REFERENCES `ddt` (`idDdt`),
  ADD CONSTRAINT `fk_pallet_spedizione` FOREIGN KEY (`idSpedizioneFK`) REFERENCES `spedizioni` (`idSpedizione`);

--
-- Limiti per la tabella `scatole`
--
ALTER TABLE `scatole`
  ADD CONSTRAINT `fk_scat_op` FOREIGN KEY (`idOperatoreFK`) REFERENCES `users` (`idOperatore`),
  ADD CONSTRAINT `fk_scatole_ddt` FOREIGN KEY (`idDdtFK`) REFERENCES `ddt` (`idDdt`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_scatole_pallet` FOREIGN KEY (`idPalletFK`) REFERENCES `pallet` (`idPallet`) ON DELETE SET NULL,
  ADD CONSTRAINT `scatole_ibfk_1` FOREIGN KEY (`idClienteFK`) REFERENCES `clienti` (`idCliente`);

--
-- Limiti per la tabella `servizi`
--
ALTER TABLE `servizi`
  ADD CONSTRAINT `fk_servizi_macro` FOREIGN KEY (`macroservizioId`) REFERENCES `macroservizi` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `spedizioni`
--
ALTER TABLE `spedizioni`
  ADD CONSTRAINT `fk_sped_cliente` FOREIGN KEY (`idClienteFK`) REFERENCES `clienti` (`idCliente`),
  ADD CONSTRAINT `fk_sped_op` FOREIGN KEY (`idOperatoreFK`) REFERENCES `users` (`idOperatore`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
