-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 18. úno 2019, 21:58
-- Verze serveru: 10.1.30-MariaDB
-- Verze PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `veletrhpovolani`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `article`
--

CREATE TABLE `article` (
  `idarticle` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `subtitle` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `lead` text COLLATE utf8_czech_ci,
  `content` text COLLATE utf8_czech_ci NOT NULL,
  `edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published` datetime DEFAULT NULL,
  `author_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `article`
--

INSERT INTO `article` (`idarticle`, `title`, `subtitle`, `lead`, `content`, `edited`, `published`, `author_id`) VALUES
(1, 'První ukázkový článek', 'Podtitulek prvního článku', 'Povolání je pravidelně vykonávaná pracovní činnost. Příjem (výdělek) za výkon povolání zpravidla slouží k úhradě (podstatné části) nákladů na živobytí. Povolání často není chápáno jako prosté vykonávání práce, očekává se, že bude jedinci přinášet radost, v tomto smyslu se někdo může minout s povoláním.[1] Povolání je pro jedince ve společnosti důležitý ukazatel sociálního a ekonomického statusu (prestiž povolání), proto se přikládá důležitost výběru povolání.', 'Podle společnosti Gartnet do roku 2025 nahradí až třetinu pracovní síly roboti a automatizační software, v této souvislosti ale vyvstává otázka, zda se pro onu třetinu lidí najde jiné povolání. Podle futurologa Thomase Freye by do roku 2030 mělo zaniknout až polovina pracovních míst, měla by zaniknout pracovní místa v uhelných elektrárnách, ve společnostech starající se o přenosové soustavy, v automobilkách a v jejich dodavatelských firmách, v klasickém školství, ve výrobě, v zemědělství a v armádě, přičemž zaniklých pracovních míst by měla vzniknout nová povolání pro nově vzniklé potřeby.', '2019-02-17 16:02:59', '2019-02-05 10:00:00', 1),
(2, 'Pracovní trh budoucnosti', 'Uplatní se mechanici algoritmů i designéři smíšené reality', 'Digitalizace, automatizace, robotizace. Procesy, o kterých denně slýcháme, významně ovlivňují současný trh práce a ještě výrazněji promluví do jeho budoucí podoby. Lidé se ale o pracovní uplatnění bát nemusí, podle nadnárodní bankovní instituce HSBC se totiž budou moci ucházet o řadu zcela nových pracovních pozic, uvádí studie Advantage: The Power of People.', 'Většina českých bank a pojišťoven v posledních dvou letech testuje a zavádí prvky umělé inteligenci a hlásí nárůst produktivity. Rychlý technologický pokrok vyvolává množství obav, ale zároveň otevírá dveře nepoznaných možností, upozorňuje HSBC a připomíná, že automatizací je ohroženo až 47 procent pracovních pozic.', '2019-02-17 16:11:31', '2019-02-03 15:24:00', 1),
(3, 'Český pracovní trh je vyčerpán, potřebuje vzdělané migranty', 'Výsledky studie', 'Českým firmám docházejí zaměstnanci, nemají je kde brát, nezaměstnanost je minimální. Proto jsou otevřenější cizincům, stejně jako ostatní státy. Vyplývá to ze studie Global Skills Index personálně poradenské společnosti Hays, která srovnává vývoj pracovních trhů ve 33 zemích světa.', 'Po světě je v pohybu více migrantů než kdy dříve, současně stoupá úroveň jejich vzdělání. Jen v Evropské unii žije 29 % vysokoškolsky vzdělaných lidí v jiné zemi, než ve které se narodili. Příchod migrantů v mnoha zemích působí jako protiváha stárnoucí domácí populace. Přesto nedostatek vhodných pracovních sil trvá, jak tvrdí studie společnosti Hays, a mnoho firem tak má nadále potíže s nacházením potřebných odborníků pro specializovaná pracovní zařazení a sektory.', '2019-02-18 20:53:42', '2019-02-12 13:00:00', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `article_has_category`
--

CREATE TABLE `article_has_category` (
  `article_idarticle` int(10) UNSIGNED NOT NULL,
  `category_idcategory` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `article_has_category`
--

INSERT INTO `article_has_category` (`article_idarticle`, `category_idcategory`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `branch`
--

CREATE TABLE `branch` (
  `idbranch` int(10) UNSIGNED NOT NULL,
  `branch_name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `description` text COLLATE utf8_czech_ci,
  `icon` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `branch`
--

INSERT INTO `branch` (`idbranch`, `branch_name`, `description`, `icon`) VALUES
(16, 'Ekologie a ochrana životního prostředí', '', ''),
(18, 'Informatické obory', '', ''),
(21, 'Hornictví a hornická geologie, hutnictví a slévárenství', '', ''),
(23, 'Strojírenství a strojírenská výroba', '', ''),
(26, 'Elektrotechnika, telekomunikační a výpočetní technika', '', ''),
(28, 'Technická chemie a chemie silikátů', '', ''),
(29, 'Potravinářství a potravinářská chemie', '', ''),
(31, 'Textilní výroba a oděvnictví', '', ''),
(32, 'Kožedělná a obuvnická výroba a zpracování plastů', '', ''),
(33, 'Zpracování dřeva a výroba hudebních nástrojů', '', ''),
(34, 'Polygrafie, zpracování papíru, filmu a fotografie', '', ''),
(36, 'Stavebnictví, geodézie a kartografie', '', ''),
(37, 'Doprava a spoje', '', ''),
(39, 'Speciální a interdisciplinární obory', '', ''),
(41, 'Zemědělství a lesnictví', '', ''),
(43, 'Veterinářství a veterinární prevence', '', ''),
(53, 'Zdravotnictví', '', ''),
(61, 'Filozofie, teologie', '', ''),
(63, 'Ekonomika a administrativa', '', ''),
(64, 'Podnikání v oborech, odvětví', '', ''),
(65, 'Gastronomie, hotelnictví a turismus', '', ''),
(66, 'Obchod', '', ''),
(68, 'Právo, právní a veřejnosprávní činnost', '', ''),
(69, 'Osobní a provozní služby', '', ''),
(72, 'Publicistika, knihovnictví a informatika', '', ''),
(74, 'Tělesná kultura, tělovýchova a sport', '', ''),
(75, 'Pedagogika, učitelství a sociální péče', '', ''),
(78, 'Obecně odborná příprava', '', ''),
(79, 'Obecná příprava', '', ''),
(82, 'Umění a užité umění', '', ''),
(91, 'Teorie vojenského umění', '', '');

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE `category` (
  `idcategory` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(45) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`idcategory`, `category_name`) VALUES
(4, 'akce'),
(1, 'aktuálně'),
(3, 'poradna'),
(2, 'pracovní příležitosti');

-- --------------------------------------------------------

--
-- Struktura tabulky `course`
--

CREATE TABLE `course` (
  `idcourse` int(11) NOT NULL COMMENT 'Courses of study',
  `code` varchar(15) COLLATE utf8_czech_ci NOT NULL,
  `course_name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `description` text COLLATE utf8_czech_ci,
  `use` text COLLATE utf8_czech_ci,
  `branch_idbranch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `course`
--

INSERT INTO `course` (`idcourse`, `code`, `course_name`, `description`, `use`, `branch_idbranch`) VALUES
(359, '41-41-M/01', 'Agropodnikání', NULL, NULL, 41),
(360, '29-42-M/01', 'Analýza potravin', NULL, NULL, 29),
(361, '28-44-M/01', 'Aplikovaná chemie', NULL, NULL, 28),
(362, '66-52-H/01', 'Aranžér', NULL, NULL, 66),
(363, '53-44-M/03', 'Asistent zubního technika', NULL, NULL, 53),
(364, '26-57-H/01', 'Autoelektrikář', NULL, NULL, 26),
(365, '23-61-H/01', 'Autolakýrník', NULL, NULL, 23),
(366, '39-41-L/01', 'Autotronik', NULL, NULL, 39),
(367, '68-42-M/01', 'Bezpečnostně právní činnost', NULL, NULL, 68),
(368, '28-63-E/01', 'Bižuterní výroba', NULL, NULL, 28),
(369, '65-42-M/02', 'Cestovní ruch', NULL, NULL, 65),
(370, '29-54-H/01', 'Cukrář', NULL, NULL, 29),
(371, '33-59-H/01', 'Čalouník', NULL, NULL, 33),
(372, '82-41-M/11', 'Design interiéru', NULL, NULL, 82),
(373, '36-51-E/01', 'Dlaždičské práce', NULL, NULL, 36),
(374, '23-45-M/01', 'Dopravní prostředky', NULL, NULL, 23),
(375, '33-57-E/01', 'Dřevařská výroba', NULL, NULL, 33),
(376, '79-43-K/61', 'Dvojjazyčné gymnázium', NULL, NULL, 79),
(377, '16-01-M/01', 'Ekologie a životní prostředí', NULL, NULL, 16),
(378, '78-42-M/02', 'Ekonomické lyceum', NULL, NULL, 78),
(379, '63-41-M/01', 'Ekonomika a podnikání', NULL, NULL, 63),
(380, '26-51-H/01', 'Elektrikář', NULL, NULL, 26),
(381, '26-51-H/02', 'Elektrikář - silnoproud', NULL, NULL, 26),
(382, '26-52-H/01', 'Elektromechanik pro zařízení a přístroje', NULL, NULL, 26),
(383, '26-51-E/01', 'Elektrotechnické a strojně montážní práce', NULL, NULL, 26),
(384, '26-41-M/01', 'Elektrotechnika', NULL, NULL, 26),
(385, '34-56-L/01', 'Fotograf', NULL, NULL, 34),
(386, '65-41-L/01', 'Gastronomie', NULL, NULL, 65),
(387, '36-46-M/01', 'Geodézie a katastr nemovitostí', NULL, NULL, 36),
(388, '21-42-M/01', 'Geotechnika', NULL, NULL, 21),
(389, '82-41-M/05', 'Grafický design', NULL, NULL, 82),
(390, '79-41-K/81', 'Gymnázium  (osmileté)', NULL, NULL, 79),
(391, '79-41-K/41', 'Gymnázium (čtyřleté)', NULL, NULL, 79),
(392, '79-41-K/61', 'Gymnázium (šestileté)', NULL, NULL, 79),
(393, '79-42-K/61', 'Gymnázium se sportovní přípravou (šestileté)', NULL, NULL, 79),
(394, '79-42-K/41', 'Gymnázium se sportovní přípravou (čtyřleté)', NULL, NULL, 79),
(395, '79-42-K/81', 'Gymnázium se sportovní přípravou (osmileté)', NULL, NULL, 79),
(396, '65-42-M/01', 'Hotelnictví', NULL, NULL, 65),
(397, '82-44-P/01', 'Hudba', NULL, NULL, 82),
(398, '82-47-P/01', 'Hudebně dramatické umění', NULL, NULL, 82),
(399, '21-52-H/01', 'Hutník', NULL, NULL, 21),
(400, '21-43-L/01', 'Hutník operátor', NULL, NULL, 21),
(401, '28-52-H/01', 'Chemik', NULL, NULL, 28),
(402, '28-42-L/01', 'Chemik operátor', NULL, NULL, 28),
(403, '41-43-L/01', 'Chovatel cizokrajných zvířat', NULL, NULL, 41),
(404, '41-43-M/02', 'Chovatelství', NULL, NULL, 41),
(405, '72-41-M/01', 'Informační služby', NULL, NULL, 72),
(406, '18-20-M/01', 'Informační technologie', NULL, NULL, 18),
(407, '36-52-H/01', 'Instalatér', NULL, NULL, 36),
(408, '23-62-H/01', 'Jemný mechanik', NULL, NULL, 23),
(409, '41-53-H/02', 'Jezdec a chovatel koní', NULL, NULL, 41),
(410, '69-51-H/01', 'Kadeřník', NULL, NULL, 69),
(411, '36-54-H/01', 'Kameník', NULL, NULL, 36),
(412, '82-41-M/16', 'Kamenosochařství', NULL, NULL, 82),
(413, '36-67-H/02', 'Kamnář', NULL, NULL, 36),
(414, '23-55-H/02', 'Karosář', NULL, NULL, 23),
(415, '28-57-E/01', 'Keramická výroba', NULL, NULL, 28),
(416, '23-55-H/01', 'Klempíř', NULL, NULL, 23),
(417, '36-55-E/01', 'Klempířské práce ve stavebnictví', NULL, NULL, 36),
(418, '34-57-H/01', 'Knihař', NULL, NULL, 34),
(419, '34-57-E/01', 'Knihařské práce', NULL, NULL, 34),
(420, '66-43-M/01', 'Knihkupecké a nakladatelské činnosti', NULL, NULL, 66),
(421, '78-42-M/06', 'Kombinované lyceum', NULL, NULL, 78),
(422, '36-56-H/01', 'Kominík', NULL, NULL, 36),
(423, '82-42-M/01', 'Konzervátorství a restaurátorství', NULL, NULL, 82),
(424, '69-41-L/01', 'Kosmetické služby', NULL, NULL, 69),
(425, '23-57-H/01', 'Kovář', NULL, NULL, 23),
(426, '32-41-E/01', 'Kožedělná výroba', NULL, NULL, 32),
(427, '31-58-H/01', 'Krejčí', NULL, NULL, 31),
(428, '65-51-H/01', 'Kuchař - číšník', NULL, NULL, 65),
(429, '53-43-M/01', 'Laboratorní asistent', NULL, NULL, 53),
(430, '82-44-J/01', 'Ladění klavírů a kulturní činnost', NULL, NULL, 82),
(431, '82-44-M/02', 'Ladění klavírů a příbuzných nástrojů', NULL, NULL, 82),
(432, '41-56-H/01', 'Lesní mechanizátor', NULL, NULL, 41),
(433, '41-56-E/01', 'Lesnické práce', NULL, NULL, 41),
(434, '41-46-M/01', 'Lesnictví', NULL, NULL, 41),
(435, '23-45-L/02', 'Letecký mechanik', NULL, NULL, 23),
(436, '23-65-H/02', 'Lodník', NULL, NULL, 23),
(437, '37-42-M/01', 'Logistické a finanční služby', NULL, NULL, 37),
(438, '39-41-H/01', 'Malíř a lakýrník', NULL, NULL, 39),
(439, '36-57-E/01', 'Malířské a natěračské práce', NULL, NULL, 36),
(440, '37-51-H/01', 'Manipulant poštovního provozu a přepravy', NULL, NULL, 37),
(441, '69-41-L/02', 'Masér sportovní a rekondiční', NULL, NULL, 69),
(442, '26-41-L/01', 'Mechanik elektrotechnik', NULL, NULL, 26),
(443, '39-41-L/02', 'Mechanik instalatérských a elektrotechnických zařízení', NULL, NULL, 39),
(444, '23-68-H/01', 'Mechanik opravář motorových vozidel', NULL, NULL, 23),
(445, '36-52-H/02', 'Mechanik plynových zařízení', NULL, NULL, 36),
(446, '23-45-L/01', 'Mechanik seřizovač', NULL, NULL, 23),
(447, '23-44-L/01', 'Mechanik strojů a zařízení', NULL, NULL, 23),
(448, '41-45-M/01', 'Mechanizace a služby', NULL, NULL, 41),
(449, '21-53-H/01', 'Modelář', NULL, NULL, 21),
(450, '82-41-M/09', 'Modelářství a návrhářství obuvi a módních doplňků', NULL, NULL, 82),
(451, '82-41-M/07', 'Modelářství a návrhářství oděvů', NULL, NULL, 82),
(452, '36-66-H/01', 'Montér suchých staveb', NULL, NULL, 36),
(453, '36-58-H/01', 'Montér vodovodů a kanalizací a obsluha vodárenských zařízení', NULL, NULL, 36),
(454, '82-41-M/17', 'Multimediální tvorba', NULL, NULL, 82),
(455, '33-42-M/01', 'Nábytkářská a dřevařská výroba', NULL, NULL, 33),
(456, '23-52-H/01', 'Nástrojař', NULL, NULL, 23),
(457, '53-41-M/02', 'Nutriční asistent', NULL, NULL, 53),
(458, '34-42-M/01', 'Obalová technika', NULL, NULL, 34),
(459, '63-41-M/02', 'Obchodní akademie', NULL, NULL, 63),
(460, '63-51-J/01', 'Obchodní škola', NULL, NULL, 63),
(461, '66-41-L/01', 'Obchodník', NULL, NULL, 66),
(462, '23-56-H/01', 'Obráběč kovů', NULL, NULL, 23),
(463, '69-42-M/01', 'Oční optik', NULL, NULL, 69),
(464, '31-43-L/01', 'Oděvní technik', NULL, NULL, 31),
(465, '31-43-M/01', 'Oděvnictví', NULL, NULL, 31),
(466, '33-41-L/01', 'Operátor dřevařské a nábytkářské výroby', NULL, NULL, 33),
(467, '66-53-H/01', 'Operátor skladování', NULL, NULL, 66),
(468, '41-56-H/02', 'Opravář lesnických strojů', NULL, NULL, 41),
(469, '41-55-H/01', 'Opravář zemědělských strojů', NULL, NULL, 41),
(470, '41-55-E/01', 'Opravářské práce', NULL, NULL, 41),
(471, '23-62-L/01', 'Optik', NULL, NULL, 23),
(472, '53-44-M/01', 'Ortoticko - protetický technik', NULL, NULL, 53),
(473, '53-41-H/01', 'Ošetřovatel', NULL, NULL, 53),
(474, '75-41-E/01', 'Pečovatelské služby', NULL, NULL, 75),
(475, '75-41-J/01', 'Pečovatelské služby', NULL, NULL, 75),
(476, '78-42-M/03', 'Pedagogické lyceum', NULL, NULL, 78),
(477, '75-31-J/01', 'Pedagogika pro asistenty ve školství', NULL, NULL, 75),
(478, '75-31-M/02', 'Pedagogika pro asistenty ve školství', NULL, NULL, 75),
(479, '29-53-H/01', 'Pekař', NULL, NULL, 29),
(480, '41-54-H/01', 'Podkovář a zemědělský kovář', NULL, NULL, 41),
(481, '36-59-H/01', 'Podlahář', NULL, NULL, 36),
(482, '36-59-E/01', 'Podlahářské práce', NULL, NULL, 36),
(483, '36-69-H/01', 'Pokrývač', NULL, NULL, 36),
(484, '36-69-E/01', 'Pokrývačské práce', NULL, NULL, 36),
(485, '34-41-M/01', 'Polygrafie', NULL, NULL, 34),
(486, '29-51-E/01', 'Potravinářská výroba', NULL, NULL, 29),
(487, '29-51-E/02', 'Potravinářské práce', NULL, NULL, 29),
(488, '39-08-M/01', 'Požární ochrana', NULL, NULL, 39),
(489, '65-51-E/02', 'Práce ve stravování', NULL, NULL, 65),
(490, '53-41-M/03', 'Praktická sestra', NULL, NULL, 53),
(491, '78-62-C/02', 'Praktická škola dvouletá', NULL, NULL, 78),
(492, '78-62-C/01', 'Praktická škola jednoletá', NULL, NULL, 78),
(493, '66-51-H/01', 'Prodavač', NULL, NULL, 66),
(494, '66-51-E/01', 'Prodavačské práce', NULL, NULL, 66),
(495, '37-41-M/01', 'Provoz a ekonomika dopravy', NULL, NULL, 37),
(496, '69-54-E/01', 'Provozní služby', NULL, NULL, 69),
(497, '16-02-M/01', 'Průmyslová ekologie', NULL, NULL, 16),
(498, '82-41-M/04', 'Průmyslový design', NULL, NULL, 82),
(499, '75-31-M/01', 'Předškolní a mimoškolní pedagogika', NULL, NULL, 75),
(500, '78-42-M/05', 'Přírodovědné lyceum', NULL, NULL, 78),
(501, '23-69-H/01', 'Puškař', NULL, NULL, 23),
(502, '69-53-H/01', 'Rekondiční a sportovní masér', NULL, NULL, 69),
(503, '34-53-H/01', 'Reprodukční grafik', NULL, NULL, 34),
(504, '34-53-L/01', 'Reprodukční grafik pro média', NULL, NULL, 34),
(505, '41-04-M/01', 'Rostlinolékařství', NULL, NULL, 41),
(506, '41-53-H/01', 'Rybář', NULL, NULL, 41),
(507, '41-43-M/01', 'Rybářství', NULL, NULL, 41),
(508, '82-41-M/10', 'Řezbářství', NULL, NULL, 82),
(509, '29-56-H/01', 'Řezník - uzenář', NULL, NULL, 29),
(510, '82-41-M/03', 'Scénická a výstavní tvorba', NULL, NULL, 82),
(511, '28-58-H/01', 'Sklář - výrobce a zušlechťovatel skla', NULL, NULL, 28),
(512, '36-62-H/01', 'Sklenář', NULL, NULL, 36),
(513, '36-62-E/01', 'Sklenářské práce', NULL, NULL, 36),
(514, '21-55-H/01', 'Slévač', NULL, NULL, 21),
(515, '75-41-M/01', 'Sociální činnost', NULL, NULL, 75),
(516, '82-46-P/02', 'Současný tanec', NULL, NULL, 82),
(517, '26-59-H/01', 'Spojový mechanik', NULL, NULL, 26),
(518, '82-48-L/01', 'Starožitník', NULL, NULL, 82),
(519, '36-43-M/01', 'Stavební materiály', NULL, NULL, 36),
(520, '36-67-E/02', 'Stavební práce', NULL, NULL, 36),
(521, '36-47-M/01', 'Stavebnictví', NULL, NULL, 36),
(522, '65-51-E/01', 'Stravovací a ubytovací služby', NULL, NULL, 65),
(523, '21-44-M/01', 'Strojírenská metalurgie', NULL, NULL, 21),
(524, '23-51-E/01', 'Strojírenské práce', NULL, NULL, 23),
(525, '23-41-M/01', 'Strojírenství', NULL, NULL, 23),
(526, '23-51-H/01', 'Strojní mechanik', NULL, NULL, 23),
(527, '23-65-H/01', 'Strojník', NULL, NULL, 23),
(528, '23-65-H/03', 'Strojník silničních strojů', NULL, NULL, 23),
(529, '31-59-E/01', 'Šití oděvů', NULL, NULL, 31),
(530, '31-59-E/02', 'Šití prádla', NULL, NULL, 31),
(531, '82-46-P/01', 'Tanec', NULL, NULL, 82),
(532, '36-45-M/01', 'Technická zařízení budov', NULL, NULL, 36),
(533, '78-42-M/01', 'Technické lyceum', NULL, NULL, 78),
(534, '23-69-L/01', 'Technik - puškař', NULL, NULL, 23),
(535, '34-57-L/01', 'Technik dokončovacího zpracování tiskovin', NULL, NULL, 34),
(536, '21-44-L/01', 'Technik modelových zařízení', NULL, NULL, 21),
(537, '29-41-M/01', 'Technologie potravin', NULL, NULL, 29),
(538, '28-46-M/01', 'Technologie silikátů', NULL, NULL, 28),
(539, '26-45-M/01', 'Telekomunikace', NULL, NULL, 26),
(540, '36-64-H/01', 'Tesař', NULL, NULL, 36),
(541, '36-64-E/01', 'Tesařské práce', NULL, NULL, 36),
(542, '31-57-E/01', 'Textilní a oděvní výroba', NULL, NULL, 31),
(543, '82-41-M/14', 'Textilní výtvarnictví', NULL, NULL, 82),
(544, '31-41-M/01', 'Textilnictví', NULL, NULL, 31),
(545, '34-52-H/01', 'Tiskař na polygrafických strojích', NULL, NULL, 34),
(546, '34-52-L/01', 'Tiskař na polygrafických strojích', NULL, NULL, 34),
(547, '33-56-H/01', 'Truhlář', NULL, NULL, 33),
(548, '33-56-E/01', 'Truhlářská a čalounická výroba', NULL, NULL, 33),
(549, '82-41-M/15', 'Tvorba a vzorování bižuterie', NULL, NULL, 82),
(550, '82-41-M/08', 'Tvorba hraček a herních předmětů', NULL, NULL, 82),
(551, '82-51-L/06', 'Uměleckořemeslná stavba hudebních nástrojů', NULL, NULL, 82),
(552, '82-41-M/18', 'Uměleckořemeslná stavba varhan', NULL, NULL, 82),
(553, '82-51-L/02', 'Uměleckořemeslné zpracování dřeva', NULL, NULL, 82),
(554, '82-51-L/04', 'Uměleckořemeslné zpracování kamene a keramiky', NULL, NULL, 82),
(555, '82-51-L/01', 'Uměleckořemeslné zpracování kovů', NULL, NULL, 82),
(556, '82-51-L/05', 'Uměleckořemeslné zpracování skla', NULL, NULL, 82),
(557, '82-51-L/03', 'Uměleckořemeslné zpracování textilu', NULL, NULL, 82),
(558, '82-51-H/04', 'Umělecký keramik', NULL, NULL, 82),
(559, '82-51-H/01', 'Umělecký kovář a zámečník, pasíř', NULL, NULL, 82),
(560, '82-51-H/07', 'Umělecký pozlacovač', NULL, NULL, 82),
(561, '82-51-H/09', 'Umělecký rytec', NULL, NULL, 82),
(562, '82-51-H/08', 'Umělecký sklenář', NULL, NULL, 82),
(563, '82-51-H/06', 'Umělecký štukatér', NULL, NULL, 82),
(564, '82-51-H/02', 'Umělecký truhlář a řezbář', NULL, NULL, 82),
(565, '82-41-M/02', 'Užitá fotografie a média', NULL, NULL, 82),
(566, '82-41-M/01', 'Užitá malba', NULL, NULL, 82),
(567, '41-51-H/02', 'Včelař', NULL, NULL, 41),
(568, '68-43-M/01', 'Veřejnosprávní činnost', NULL, NULL, 68),
(569, '43-41-M/01', 'Veterinářství', NULL, NULL, 43),
(570, '41-42-M/01', 'Vinohradnictví', NULL, NULL, 41),
(571, '82-51-H/05', 'Vlásenkář a maskér', NULL, NULL, 82),
(572, '36-65-H/01', 'Vodař', NULL, NULL, 36),
(573, '78-42-M/07', 'Vojenské lyceum', NULL, NULL, 78),
(574, '28-57-H/01', 'Výrobce a dekoratér keramiky', NULL, NULL, 28),
(575, '28-63-H/01', 'Výrobce bižuterie a dekorativních předmětů', NULL, NULL, 28),
(576, '32-52-H/01', 'Výrobce kožedělného zboží', NULL, NULL, 32),
(577, '32-54-H/01', 'Výrobce obuvi', NULL, NULL, 32),
(578, '29-51-H/01', 'Výrobce potravin', NULL, NULL, 29),
(579, '31-57-H/01', 'Výrobce textilií', NULL, NULL, 31),
(580, '82-41-M/12', 'Výtvarné zpracování keramiky a porcelánu', NULL, NULL, 82),
(581, '82-41-M/06', 'Výtvarné zpracování kovů a drahých kamenů', NULL, NULL, 82),
(582, '82-41-M/13', 'Výtvarné zpracování skla a světelných objektů', NULL, NULL, 82),
(583, '41-52-E/02', 'Zahradnická výroba', NULL, NULL, 41),
(584, '41-52-E/01', 'Zahradnické práce', NULL, NULL, 41),
(585, '41-44-M/01', 'Zahradnictví', NULL, NULL, 41),
(586, '41-52-H/01', 'Zahradník', NULL, NULL, 41),
(587, '78-42-M/04', 'Zdravotnické lyceum', NULL, NULL, 78),
(588, '36-67-E/01', 'Zednické práce', NULL, NULL, 36),
(589, '36-67-H/01', 'Zedník', NULL, NULL, 36),
(590, '41-51-H/01', 'Zemědělec - farmář', NULL, NULL, 41),
(591, '41-51-E/01', 'Zemědělské práce', NULL, NULL, 41),
(592, '82-51-H/03', 'Zlatník a klenotník', NULL, NULL, 82),
(593, '82-45-P/01', 'Zpěv', NULL, NULL, 82),
(594, '32-41-M/01', 'Zpracování usní, plastů a pryže', NULL, NULL, 32),
(595, '41-57-H/01', 'Zpracovatel dřeva', NULL, NULL, 41),
(596, '33-58-E/01', 'Zpracovatel přírodních pletiv', NULL, NULL, 33),
(597, '53-41-J/01', 'Zubní instrumentářka', NULL, NULL, 53),
(598, '37-52-H/01', 'Železničář', NULL, NULL, 37);

-- --------------------------------------------------------

--
-- Struktura tabulky `data`
--

CREATE TABLE `data` (
  `id` int(2) DEFAULT NULL,
  `school_name` varchar(94) DEFAULT NULL,
  `www` varchar(33) DEFAULT NULL,
  `presence` varchar(3) DEFAULT NULL,
  `connectors` varchar(1) DEFAULT NULL,
  `tables` varchar(1) DEFAULT NULL,
  `chairs` varchar(1) DEFAULT NULL,
  `info` varchar(115) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `address` varchar(58) DEFAULT NULL,
  `name` varchar(34) DEFAULT NULL,
  `username` varchar(18) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'kontaktní osoba'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `data`
--

INSERT INTO `data` (`id`, `school_name`, `www`, `presence`, `connectors`, `tables`, `chairs`, `info`, `city`, `address`, `name`, `username`, `role`) VALUES
(2, 'AHOL - střední odborná škola, s.r.o.', 'https://www.ahol.cz ', 'ANO', '1', '1', '2', '', 'Ostrava', 'Náměstí Jiřího z Poděbrad 301/26, 703 00 Ostrava-Vítkovice', 'Ing. Radmila Sosnová ', 'RadmilaSosnova', 'kontaktní osoba'),
(3, 'AVE ART Ostrava, soukromá Střední umělecká škola a Základní umělecká škola, s.r.o.', 'http://aveart.cz', 'ANO', '1', '1', '', '', 'Ostrava', 'Hasičská 550/50, 700 30 Ostrava - Hrabůvka', 'Ing. Jaroslav Prokop', 'JaroslavProkop', 'kontaktní osoba'),
(4, 'Bezpečnostně právní akademie Ostrava, s. r. o., střední škola', 'http://www.bpa-ostrava.cz', 'ANO', '1', '', '', 'prostor na ukázky sebeobrany na tatami cca 5x5 m (min. 4x4m)laserová střelnice ve stanu 3x6 m(min. 2x3 m bez stanu)', 'Ostrava', 'Sládečkova 393/90, 715 00 Ostrava-Michálkovice', 'Mgr. Ctirad Skopal', 'CtiradSkopal', 'kontaktní osoba'),
(5, 'Církevní konzervatoř Německého řádu', 'http://www.konzervator.cz', 'ANO', '2', '2', '', '', 'Opava', 'Beethovenova 1, 746 01 Opava', 'Mgr. Ivan Luger ', 'IvanLuger', 'kontaktní osoba'),
(6, 'Gymnázium Josefa Kainara, Hlučín', 'http://ghlucin.cz', 'ANO', '2', '1', '', '', 'Hlučín', 'Dr. E. Beneše 586/7, Hlučín', 'PhDr. Charlotta Grenarová', 'CharlottaGrenarova', 'kontaktní osoba'),
(7, 'Masarykova střední škola zemědělská a Vyšší odborná škola, Opava, příspěvková organizace', 'http://www.zemedelka.opava.cz', 'ANO', '2', '2', '', '', 'Opava', 'Purkyňova 12, Opava 746 01', 'Ing. Arnošt Klein', 'ArnostKlein', 'kontaktní osoba'),
(8, 'Mendelovo gymnázium, Opava', 'https://www.mgo.opava.cz', 'ANO', '1', '2', '', 'Místo na promítání', 'Opava', 'Komenského 5, 746 01 Opava', 'Mgr. Monika Klapková', 'MonikaKlapkova', 'kontaktní osoba'),
(9, 'Obchodní akademie a Střední odborná škola logistická, Opava, příspěvková organizace', 'https://www.oa-opava.cz', 'ANO', '1', '3', '6', 'prostor o velikosti 6x4 m', 'Opava', 'Hany Kvapilové 20, 746 01  Opava', 'Ing. Petr Kyjovský', 'PetrKyjovsky', 'kontaktní osoba'),
(10, 'Odborné učiliště a Praktická škola, Hlučín', 'https://www.ouhlucin.cz', 'ANO', '1', '2', '', '', 'Hlučín', 'Čs. armády 336/4a, 748 01 Hlučín', 'Mgr. Jindřich Honzík ', 'JindrichHonzik', 'kontaktní osoba'),
(11, 'RB SOU autoopravárenské s.r.o.', 'http://www.souauto.cz', 'ANO', '1', '2', '', '', 'Ostrava', 'Zengrova 38, Ostrava - Vítkovice', 'Ing. Richard Veselský', 'RichardVeselsky', 'kontaktní osoba'),
(12, 'Slezské gymnázium, Opava, příspěvková organizace', 'http://www.slezgymopava.cz', 'ANO', '1', '2', '', 'Prostor pro stojan a plátno', 'Opava', 'Zámecký okruh 29, Opava, 746 01', 'Ing. Milada Pazderníková', 'MiladaPazdernikova', 'kontaktní osoba'),
(13, 'SOŠ dopravy a cestovního ruchu, Krnov, p. o.', 'http://www.sos-dcr.cz', 'ANO', '1', '2', '4', 'prostor na postavení 2 reklamních rolapů', 'Krnov', 'Revoluční 92, 794 01 Krnov', 'Mgr. Zdeněk Klein', 'ZdenekKlein', 'kontaktní osoba'),
(14, 'SOŠ ochrany a osob majetku s.r.o.', 'http://www.sosoom-ostrava.cz', 'ANO', '1', '2', '', 'Praktická ukázka na tatami- pokud to půjde větší prostor', 'Ostrava', 'Liptaňské nám. 890, 708 00  Ostrava - Poruba ', 'Ing. Slavka Krystová Florková, MBA', 'SlavkaKrystova', 'kontaktní osoba'),
(15, 'Soukromá obchodní akademie Opava s.r.o.,', 'http://www.soukroma-oa-opava.cz', 'ANO', '1', '2', '3', '', 'Opava', 'Šrámkova 1457/4, Opava 5, 747 05', 'PaedDr. Josef Gabrhel', 'JosefGabrhel', 'kontaktní osoba'),
(16, 'Soukromá střední podnikatelská škola, s.r.o.,Opava', 'https://www.podnikatelskaskola.cz', 'ANO', '1', '', '', 'Mají vlastní tabuli. Potřebují 6m + z každé strany ideálně 1m na průchod. ', 'Opava', 'Hlavní 101, 747 06 Opava', 'Ing. et Ing. Josef Zemek ', 'JosefZemek', 'kontaktní osoba'),
(17, 'Střední odborná škola a Základní škola, Město Albrechtice, příspěvková organizace', 'https://www.souzma.cz', 'ANO', '2', '2', '', '', 'Město Albrechtice', 'Nemocniční 117/11, 793 95 Město Albrechtice ', 'Ing. Lenka Metzlová', 'LenkaMetzlova', 'kontaktní osoba'),
(18, 'Střední odborná škola lesnická a strojírenská', 'http://www.sou-stbk.cz', 'ANO', '1', '2', '2', '', 'Šternerk', 'Olomoucká 25, 785 01 Šternberk', 'Ing. Pavel Andrys ', 'PavelAndrys', 'kontaktní osoba'),
(19, 'Střední odborná škola, Bruntál, příspěvková organizace', 'http://www.sosbruntal.cz', 'ANO', '2', '2', '', '', 'Bruntál', 'Krnovská 998/9, 792 01 Bruntál', 'Mgr. Michal Durec, DiS', 'MichalDurec', 'kontaktní osoba'),
(20, 'Střední odborná umělecká škola varhanářská o.p.s', 'http://www.varhanysous.cz', 'ANO', '1', '2', '', '', 'Krnov', 'Revoluční 54, 794 02 Krnov', 'Ing. Jana Kypúsová', 'JanaKypusova', 'kontaktní osoba'),
(21, 'Střední odborné učiliště stavební, Opava, příspěvková organizace', 'https://soustop.cz', 'ANO', '2', '', '', 'minimálně 4x3 metry, ale mají 9 profesí, chtěli by víc místa pokud by to šlo', 'Opava', 'Boženy Němcové 2309/22, 746 01 Opava', 'Mgr. Miroslav Weisz', 'MiroslavWeisz', 'kontaktní osoba'),
(22, 'Střední pedagogická škola a Střední zdravotnická škola svaté Anežky České', 'https://www.cssodry.cz', 'ANO', '1', '2', '3', '', 'Odry', '1. máje 249/37, 742 35 Odry', 'Ing. Pavla Hostašová ', 'PavlaHostasova', 'kontaktní osoba'),
(23, 'Střední pedagogická škola a Střední zdravotnická škola, Krnov', 'https://www.spgs-szs.cz/', 'ANO', '1', '1', '', '', 'Krnov', 'Krnov, Jiráskova 841/1a, 794 01', 'Mgr. Jana Chlebovská', 'JanaChlebovska', 'kontaktní osoba'),
(24, 'Střední průmyslová škola a Obchodní akademie, Bruntál, příspěvková organizace', 'http://spsoa.cz', 'ANO', '2', '2', '', 'velikost stánku je min. 4x2 m', 'Bruntál', 'Kavalcova 814/1, 792 01, Bruntál', 'Ing. Jan Meca ', 'JanMeca', 'kontaktní osoba'),
(25, 'Střední průmyslová škola chemická akademika Heyrovského', 'https://www.spsch.eu', '', '', '', '', 'urgována odpověd, zašlou', 'Ostrava', 'Středoškolská 2854/1, Ostrava-Zábřeh, 700 30 ', 'Ing. Jiří Kaličinský', 'JiriKalicinsky', 'kontaktní osoba'),
(26, 'Střední průmyslová škola Ostrava-Vítkovice, příspěvková organizace', 'https://www.spszengrova.cz', 'ANO', '1', '2', '', '', 'Ostrava', 'Zengrova 1, 703 00 Ostrava - Vítkovice ', 'Mgr. Tomáš Řežáb', 'TomasRezab', 'kontaktní osoba'),
(27, 'Střední průmyslová škola stavební Opava', 'http://www.spsopava.cz', 'ANO', '1', '2', '', 'prostor min. 3,5 m na šířku a 2,5 m na hloubku', 'Opava', 'Mírová 630/3, 746 01 Opava ', 'Ing. Karla Labudová', 'KarlaLabudova', 'kontaktní osoba'),
(28, 'Střední škola automobilní, Krnov, příspěvková organizace', 'https://www.ssa-krnov.cz', 'ANO', '1', '1', '', '', 'Krnov', 'Opavská 499/49, Krnov', 'Predikantová Věra, Ing.', 'PredikantovaVera', 'kontaktní osoba'),
(29, 'Střední škola elektrotechnická', 'http://www.sse-najizdarne.cz', 'ANO', '1', '2', '', '', 'Ostrava', 'Ostrava, Na Jízdárně 30, 702 00 Ostrava', 'Ing. Tomáš Führer', 'TomasFuhrer', 'kontaktní osoba'),
(30, 'Střední škola hotelnictví a služeb a Vyšší odborná škola, Opava, příspěvková organizace', 'https://www.sshsopava.cz', 'ANO', '', '', '', 'vlastní stánek 6x3 m, 4-5 spotřebičů, do 10 kW', 'Opava', 'Tyršova 867/4, 746 95 Opava', 'Mgr. Martin Ruský', 'MartinRusky', 'kontaktní osoba'),
(31, 'Střední škola hotelnictví, gastronomie a služeb SČMSD Šilheřovice, s.r.o.', 'https://www.hssilherovice.cz', 'ANO', '1', '3', '', 'větší prostor pro prezentaci', 'Šilheřovice', 'Dolní 356, 747 15 Šilheřovice', 'Ing. Diana Volejníčková', 'DianaVolejnickova', 'kontaktní osoba'),
(32, 'Střední škola informatiky, elektrotechniky a řemesel Rožnov pod Radhoštěm', 'https://www.roznovskastredni.cz', 'ANO', '1', '2', '', '', 'Rožnov pod Radhoštěm', 'Školní 1610, 756 61 Rožnov pod Radhoštěm', 'Mgr. Trefil Miroslav', 'TrefilMiroslav', 'kontaktní osoba'),
(33, 'Střední škola polygrafická, Olomouc', 'http://www.polygraficka.cz', 'ANO', '1', '2', '4', '', 'Olomouc', 'Střední novosadská 87/53, 779 00 Olomouc', 'PhDr. Marcela Hanáková  ', 'MarcelaHanakova', 'kontaktní osoba'),
(34, 'Střední škola průmyslová a umělecká, Opava', 'https://www.sspu-opava.cz', 'ANO', '1', '3', '', '', 'Opava', 'Praskova 399/8, Opava, 746 01', 'Ing. Vítězslav Doleží ', 'VitezslavDolezi', 'kontaktní osoba'),
(35, 'Střední škola průmyslová, Krnov, příspěvková organizace', 'https://www.sspkrnov.cz', 'ANO', '1', '2', '', 'POP UP stěna (3x2m)', 'Krnov', 'Soukenická 2458/21C, Krnov', 'Ing. Aleš Zouhar ', 'AlesZouhar', 'kontaktní osoba'),
(36, 'Střední škola technická a dopravní, Ostrava-Vítkovice', 'https://www.sstd.cz', 'ANO', '1', '2', '2', '', 'Ostrava', '703 00 Ostrava-Vítkovice, Moravská 2/964', 'Ing. Stanislav Zapletal', 'StanislavZapletal', 'kontaktní osoba'),
(37, 'Střední škola technická, Opava, Kolofíkovo nábřeží 51, příspěvková organizace', 'https://www.sst.opava.cz', 'ANO', '1', '2', '', '', 'Opava', 'Kolofíkovo nábřeží 1062/51, 747 05 Opava', 'Ing. Josef Vondál', 'JosefVondal', 'kontaktní osoba'),
(38, 'Střední škola teleinformatiky, Ostrava, příspěvková organizace', 'https://teleinformatika.eu', 'ANO', '1', '2', '', '', 'Ostrava', 'Opavská 1119/12, 708 61 Ostrava-Poruba', 'Ing. Pavel Zubek', 'PavelZubek', 'kontaktní osoba'),
(39, 'Střední škola, Odry, příspěvková organizace Moravskoslezského kraje', 'http://ssodry.cz', 'ANO', '1', '1', '', 'Prostor pro vlastní lehátka a  kosmetické židle. Předvádění kuchaři,kadeřníci, maséři a kosmetičky', 'Odry', 'Sokolovská 647/1, 742 35 Odry', 'Mgr. Jana Kellnerová', 'JanaKellnerova', 'kontaktní osoba'),
(40, 'Střední vinařská škola Valtice', 'https://www.svisv.cz', 'ANO', '1', '2', '', '', 'Valtice', 'Sobotní 116, 691 42 Valtice', 'Ing. Tomáš Javůrek', 'TomasJavurek', 'kontaktní osoba'),
(41, 'Střední zdravotnická škola a Vyšší odborná škola zdravotnická, Ostrava, příspěvková organizace', 'https://www.zdrav-ova.cz', 'ANO', '1', '2', '', '', 'Ostrava', 'Jeremenkova 754/2, 703 00  Ostrava', 'RNDr. Jana Foltýnová, Ph.D. ', 'JanaFoltynova', 'kontaktní osoba'),
(42, 'Střední zdravotnická škola, Opava, příspěvková organizace', 'http://www.szsopava.cz', 'ANO', '1', '2', '', '', 'Opava', 'Dvořákovy sady 176/2, 746 01 Opava', 'Mgr. Alena Šimečková', 'AlenaSimeckova', 'kontaktní osoba'),
(43, 'Tauferova SOŠ veterinární Kroměříž', 'http://vetkm.cz', 'ANO', '1', '1', '', '', 'Kroměříž', 'Koperníkova 1429, 767 01 Kroměříž', '', '', 'kontaktní osoba'),
(44, 'Vyšší odborná škola potravinářská a Střední průmyslová škola mlékárenská Kroměříž', 'http://www.vospaspsm.cz', 'ANO', '1', '2', '', '', 'Kroměříž', 'Štěchovice 4176, 767 54 Kroměříž', 'Mgr. Ing. Michal Pospíšil', 'MichalPospisil', 'kontaktní osoba'),
(45, 'Základní škola a gymnázium Vítkov, příspěvková organizace', 'http://zsgvitkov.cz', 'ANO', '1', '2', '', 'WIFI pokud by šlo', 'Vítkov', 'Komenského 754, 749 01 Vítkov', 'Mgr. Miroslav Bučánek', 'MiroslavBucanek', 'kontaktní osoba');

-- --------------------------------------------------------

--
-- Struktura tabulky `event`
--

CREATE TABLE `event` (
  `idevent` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `place` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `about` text COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `firm`
--

CREATE TABLE `firm` (
  `idfirm` int(10) UNSIGNED NOT NULL,
  `firm_name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `ico` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `www` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `logo` blob,
  `about` text COLLATE utf8_czech_ci,
  `contact_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `firm`
--

INSERT INTO `firm` (`idfirm`, `firm_name`, `ico`, `address`, `city`, `phone`, `email`, `www`, `logo`, `about`, `contact_id`) VALUES
(1, 'ADIV, spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.adiv.cz', NULL, NULL, NULL),
(2, 'Agrana ', NULL, NULL, NULL, NULL, NULL, 'https://cz.agrana.com/home/', NULL, NULL, NULL),
(3, 'Akzo Nobel Coatings CZ, a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.interpon.cz/interpon_series/interpon-10', NULL, NULL, NULL),
(4, 'ARMATURY Group a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.armaturygroup.cz/', NULL, NULL, NULL),
(5, 'BARAN', NULL, NULL, NULL, NULL, NULL, 'https://www.baran.cz/', NULL, NULL, NULL),
(6, 'BENKO KLIMA s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.benkoklima.cz/', NULL, NULL, NULL),
(7, 'BIDFOOD Opava s.r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.bidfood.cz/', NULL, NULL, NULL),
(8, 'BOHEMIAFLEX CS, s.r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.bohemiaflex-cs.cz/', NULL, NULL, NULL),
(9, 'BRANO a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.brano.eu/', NULL, NULL, NULL),
(10, 'CARGO DESIGN', NULL, NULL, NULL, NULL, NULL, 'http://www.cargodesign.cz/', NULL, NULL, NULL),
(11, 'ČSOB, a.s., pobočka Opava', NULL, NULL, NULL, NULL, NULL, 'https://www.csob.cz/', NULL, NULL, NULL),
(12, 'DK1', NULL, NULL, NULL, NULL, NULL, 'http://www.dk1.cz/', NULL, NULL, NULL),
(13, 'ELEKTRO – FA. PAVELEK, s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.pavelek.cz/', NULL, NULL, NULL),
(14, 'Elok-Opava spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'https://elok.cz/', NULL, NULL, NULL),
(15, 'FEMONT OPAVA s.r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.femont.cz/', NULL, NULL, NULL),
(16, 'FERRAM, a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.ferram.cz/', NULL, NULL, NULL),
(17, 'FROS ZPS s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.fros.cz/', NULL, NULL, NULL),
(18, 'Geometra', NULL, NULL, NULL, NULL, NULL, 'http://www.geometra.cz/', NULL, NULL, NULL),
(19, 'Grigar', NULL, NULL, NULL, NULL, NULL, 'http://grigar.cz/', NULL, NULL, NULL),
(20, 'HAGEMANN a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.hagemann.cz/', NULL, NULL, NULL),
(21, 'Hansen Electric, spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.hansen-electric.cz/', NULL, NULL, NULL),
(22, 'HON a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.hon.cz/', NULL, NULL, NULL),
(23, 'ISOTRA a.s.', NULL, NULL, NULL, NULL, NULL, 'https://www.isotra.cz/', NULL, NULL, NULL),
(24, 'KOMAS, spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.komas.cz/cs/', NULL, NULL, NULL),
(25, 'KSR Industrial s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.ksrint.com/', NULL, NULL, NULL),
(26, 'Váhy Kadlec', NULL, NULL, NULL, NULL, NULL, 'http://www.vahy.net/', NULL, NULL, NULL),
(27, 'Lumír Prejda', NULL, NULL, NULL, NULL, NULL, 'http://www.prejda.cz/', NULL, NULL, NULL),
(28, 'Pekárna Knappe', NULL, NULL, NULL, NULL, NULL, 'https://www.knappe.cz/', NULL, NULL, NULL),
(29, 'MLÝN HERBER spol. s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.mlynherber.cz/', NULL, NULL, NULL),
(30, 'Model Obaly a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.modelgroup.com/cs', NULL, NULL, NULL),
(31, 'MORAVIA Stamping a.s.', NULL, NULL, NULL, NULL, NULL, 'https://www.moraviastamping.com/', NULL, NULL, NULL),
(32, 'MSA a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.msa.cz/', NULL, NULL, NULL),
(33, 'NEXT Fitness s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.pepasport.cz/', NULL, NULL, NULL),
(34, 'NORD SERVICE, spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.nord-service.cz/', NULL, NULL, NULL),
(35, 'OPaLL-AGRI, s.r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.opall-agri.cz/', NULL, NULL, NULL),
(36, 'OPATISK s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.opatisk.cz/', NULL, NULL, NULL),
(37, 'Opavská lesní a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.opavskalesni.cz/', NULL, NULL, NULL),
(38, 'OPTYS, spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.optys.cz/', NULL, NULL, NULL),
(39, 'OSTROJ a.s.', NULL, NULL, NULL, NULL, NULL, 'https://www.ostroj.cz/', NULL, NULL, NULL),
(40, 'PEKÁRNA KRÁL s.r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.pekarnakral.cz/', NULL, NULL, NULL),
(41, 'PF PLASTY s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.pfplasty.cz/cs/', NULL, NULL, NULL),
(42, 'POHL cz, a.s./odštěpný závod', NULL, NULL, NULL, NULL, NULL, 'https://www.pohl.cz/', NULL, NULL, NULL),
(43, 'POUBA a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.pouba.cz/', NULL, NULL, NULL),
(44, 'Prestar, s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://prestar.cz/', NULL, NULL, NULL),
(45, 'PRIMA LINGUA s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.primalingua.cz/', NULL, NULL, NULL),
(46, 'RKL Opava spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.rkl.cz/cs/', NULL, NULL, NULL),
(47, 'SB LOGISTIK TRANSPORT s.r.o', NULL, NULL, NULL, NULL, NULL, 'http://sblogistik.sweb.cz/', NULL, NULL, NULL),
(48, 'SECALO a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.secalo.cz/', NULL, NULL, NULL),
(49, 'Slezská tvorba, výrobní družstvo', NULL, NULL, NULL, NULL, NULL, 'https://www.slezska-tvorba.cz/', NULL, NULL, NULL),
(50, 'Schindler s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.schindler.cz/', NULL, NULL, NULL),
(51, 'SLEZSKÉ STAVBY OPAVA s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.slezskestavby.cz/', NULL, NULL, NULL),
(52, 'STROJÍRNA Vehovský s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.vehovsky.cz/', NULL, NULL, NULL),
(53, 'ŠTENCEL TRANSPORT s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.stenceltransport.cz/', NULL, NULL, NULL),
(54, 'TATRA TRUCKS a.s.', NULL, NULL, NULL, NULL, NULL, 'http://www.tatra.cz/', NULL, NULL, NULL),
(55, 'Teva Czech Industries s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.tevapharm.cz/', NULL, NULL, NULL),
(56, 'TISKÁRNA GRAFICO s.r.o.', NULL, NULL, NULL, NULL, NULL, 'https://www.grafico.cz/', NULL, NULL, NULL),
(57, 'TQM', NULL, NULL, NULL, NULL, NULL, 'https://www.tqm.cz/', NULL, NULL, NULL),
(58, 'TRANSA spol. s r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.transa.cz/', NULL, NULL, NULL),
(59, 'UNICONT OPAVA s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://unicont.cz/', NULL, NULL, NULL),
(60, 'VZS RYCHTÁŘ s.r.o.', NULL, NULL, NULL, NULL, NULL, 'http://www.vzsrychtar.cz/', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `firm_has_course`
--

CREATE TABLE `firm_has_course` (
  `firm_idfirm` int(10) UNSIGNED NOT NULL,
  `course_idcourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `media`
--

CREATE TABLE `media` (
  `idmedia` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `filename` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `extension` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `mime` enum('text','image','video','audio') COLLATE utf8_czech_ci NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `media_has_article`
--

CREATE TABLE `media_has_article` (
  `media_idmedia` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `article_idarticle` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `partnership`
--

CREATE TABLE `partnership` (
  `firm_idfirm` int(10) UNSIGNED NOT NULL,
  `school_idschool` int(10) UNSIGNED NOT NULL,
  `about` text COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `school`
--

CREATE TABLE `school` (
  `idschool` int(10) UNSIGNED NOT NULL,
  `school_name` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `izo` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_czech_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `www` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  `logo` blob,
  `about` text COLLATE utf8_czech_ci,
  `contact_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `school`
--

INSERT INTO `school` (`idschool`, `school_name`, `izo`, `address`, `city`, `phone`, `email`, `www`, `logo`, `about`, `contact_id`) VALUES
(2, 'AHOL - střední odborná škola, s.r.o.', NULL, 'Náměstí Jiřího z Poděbrad 301/26, 703 00 Ostrava-Vítkovice', 'Ostrava', NULL, NULL, 'https://www.ahol.cz ', NULL, NULL, 2),
(3, 'AVE ART Ostrava, soukromá Střední umělecká škola a Základní umělecká škola, s.r.o.', NULL, 'Hasičská 550/50, 700 30 Ostrava - Hrabůvka', 'Ostrava', NULL, NULL, 'http://aveart.cz', NULL, NULL, 3),
(4, 'Bezpečnostně právní akademie Ostrava, s. r. o., střední škola', NULL, 'Sládečkova 393/90, 715 00 Ostrava-Michálkovice', 'Ostrava', NULL, NULL, 'http://www.bpa-ostrava.cz', NULL, NULL, 4),
(5, 'Církevní konzervatoř Německého řádu', NULL, 'Beethovenova 1, 746 01 Opava', 'Opava', NULL, NULL, 'http://www.konzervator.cz', NULL, NULL, 5),
(6, 'Gymnázium Josefa Kainara, Hlučín', NULL, 'Dr. E. Beneše 586/7, Hlučín', 'Hlučín', NULL, NULL, 'http://ghlucin.cz', NULL, NULL, 6),
(7, 'Masarykova střední škola zemědělská a Vyšší odborná škola, Opava, příspěvková organizace', NULL, 'Purkyňova 12, Opava 746 01', 'Opava', NULL, NULL, 'http://www.zemedelka.opava.cz', NULL, NULL, 7),
(8, 'Mendelovo gymnázium, Opava', NULL, 'Komenského 5, 746 01 Opava', 'Opava', NULL, NULL, 'https://www.mgo.opava.cz', NULL, NULL, 8),
(9, 'Obchodní akademie a Střední odborná škola logistická, Opava, příspěvková organizace', NULL, 'Hany Kvapilové 20, 746 01  Opava', 'Opava', NULL, NULL, 'https://www.oa-opava.cz', NULL, NULL, 9),
(10, 'Odborné učiliště a Praktická škola, Hlučín', NULL, 'Čs. armády 336/4a, 748 01 Hlučín', 'Hlučín', NULL, NULL, 'https://www.ouhlucin.cz', NULL, NULL, 10),
(11, 'RB SOU autoopravárenské s.r.o.', NULL, 'Zengrova 38, Ostrava - Vítkovice', 'Ostrava', NULL, NULL, 'http://www.souauto.cz', NULL, NULL, 11),
(12, 'Slezské gymnázium, Opava, příspěvková organizace', NULL, 'Zámecký okruh 29, Opava, 746 01', 'Opava', NULL, NULL, 'http://www.slezgymopava.cz', NULL, NULL, 12),
(13, 'SOŠ dopravy a cestovního ruchu, Krnov, p. o.', NULL, 'Revoluční 92, 794 01 Krnov', 'Krnov', NULL, NULL, 'http://www.sos-dcr.cz', NULL, NULL, 13),
(14, 'SOŠ ochrany a osob majetku s.r.o.', NULL, 'Liptaňské nám. 890, 708 00  Ostrava - Poruba ', 'Ostrava', NULL, NULL, 'http://www.sosoom-ostrava.cz', NULL, NULL, 14),
(15, 'Soukromá obchodní akademie Opava s.r.o.,', NULL, 'Šrámkova 1457/4, Opava 5, 747 05', 'Opava', NULL, NULL, 'http://www.soukroma-oa-opava.cz', NULL, NULL, 15),
(16, 'Soukromá střední podnikatelská škola, s.r.o.,Opava', NULL, 'Hlavní 101, 747 06 Opava', 'Opava', NULL, NULL, 'https://www.podnikatelskaskola.cz', NULL, NULL, 16),
(17, 'Střední odborná škola a Základní škola, Město Albrechtice, příspěvková organizace', NULL, 'Nemocniční 117/11, 793 95 Město Albrechtice ', 'Město Albrechtice', NULL, NULL, 'https://www.souzma.cz', NULL, NULL, 17),
(18, 'Střední odborná škola lesnická a strojírenská', NULL, 'Olomoucká 25, 785 01 Šternberk', 'Šternerk', NULL, NULL, 'http://www.sou-stbk.cz', NULL, NULL, 18),
(19, 'Střední odborná škola, Bruntál, příspěvková organizace', NULL, 'Krnovská 998/9, 792 01 Bruntál', 'Bruntál', NULL, NULL, 'http://www.sosbruntal.cz', NULL, NULL, 19),
(20, 'Střední odborná umělecká škola varhanářská o.p.s', NULL, 'Revoluční 54, 794 02 Krnov', 'Krnov', NULL, NULL, 'http://www.varhanysous.cz', NULL, NULL, 20),
(21, 'Střední odborné učiliště stavební, Opava, příspěvková organizace', NULL, 'Boženy Němcové 2309/22, 746 01 Opava', 'Opava', NULL, NULL, 'https://soustop.cz', NULL, NULL, 21),
(22, 'Střední pedagogická škola a Střední zdravotnická škola svaté Anežky České', NULL, '1. máje 249/37, 742 35 Odry', 'Odry', NULL, NULL, 'https://www.cssodry.cz', NULL, NULL, 22),
(23, 'Střední pedagogická škola a Střední zdravotnická škola, Krnov', NULL, 'Krnov, Jiráskova 841/1a, 794 01', 'Krnov', NULL, NULL, 'https://www.spgs-szs.cz/', NULL, NULL, 23),
(24, 'Střední průmyslová škola a Obchodní akademie, Bruntál, příspěvková organizace', NULL, 'Kavalcova 814/1, 792 01, Bruntál', 'Bruntál', NULL, NULL, 'http://spsoa.cz', NULL, NULL, 24),
(25, 'Střední průmyslová škola chemická akademika Heyrovského', NULL, 'Středoškolská 2854/1, Ostrava-Zábřeh, 700 30 ', 'Ostrava', NULL, NULL, 'https://www.spsch.eu', NULL, NULL, 25),
(26, 'Střední průmyslová škola Ostrava-Vítkovice, příspěvková organizace', NULL, 'Zengrova 1, 703 00 Ostrava - Vítkovice ', 'Ostrava', NULL, NULL, 'https://www.spszengrova.cz', NULL, NULL, 26),
(27, 'Střední průmyslová škola stavební Opava', NULL, 'Mírová 630/3, 746 01 Opava ', 'Opava', NULL, NULL, 'http://www.spsopava.cz', NULL, NULL, 27),
(28, 'Střední škola automobilní, Krnov, příspěvková organizace', NULL, 'Opavská 499/49, Krnov', 'Krnov', NULL, NULL, 'https://www.ssa-krnov.cz', NULL, NULL, 28),
(29, 'Střední škola elektrotechnická', NULL, 'Ostrava, Na Jízdárně 30, 702 00 Ostrava', 'Ostrava', NULL, NULL, 'http://www.sse-najizdarne.cz', NULL, NULL, 29),
(30, 'Střední škola hotelnictví a služeb a Vyšší odborná škola, Opava, příspěvková organizace', NULL, 'Tyršova 867/4, 746 95 Opava', 'Opava', NULL, NULL, 'https://www.sshsopava.cz', NULL, NULL, 30),
(31, 'Střední škola hotelnictví, gastronomie a služeb SČMSD Šilheřovice, s.r.o.', NULL, 'Dolní 356, 747 15 Šilheřovice', 'Šilheřovice', NULL, NULL, 'https://www.hssilherovice.cz', NULL, NULL, 31),
(32, 'Střední škola informatiky, elektrotechniky a řemesel Rožnov pod Radhoštěm', NULL, 'Školní 1610, 756 61 Rožnov pod Radhoštěm', 'Rožnov pod Radhoštěm', NULL, NULL, 'https://www.roznovskastredni.cz', NULL, NULL, 32),
(33, 'Střední škola polygrafická, Olomouc', NULL, 'Střední novosadská 87/53, 779 00 Olomouc', 'Olomouc', NULL, NULL, 'http://www.polygraficka.cz', NULL, NULL, 33),
(34, 'Střední škola průmyslová a umělecká, Opava', NULL, 'Praskova 399/8, Opava, 746 01', 'Opava', NULL, NULL, 'https://www.sspu-opava.cz', NULL, NULL, 34),
(35, 'Střední škola průmyslová, Krnov, příspěvková organizace', NULL, 'Soukenická 2458/21C, Krnov', 'Krnov', NULL, NULL, 'https://www.sspkrnov.cz', NULL, NULL, 35),
(36, 'Střední škola technická a dopravní, Ostrava-Vítkovice', NULL, '703 00 Ostrava-Vítkovice, Moravská 2/964', 'Ostrava', NULL, NULL, 'https://www.sstd.cz', NULL, NULL, 36),
(37, 'Střední škola technická, Opava, Kolofíkovo nábřeží 51, příspěvková organizace', NULL, 'Kolofíkovo nábřeží 1062/51, 747 05 Opava', 'Opava', NULL, NULL, 'https://www.sst.opava.cz', NULL, NULL, 37),
(38, 'Střední škola teleinformatiky, Ostrava, příspěvková organizace', NULL, 'Opavská 1119/12, 708 61 Ostrava-Poruba', 'Ostrava', NULL, NULL, 'https://teleinformatika.eu', NULL, NULL, 38),
(39, 'Střední škola, Odry, příspěvková organizace Moravskoslezského kraje', NULL, 'Sokolovská 647/1, 742 35 Odry', 'Odry', NULL, NULL, 'http://ssodry.cz', NULL, NULL, 39),
(40, 'Střední vinařská škola Valtice', NULL, 'Sobotní 116, 691 42 Valtice', 'Valtice', NULL, NULL, 'https://www.svisv.cz', NULL, NULL, 40),
(41, 'Střední zdravotnická škola a Vyšší odborná škola zdravotnická, Ostrava, příspěvková organizace', NULL, 'Jeremenkova 754/2, 703 00  Ostrava', 'Ostrava', NULL, NULL, 'https://www.zdrav-ova.cz', NULL, NULL, 41),
(42, 'Střední zdravotnická škola, Opava, příspěvková organizace', NULL, 'Dvořákovy sady 176/2, 746 01 Opava', 'Opava', NULL, NULL, 'http://www.szsopava.cz', NULL, NULL, 42),
(43, 'Tauferova SOŠ veterinární Kroměříž', NULL, 'Koperníkova 1429, 767 01 Kroměříž', 'Kroměříž', NULL, NULL, 'http://vetkm.cz', NULL, NULL, 43),
(44, 'Vyšší odborná škola potravinářská a Střední průmyslová škola mlékárenská Kroměříž', NULL, 'Štěchovice 4176, 767 54 Kroměříž', 'Kroměříž', NULL, NULL, 'http://www.vospaspsm.cz', NULL, NULL, 44),
(45, 'Základní škola a gymnázium Vítkov, příspěvková organizace', NULL, 'Komenského 754, 749 01 Vítkov', 'Vítkov', NULL, NULL, 'http://zsgvitkov.cz', NULL, NULL, 45);

-- --------------------------------------------------------

--
-- Struktura tabulky `school_has_course`
--

CREATE TABLE `school_has_course` (
  `school_idschool` int(10) UNSIGNED NOT NULL,
  `course_idcourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `space`
--

CREATE TABLE `space` (
  `idspace` int(10) UNSIGNED NOT NULL,
  `sign` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `location` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `stand`
--

CREATE TABLE `stand` (
  `idstand` int(10) UNSIGNED NOT NULL,
  `about` text COLLATE utf8_czech_ci,
  `event_idevent` int(10) UNSIGNED NOT NULL,
  `space_idspace` int(10) UNSIGNED NOT NULL,
  `school_idschool` int(10) UNSIGNED NOT NULL,
  `tables` int(1) DEFAULT NULL,
  `chairs` int(1) DEFAULT NULL,
  `connectors` int(1) DEFAULT NULL,
  `details` text COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

CREATE TABLE `user` (
  `iduser` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `password` char(128) COLLATE utf8_czech_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `role` enum('administrátor','organizátor','kontaktní osoba') COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `photo` blob,
  `info` text COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `name`, `role`, `email`, `photo`, `info`) VALUES
(1, 'admin', '$2y$10$LiBARAo8BDnA5DboIqDNHesjx2SVm5N.8t/qqDjYC9U/.9/FjVH.2', 'Administrator', 'administrátor', 'admin@skola.cz', 0x89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a866000000097048597300000b1300000b1301009a9c180000424169545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e0a2020203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e0a2020202020203c7264663a4465736372697074696f6e207264663a61626f75743d22220a202020202020202020202020786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f220a202020202020202020202020786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f220a202020202020202020202020786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f220a202020202020202020202020786d6c6e733a73744576743d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f757263654576656e7423220a202020202020202020202020786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f7572636552656623220a202020202020202020202020786d6c6e733a70686f746f73686f703d22687474703a2f2f6e732e61646f62652e636f6d2f70686f746f73686f702f312e302f220a202020202020202020202020786d6c6e733a746966663d22687474703a2f2f6e732e61646f62652e636f6d2f746966662f312e302f220a202020202020202020202020786d6c6e733a657869663d22687474703a2f2f6e732e61646f62652e636f6d2f657869662f312e302f223e0a2020202020202020203c786d703a437265617465446174653e323031352d31312d32315431353a32393a32395a3c2f786d703a437265617465446174653e0a2020202020202020203c786d703a4d6f64696679446174653e323031352d31312d32325431303a34333a32322b30353a33303c2f786d703a4d6f64696679446174653e0a2020202020202020203c786d703a4d65746164617461446174653e323031352d31312d32325431303a34333a32322b30353a33303c2f786d703a4d65746164617461446174653e0a2020202020202020203c786d703a43726561746f72546f6f6c3e41646f62652050686f746f73686f70204343203230313420284d6163696e746f7368293c2f786d703a43726561746f72546f6f6c3e0a2020202020202020203c64633a666f726d61743e696d6167652f706e673c2f64633a666f726d61743e0a2020202020202020203c786d704d4d3a486973746f72793e0a2020202020202020202020203c7264663a5365713e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e636f6e7665727465643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a706172616d65746572733e66726f6d20696d6167652f706e6720746f206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f703c2f73744576743a706172616d65746572733e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e73617665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a696e7374616e636549443e786d702e6969643a46374342323533333335323036383131383232414443373536313734443741363c2f73744576743a696e7374616e636549443e0a2020202020202020202020202020202020203c73744576743a7768656e3e323031352d31312d32325430393a34333a34352b30353a33303c2f73744576743a7768656e3e0a2020202020202020202020202020202020203c73744576743a6368616e6765643e2f3c2f73744576743a6368616e6765643e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e636f6e7665727465643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a706172616d65746572733e66726f6d20696d6167652f706e6720746f206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f703c2f73744576743a706172616d65746572733e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e73617665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a696e7374616e636549443e786d702e6969643a46384342323533333335323036383131383232414443373536313734443741363c2f73744576743a696e7374616e636549443e0a2020202020202020202020202020202020203c73744576743a7768656e3e323031352d31312d32325430393a34333a34352b30353a33303c2f73744576743a7768656e3e0a2020202020202020202020202020202020203c73744576743a6368616e6765643e2f3c2f73744576743a6368616e6765643e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e73617665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a696e7374616e636549443e786d702e6969643a31303465323063302d326131322d343738332d613131362d6338393731363136623936383c2f73744576743a696e7374616e636549443e0a2020202020202020202020202020202020203c73744576743a7768656e3e323031352d31312d32325431303a34333a32322b30353a33303c2f73744576743a7768656e3e0a2020202020202020202020202020202020203c73744576743a736f6674776172654167656e743e41646f62652050686f746f73686f70204343203230313420284d6163696e746f7368293c2f73744576743a736f6674776172654167656e743e0a2020202020202020202020202020202020203c73744576743a6368616e6765643e2f3c2f73744576743a6368616e6765643e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e636f6e7665727465643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a706172616d65746572733e66726f6d206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f7020746f20696d6167652f706e673c2f73744576743a706172616d65746572733e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e646572697665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a706172616d65746572733e636f6e7665727465642066726f6d206170706c69636174696f6e2f766e642e61646f62652e70686f746f73686f7020746f20696d6167652f706e673c2f73744576743a706172616d65746572733e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020202020203c7264663a6c69207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020202020202020203c73744576743a616374696f6e3e73617665643c2f73744576743a616374696f6e3e0a2020202020202020202020202020202020203c73744576743a696e7374616e636549443e786d702e6969643a37376635393432312d316334362d343866332d613063332d3630636565613366633531383c2f73744576743a696e7374616e636549443e0a2020202020202020202020202020202020203c73744576743a7768656e3e323031352d31312d32325431303a34333a32322b30353a33303c2f73744576743a7768656e3e0a2020202020202020202020202020202020203c73744576743a736f6674776172654167656e743e41646f62652050686f746f73686f70204343203230313420284d6163696e746f7368293c2f73744576743a736f6674776172654167656e743e0a2020202020202020202020202020202020203c73744576743a6368616e6765643e2f3c2f73744576743a6368616e6765643e0a2020202020202020202020202020203c2f7264663a6c693e0a2020202020202020202020203c2f7264663a5365713e0a2020202020202020203c2f786d704d4d3a486973746f72793e0a2020202020202020203c786d704d4d3a4465726976656446726f6d207264663a7061727365547970653d225265736f75726365223e0a2020202020202020202020203c73745265663a696e7374616e636549443e786d702e6969643a31303465323063302d326131322d343738332d613131362d6338393731363136623936383c2f73745265663a696e7374616e636549443e0a2020202020202020202020203c73745265663a646f63756d656e7449443e786d702e6469643a46374342323533333335323036383131383232414443373536313734443741363c2f73745265663a646f63756d656e7449443e0a2020202020202020202020203c73745265663a6f726967696e616c446f63756d656e7449443e786d702e6469643a46374342323533333335323036383131383232414443373536313734443741363c2f73745265663a6f726967696e616c446f63756d656e7449443e0a2020202020202020203c2f786d704d4d3a4465726976656446726f6d3e0a2020202020202020203c786d704d4d3a446f63756d656e7449443e61646f62653a646f6369643a70686f746f73686f703a65373164616563392d643130382d313137382d393535342d6330353035323062366633313c2f786d704d4d3a446f63756d656e7449443e0a2020202020202020203c786d704d4d3a496e7374616e636549443e786d702e6969643a37376635393432312d316334362d343866332d613063332d3630636565613366633531383c2f786d704d4d3a496e7374616e636549443e0a2020202020202020203c786d704d4d3a4f726967696e616c446f63756d656e7449443e786d702e6469643a46374342323533333335323036383131383232414443373536313734443741363c2f786d704d4d3a4f726967696e616c446f63756d656e7449443e0a2020202020202020203c70686f746f73686f703a436f6c6f724d6f64653e333c2f70686f746f73686f703a436f6c6f724d6f64653e0a2020202020202020203c746966663a4f7269656e746174696f6e3e313c2f746966663a4f7269656e746174696f6e3e0a2020202020202020203c746966663a585265736f6c7574696f6e3e3732303030302f31303030303c2f746966663a585265736f6c7574696f6e3e0a2020202020202020203c746966663a595265736f6c7574696f6e3e3732303030302f31303030303c2f746966663a595265736f6c7574696f6e3e0a2020202020202020203c746966663a5265736f6c7574696f6e556e69743e323c2f746966663a5265736f6c7574696f6e556e69743e0a2020202020202020203c657869663a436f6c6f7253706163653e36353533353c2f657869663a436f6c6f7253706163653e0a2020202020202020203c657869663a506978656c5844696d656e73696f6e3e3235363c2f657869663a506978656c5844696d656e73696f6e3e0a2020202020202020203c657869663a506978656c5944696d656e73696f6e3e3235363c2f657869663a506978656c5944696d656e73696f6e3e0a2020202020203c2f7264663a4465736372697074696f6e3e0a2020203c2f7264663a5244463e0a3c2f783a786d706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2277223f3ef1f84a4d000000206348524d00007a25000080830000f9ff000080e9000075300000ea6000003a980000176f925fc546000027bf4944415478daec9d779855e5b9b7efb5cbf40e33f4267d00051514b0a0820876f391c458a2d19c9463da89c758d124d663ccf7c593e4f3a8a96aec1a15d0d83b0a0822bdce308501a6cfecded6f9632d6098d9b367f7b5cb735fd7ba689b596bffdee7fdadb73eaf72f1c32a425a93078cd3af21c02060b07e0dea71e501c58045ff7d7eaf9fe3045c800fe8d67fdf06b4f6b89af55f0f00b5c05efd73429a621109d2827c600a301598a657f6b1fa352c8ef7386c0a9511fcbf26dd0c6a811a60ab7e6dd74d4510031022a01038199803cc0266029300738a3eef30fd9adbebeffdc02ee04b603db0065807d8a588c50084a30c05ce004ed7af6919522e66bdd53205f8a6fe773e600bf0917e7da87727048350640c20e914000b8045fa352dcbf5d80abc09bc05bc0f382444c400328d91c085fa7516da209cd01717f01ef09a7e3588246200e9ca18e0ebc065c02980229244840a7c0ebc043c07ec1349c400529d0ae072fd9a27953eae66f029f0b47eb58924620029a3a1deacbf5e7fdbe78a2409c5adb70a1ed7bb0b12c031601209a26628f00bb4a9ae77f4b7be54fec493ab6bfd8eaefd2ff4b210c40092c24ce009a00eb81f182f9218c678bd0ceaf432992992880124aa997f3eda54d506e04ac02ab2a40c56bd4c36e865743e32fe220610a7c0ba16d80cac00168a2429cf42bdac36eb6527462d061055c5bf1ed809fc19a81649d28e6abdec76ea652946200610961e5700db80c7d036db08e9cd58bd2cb7e9652b312f061094f3d036ae3c890cec6522e3f5b2fd522f6b410c008009c0ebfa3543e4c87866f428ef496200d94b19f01bb4dd69f246c8ce16df263d06cac400b20705f82eda22929f03395217b2961c3d0676e931a18801643693d0968f3e8a96324b10d063e151b4edc893c400320f0b702bda00d09912ef423f9c016cd463c5220690199c047c01dc43df449882d09b3c3d56be404bcd260690c66ffd5f029f01c74b5c0b11723cb05a8f218b1840faf5f55703cb91bc87426c2f91e57a2c4d1603480fbe9d2dcd3721699c8c96d1f85a3180d4a5086da5d75ff5df0b42bce3ebcf7a8c158901a4165380b5686bbd0521915ca1c7da543180d4e0eb7a814c91d81492f8c259a3c79e1880419881fb8067a4c92f18d4257806b897d43db529630da0187815b819c9fc22188702dca2c762b1184072180d7c022c95f8135284a57a4c8e1603482c27a31d1621db76855463861e9b278b012486f3d036f2480a68215519aac7e8123180f87215da597132d827a43a45fa98c0556200f1e147c0df9025bd42fa60d163f6c76200b1711bf03032d22fa41f0af03b3d86c500a2e06efd12847426a5e338550de0fe54774e4188b0257bbf184078fc0aedc04741c8247ea1c7b618400896037748ac0819ca1d7a8c8b0104e106b4ec2b8290c9fc126d664b0ca00757a08df60b4236f03b5264eb7a2a18c07968891664aa4fc816143de62fcc760338057811399c43c83e72d0b6139f92ad0630126dc96481c48290a514a02d711f996d06500aac02aa2406842ca752af0ba5d9620026e0efc8965e4138cc0ce0090cc82c648401dc095c24652e08c7702106ac1148f60ebb0b90853e7147f57b71b5ecc5dd5a83bbad0e4fc77e7c8e56bcb656549f1bbfdb76e4b38ad98a29a700734e01e6fc322cf965580a2bb01655622da9c25a3c046bc950ac85834089ffc48ccfde86bd7123f6fa2f71346e64f8c21b29183e5d0a51e30eb404b72b32d10026a0e55497e9be986b7c00c7fe2dd8f6adc5b17f33ce433b51fddeb0cdc2efecc4efec84cea67e3fa7982d588b2ab11455622daed2aea24aac458331179461c92bc1945b84c9928b62b61ef97f7eb70d027e7cce4e7c8e36bc5d0771b737e06ed98babb5069fbdf598fbb46dfca718400fd9f53a7232b03b930ca00078d9a8818e4ca9f4b6fa0d74ee78075bed1afcaeee04b72a7c783a9bf08430897860ab5d83ea73a35872a58c354a819780530147a618c0a380d87c14786dcdb46f5a49c7b67fe1b3b765dcf70bf8dcb85af6923f74aa14f65166e875e6ca4c30806b90137b22c67568172deb9ea16befa7a00632fabbbadbeac400fa7205f036da5177696b009381ff96b20c1fe781ed34af7912dbbeb559f39d7b0e520ac7f07bb4938977a4a30158d1e63625916718783a9b68feec6f74ee7c1f50b3eabb873b80998514ea75683ee04d3703b81d982d653850f07b6859f72c2d5f3c9bb515c164cd9340e89fd97a5dba339d0c600e70ab945d68ec0d1b697aef77783a1ab35a0773ae341207e0566025da81a4296f0039c0e3481aeffedffa3e37073ffd0b6d1bff9975cdfda00650502e4131703dfd337012e08e6beb2b010f7b1bb2cebf5fdcadb5ec7df606da36be2c955fc75a384844189869896855c7db00a6a39d962a04a163db9bd43cf763dc6d7522868e62b69053365284088f5b88f37a9a7836d315e07fd046ff859e4dfe809f031ffe91f64d2b448c5ee4574d46314b6f31dcc6925ec74e8b57f3319e2d80ef02f3a48c8ec5efeaa6eed5dba4f2f743c9a405224264ccd3eb5a4a7501ca90537cfae0b3b550fbd28dd8eb378818fd503446668aa3e06ebdcea58c012c47cb6c22e8b8dbeba979e167b85b6b458c10d4af588ea7a34184888c4ae2943b201e0630052da7bf70b8f2b7d5b1efa5ffc4db7d48c40843abbdcffe98ee9acf448cc8b841af7b861bc06f9081bf632bffcb37e173b48b186112f0d8a95f7117cd9f3f01aa4c8d868955af7b861ac079c0f952161a5e5b3375afdc22953f2a549ad73c49dd8ae5043c7691233cce07161b650026e04129030dbfb3937d2fdd84d7d62262c480ad760d352ffc1cafad59c408bf056e32c200ae40927c68ef2ebf8fba15cbf174ee1731e2d18d6aada1e6b99fe06ad92b620ccc7462c8b711ad015891833c8fd0f4deffc37960bb0811477cf656f6bdf49f389ab68a1803f34ba21c878bd600be0d8c13dda17df34a3ab6bd254224a25be5b651f7ca2db28e6260c6e9753229066041b6fa6a4dd5b63a0e7cf888089140025e17f52beec4deb051c408cdad44b1b43f1a03b84adefedafafec6371f40f57b24f4126d023e37f52b96e368da2262846e055c9d680350801b456b68fbf2455ccdbb458824b604ea5ebd03776b8d88d13f3f27c273372235807381ea6c57d9676fa379cd53126ec936018f9dba576f97a9d6fea9d6eb68c20ce026d1189ad73e45c0eb12210cc06b6ba17ec59da83eb788119c9b136500b380b3b35d5d4f47231d5bde9030331057f36e9adeffbd08119c057a5d8dbb01fc4cb485e6cf9f400df8440883e9d8f626ed9b578a10c1f98f781bc010e09bd2f76fa36bf747125e29c2c18f1f95adc4c1f90630349e06702db2e38ff6cd2be5ed9f4204bc2e1adf7a30e38f4e8b022bda917c71310005b82edb1555fd3edab7ac92d04a319c07b6d3fae5cb22445fae238c29c1700c60013021dbd5b4d57f9191a7f36602cd6b9e942dd87d99401883f6e118c077454be8def3898890aa5d018f83831f3f2642046f05c464008380cbb25e463580ade67309a714a673e7bbb8dbf68910c772995e87a33680af03b9d9aea263ff167cce0e09a794366995e6cf9f141d8e2557afc3511bc0b74443adff2fa43e5dbb3f92539782bfc4a332803168e792673d8efd9b4584f46806d0bee93591e158ce20c49a805006b08c087716656affdf7570a784519ad0b1fd2d025ea708716c1d5f168d017c4db403777b0301d9789236043c4e59ad194137a03f0318099c22ba21fbcfd3712c60d70722c2b1ccd3eb74d80670a134ff353c1d92e937ddb0d77f89dfd52d421c5bcf2f8cc400ce15cd74039054df69871af061af93999b5e2c0ed700728085a29786cfde2a22a4632ba0f12b11e158ce21c89a9e6006301f2812bd74039005407161e1a9a330294a120d40b208f7a2481f0b18d000968a5647f13bbb448418195e59c86f6f3c8d3fdeb680b2e2e42c2cf5b437c838405fce0fc700168b4e3d0cc0e3101162e45b4b266152144e9b358c67ff6b3153c79527e5be3283d3877307328021c00cd1e928aadf2b22c4d2ee2cb0f2b585e38ffc794455114fde772e172f382ee1f776b5d64a011ccb0c7aad0aec6d00678a46bd0d400efe88856b2e9a4a7161ce317f976b3573cf8f4ee58e7f9b4d8ed594b07b7b3a1aa500fa724628033843f411e245554501dfbe684abffffe8dc513f9cbaf163264504142eeef93f3038271662803384df411e2c52fae3d91fcdcd0c7d59d3069302ffc660973a60f89fbfdbd32851b8cf9fd194011da59e3821033e79c328ac5f34687f5d9f2925c1e5b7e36d75c3c9578ce144a9ab0a04ca7c7347f4f033811308b3e42ac9416e570c7bfcd8ee8ff98cd0a375e3d8b877e7e1a057996b83c87ec0a0c2e35303b9801cc116d84585114b8ff27f3185c9617d5ff3f77ee689e79e03cc68d2889f95954bfa470ef8793fa6b0108424cfc60d90c4e3f71784c3fe3b891253cfdc062169e3a2ab61680ace1e88f138319c02cd1458885b3668fe4fbcbe2338c54946fe5ffde783a3fbb72262653b40303aa144a7066f536807c60a2e82244cbf11307f1e0cfe6c55059837727aebbb49a47979f457949ae881c3f26ea75fe88014c41060085289932ae9c476e3f8bbc5c4b427efea93386f2dc83e7317dc220113b3e98f53a7fc400aa4593e8b8f1dbd9dd739a3171107fbaeb1c4a8a72127a9f61830bf9fbdd8b58b66882045d7c98d6d300a6891ed171cd4553f9e9953351b2307fd2ec694378fcceb3294d70e53f4c8ed5c49ddf9fc3affffd1472add2608d91ea9e06305ef4889eeb2fade6973f3825aefddf54e7d2b38fe37fee388bc27cab01f71ecf13f72c627865a1045ff48cef690032001823979d333e2b06abcc66859bbf7312bffef75313ba9167c0d7d7f80a9e7bf03c09bce899282d80387378b0eaa4a95519f9fd460e29e2afbf5ac895e74f4e89e7495672914c6f01940125a2477c1836b890bffcea1c7e7ae54c727332a79f7ac959c7f1c2434b9835a5520a39332801ca2cc068d122be984c0ad75f5acdb9734771f7a3ebf8746353da7e97b1c38bb9edfad9cc3d61a8146ce631da028c121d12a4eed0621e5d7e161f6f68e2377f5bcfeefaceb479f6a2022bd75d52cd35174fc56a3149616626a32c84383850880fa7cd1ac6bc994b796b753d8fbeb8851db5a9bb4db520cfc2b7964ce2da4baa9336bd2718c650318064750b1485c5f34673eedcd17cb6e900ff58b5930fbe682410488df5ea5515057c63f104962d9a4045699e145816194095e8903c1405e61e3f94b9c70fe5509b93d73ea861c587b5ecaaeb30c4944e993184cbce19cfa2b9a3b098a5a99f65545a0019d635ecad9bcf75975673dda5d5d4eeefe2edcf1b58bdb189f5db9af1fa0209b967aed5cc49d5559c3d67240b4f1d15f5be7d21730ca04c74309eb1c34bb8fed26aaebfb41aa7dbc7e6ddad6cd8dec2d6bd6deca86da7f1a09d801a79776144551153c695336d7c05274c1accccc983336a7a52888972318014243fd7c2ec6943983ded68a24cb7d7cffe4376ea0fdae8e872d3deedc6e9f2e1746b596f8af2ad582c264a8b72185c9ecff0ca42865716c62dbd96909194598062d121f5c9b59a1937a2242ea9b20441a7c884ac0214846ca5d404c82890206469c3d2429033c385e00cabc863c9ece1cc995cc171c38a282f96853246b3fa778b38d8eea2a9cdc9da9d6dbcbe663f4d6d2e11263cf22c808c120dc0d0f23c7e7cc92496cc1e96557bfed381825c33e38616326e6821f3aa07f3a38b26f2fada261efee74e0eb48b110c80c502485685109c3ebd9207ae3f8142194d4f0b4c2685f34f19ce99c75771f39f3622878385a450967e856051c5461efee18952f9d390a27c0b0ffff04416567c2562846a028804c1995954c33543dfc36450b23faf2fc073ffdac5aa8ff71d59263c714c19179d398ecbce199f723bf4bcbe002fbebd87d73eac61d73efd794797b1f4b4317c7df144439ed76452b876e8bbb47a8bd9d03d4e823a08cac50fab727a422f2aac361e1cff770accee013f6baeac88fbfd0fb539f8e1bd1fb0bd26f8aec129e3caf9e3ad0ba8aac84f09bd0eb539f9e1bdef0ff0bc67525511ff63c0fdcd6d037ec6e1cfe53ff75c4d9bb74882bbb74902727e522f2eaffa38acca9f083cde003fb8a7ffca0fb0bda69d1beeff008f3760b8561e6f801bee1ff8797f708f71cf5b607673f9908f24b0fb6237015ed1e12883adddcc2ddd61d8fd9f7f6b7758f902b6ee69e3f9b7761baed70b6fef66eb9e81dfc23b6adb79e16de39e776ec94e065bbb25c08fc56702dca2438f4029dd815931eecdbaeaa3da847c3651acfcb036219f8d37662560a8b1a7282e132093a53d985e5867e8fdb7ee6d0bfbb3db6ada0cd72b92e78de4b39958b62988db0474890e471995973e33c7e996c0c3e8998b742adb24d16902a463d48322b3d3d0fb4f1d571ef667278e2e335caf489e77c2a852439fb5d8e0b24d416c26a04374388ad10b7d979e3e36fccf9e36c670bdce8fe47923f8ac90143ac4007ad1e533766e7dd9b913c2daf33f714c19cbce35fe44b765e74e64d298815b22e34694b0ecdc09595db62948bb0968161d8ed2e836f60cfa5cab99476e3f8b89212ad5c431653c72db0243cfe63b4c8ed5c4ffbf6dc1c0cf7bfb59869fe86b74d9a620cde6294bee3a09385bb4d028b7da985114fe68b1a930fe6f9592c21c2e3dfb380695e4d165f3d065f762b5989836be82ef5c3c95bb7e700a252994b3bfa8c0cad7ce194f45492edd762f5d360f568b89a9c79573dd25d52cffde9c841d9aaa3ac2efd7bfdb3e831d8e1112e44759a15cfcb07a1df0b868a15169ede27793fe8c42782ba413b11458089f70960203a828fc64e77768f64a02ac1e5c6f020e880e3dda44de1256774e1221328cd59d93a4f2f7e58009a8171d8ee5e983a7e30a5845880cc115b0f2f4c1d34588bed48b0104a1c55bcca3fb1721db24d31f15786cff225abc92fc3a087526a01d590d18a4c93899270e2c40455280a56fe55778e2c0023eed9c2c62f4a50b7d1d00c05ed1a32fafb7cee2a1ba0b710624f967bae10ce4f050dd85bcde3a4bc408ce1ed0f20100ec143d82f345f7786eda7d359f764e96d6401a1050153eed9ccc4dbbafe68beef12248ffec82a329c1f6881ea1c704febb61294f1f3c9df9a5dba92eac67646e2ba5160772ca9eb1f855139dbe021adc83d86a1fc5eaae491cf2948a3061b6000e1bc056d1233c2378a56536afb4cc3ef277cf55fd4d8431902bb7fe4444888ead3dbb00620082905d6ce96900db8180682208d9d173d2ebfc110370200381429ae10dc8084c94ec029c3d0d006083e812392ebf1cad60141e318068f9f2f06f7a1ac07ad125729c3e5923609cf6b25c3b4abe0866006b4497c8e9f2cae9ea4661f7c9c1d651b2a63f03f0883691d1e6912c33a27d7af59c7a1a40cf0eac4b6f1acc158dc2e79033bd3699f85bdaa1bfd3e01405f3e072d13eb3594f8fa3007ae794fa54f4898c46477aad3a5372ac51fd9b689f317cd2f30fa650ff280c4c9dbd3cad9ed754980fc14e3c569484a43713edd3cb003e167d22a3d6569e5e7903cc66cce52528b9399a11280a4a6e0ee6f21230a7cfb49aaa2aecb38901c46a00bd27b19b814dc00cd1293c1cbe1ceaede58c2e6c4f2b133095a4f751d90d8e52ec32051b299b8143a15a00006f8a4e91b1ada34a4448325b3b86880891f3af3e5dc2201f5a253a45c657edc34504d13c1d58158e017c02d844abc8825196a5260f6fc0cce6f661224464d80832c81fcc00dcc03ba257f8b8fd1636c91b2989863b0ca75f960147c8bb7add1ed00082f61584d07c78f0381121497c2c5a47c31bc1feb23f03780d242b7624ac6b1985cd9bfcb5e9aac787b7a103cfbe3602ddee84df2fd0edc6b3af0d6f4307aac797fc76ac3797352da325e0222c36bd4e876d000dc8e6a088fba5ef1d48fee9b7fe3607aad70f01155f8b0dd59db84aa9ba7df85a6c105051bd7efc6d0e435a5a920720623ed5eb74d80600f0a2e81619af374ec5af1a9b39d8d7ac55d0f8bf4354ed671b885f5578a371aa045ae43cdfdf3f843280e7a41b10192dae423e6b1e9bd47b9a4a8f5dbeab7afdf80e75c7b7e454f01dead65a1a3d30972577e9f067cd6339201b80a269fe476500fb90bd01915b6ded09496d0598f2ad988a8fcd4910707af11dec8a4f4b20a0e23bd845c0e93db6f297e4a1e4256f24deaf2a3c573b53022c8a5e13d0148d01003c23fa45c67e47291f1d4cee811496410528b9963e26e0dddf89eaf2c6d4e7f7eeefec53f94df956cc158549fd8eef344da2c921a7fb46c173215f206118805b348c8ca7f79e98dc74558a827548314a8eb94f77c0dbd485afd9d6a7f91eb2e27bfdf89a6d9a81f4fa7f4a8e194b5531c93c24c9e5b7f07ced09125891e30ed5fc0fc7005a819744c7c868f7e4f3c2be2407acd984755829a620cdf280cd8db7a1036f5317fe4e27019717d51fd01283a82aaa3f40c0e5c5dfe1c4dbd485b7a18380adafef9bf2ac5887958229b9039dffac9b41a764ff898697809690adc7307ec8e3c0e5a26564ac6aa8667e550dc715b726efa62605cbd012fc6d76fc5daebe6f7697177f945d0273691ee6f242927d3c62adad8257eaa64b4045c79f060c99307ec87bc06ed13232fcaac21fb69f96fc396b05cc830ab10e2b45c9893d65b99263c13aac54ebf32bc9d6d0c41fb7cfc7af9a24a022670fdaf2df980d400dc74984bed4dbcb7872cf4986dc5bc9b3601d518a654871d06ec180819167c532a418eb8852943c63ce3ef8c7de13a9b555482045c7e38431191c6ec9fe15f815203b3022e4f5c6a94c2d3bc8a995fb0cb9bfa9200753410eaa3f806af71070fb503d7ef00750f56942c5a480d9849263c6946b4129cc41311bfbd65ddb329a15f5d32480a2c3a7d759e26500078067812b45dbc87964c73c861774199a3548319b504af24887c67483bd8c3f6c9f2fabd0a2e759bdce0efc8288e087fe56748d0e872f87fbbe5a48a7470e1119882e6f1effb5f96c1c92ee2b161e0abb8518c10fdd00bc2fda4647abbb807b372d94c00e81d36fe5814de7c872dfd8789f08cef98cb44578bfe81b3d35dd83b8f7ab85b8e540d13eb8fc16eefb6a21bbba068b18b1f140241f8ed400de04b68ac6d1b3b3ab92bbbf5a24196d7bbdf9effb6a21db3b25b96a8c6c25c2643e911a801a49ff4208ce8ece2aeefa72b1ac6e033a3cf9dcb5e13cb6754a96df38f5fdd5441a00c0df811ad13a36f6d92ab865fdf9597db84583bd8cdbd62fa546e6fae3d2c3049e88f43f4563003ee05ed13b765a5c85dcb161299f378fc9baefbeba792cb7ad5f4ab3ab4802213edc0744bcce5bb9f8e1a8665badc00e609ce81e1fce1bb19dabc6afc36af267f4f7f406ccfc63ef89ac6aa89679fef8befda7a01dfd9df01600bad3dc29bac78f371aa770ebfaf3a9e91e94b9516aabe0e62f2e60a554fe78736734953f9616c061f3d808c856ad386256542e1cb599ff3376233919d21a70f92dbc5c773cafd64d938d3df1673370025aeaafa41a00c012e428b1843038cfce15c77dc1bcaa1a9434fd0e2af0e9a1713cb5f7245a5c8552a8896109fde4fc4f860100ac04964a392486d185ed5c3a762bf3ab6a404d9f16c1c6f6513cbdf704f6667097260558095c10cb0f88477bece74431fa28842610004737acdf5dcefacef958a77c0d73d5f160c94ddd87564c984ac7609d70011fb69ecd9a9d8370746bdf45883b5ee0c6587f483cd6a46e07fe00fc54ca24c626b30a0e1bd8bbc065d7fe0cb0e424502cf99887ccc25c398340c71efc2ddb50dd9da951ef738a31554cc4543e01c5927fe4999f7c47fb2e8a02798550580c05c5da9f8598f9835ef7622bbb38740100ca809d40a5944be4b89c60ef047b37a8bdde9615c5f0f6bdc12a8d8a77d73b04daf7a0e4e440b2f7ef0702a86e0fa6f2f158279e43ef7441aa0a8b6f87e6ce3e8d040a8ba1b014f2642164b4340393808e546801a03fc81dc023523661beed0360eb82ee76f08698c0993db1bf37a602a63c023607e040b198c16a45b15a50ac163099e25fe1bd3e54af0fbc5e549f361e611a9447b05c618a02b327c1aab541be77a7765973a0b81c8a4a346310c2e68e7854fe781a00c063c0d5c03c299ffef1fba0bb43bb02618ce9cd0873a995eaf383cf8fea3c3cba63d24cc16cd6b2fb984ddadf29262dab6f4f57d1b303a3821a08689d767f0035a0670ef2f9a3eac8578fee6b00c774623dd076103a5aa0b84cbbccb25172203ed5eb1aa9660001e07bc07a247558d08adfd9aabdf9d4087a5d63a2dd201708a07a0280d7b0453763c3dcdf13f06bda74b5415129940e1223e8cf3381ef13e59c7f30e2ddf0da8ce40ce813dcedcdd0b8577bebab11d6c63169bc437674842342aaaa69d4b817da0f85d742ca321e0436c5f30726a2e7750fb025ebfbf8aaf6466bdcabfdaa46f91aae48e3e438d13ebbaa42577becda65185bd012f392ea06e006be83b66b302b71da617fadf6e68f750ebc30541ac154984f0bf10c8531a6400c04340df7d76a9a66730f52af53ee743000803564e19661bf1f5a9ae05003f83c49a87b66e3b30a857a066f9c9af03e8fa6694b9336969285dcabd729d2c50000ee06d6664b09d9bb607f8df66b5c7fae2b44e5cb317e7dbd9253d0efbf395c09d0b8561b48cd22d601bf4ed40f4fa40178d1a60533baf116f043f37eeded948841abb6ee1095afc0f86c42a19ea1cb9118bd5b0f689a67c120a11db88a042eb54ff4f28bedc00d995a3a2e87f646727427ee1efb0e8528bce24a3019385f66b2602aee7f9aa2ae3971b776746bdabb1c196d00371087e5be461a006847143d9d6925d3d50607eb13df270d6500982c98cb471aa681b97c644803aa3d98d8fbfb7d5a1974b66564e5ff07611eef95ea0600703dda1a81f46ff207a0b9511b9d4e069b0648bf6a1e32c5380318e0dedbea92f31c1dcd5a9964d0aec3cdc07793d2884bd21772009701693d7ce3f3c2813a6dc75eb258bb2bf43cb8b96a124a6ef2136b2ab94598ab26f5fbefaa0a6b7626ef791c36ad6c7ce9bf31bd53af2b8e4c3200805dfa80465a2eeb70bbb400f3ba937bdfb66ed8561faa04cd58c6ce49ba1e96b173c064eef7dfb7d7f7dd099868bc6ead8cdcaeb4adfcaa5e477625eb86c9de83f51a099cd248144e7b72fafbfdb16a80c954cbf0e3311527ef600d53c9102cc38f0ff999d7d719a3d5e17181345d38f46bbd8e90a90600da72c615e952220e9bd6bf540dec5fae5c0bee504d5b452167da1248c6c2204b0e39d54b43ae00747be1b535c6e9a5eae334899c9d4944319380a5bea968007ee04ae2bca92111d8bbf4ca6f70a7a5c306afac1ea04f5e504eceb4f312bb3cd8642677fa05280565213ff6ca6aed990d6d4babda5a81782fcc4a109b802bf4ba91f1067078a0e302b4cc26a9f9e6efd616f7a40a8fff0b1c038c3f98078f2767fa0521fbe6d1478a859ce9e763aa087d8a91c3ad3d6baad0d294f22d8166e0420c1a2037320f4b9dfec5536e2987d3965a951fb401b5475f1ff873e6ca09e4cefc5a5c670694bc62724f5c8679f0f8013ffbd8ebc91ffc0bc7049cb694acfc0ebd0eec33ea018c4ec4f43970b9114d9ffe7039a0b92935b7a03ef51e6c6f08a350cb46903be72a2cc3a7c7d62550142cc367903bfb4a4c254307fcf8f60678f2bdd4d34d55b5324db1d901bf1efb9f1bf910e6294bee325a881d68679b5d02c69e81e1f5c0a17a6307fc42115061ed0eb8e854c8196005b062b6601e3c1e73e504f079509dede1bb9ac98cb96a3239d54bb00c9f8e12467a1ebb0b7ef87b684fcd372da85a2ba0a028313da4c89f866b80e78d7e907865058e073f021e36ac72f9a1a92e39db7863e5cc19f0dbef4696f753f5b909b4d61068af27606b467576a1fab44105c5928b925f82a9a81253d9284c83c7a14470fe402000fff1187cb029f5b5b3e4c0b0d1869bc04f8c8cf554350080e5c02f8db8f1a186f49a3b5e763adcfa8dd478967b9f85e73f4a1fedf20ba1cab82d14771915e3a9da05e8c90768894acf48e64ddb9bd366bae8085beba0a5134e9b665c62a04000ee79065ef838bdb4f379b5de507ef2d329dc4d8a9daa9d6a0600f01e900f9c968c9b396dd07688b4645b3dec6ad44c2027c9bb821d6eb8e5af03af524c55dc4ec8cdd3ce2648120f00b7a59a0ea97a1cc3cd68c945138adfa725974867defb0abef54078b303f16267235cf520bcbb31bdb56b3d90b4e5ddf7e8319d72a4620be030efa225163d3b513768d90f1e37694fa7035e5d0d6e1f9c701c581234c0e5f6c223abe0ce27a0b53bfd755355adfc8b4a137a9b3bf47e3f620091f311d00e9c479ca7086d1d5aeae94c21a0c2863df0eae79a50134780354e46e0f2c08b9fc04d7f868fb768f7ca147c5eed1092dcbcf8fb0bf033b45cfe294baacd02f4c7d5c09f88d349467e9f96c033938fad2e2b820be6c0d29361caa8c8070a5555dbd2bb6a1dac5863fcdafe84f6834d307c5c5c4f23f201d7017f4ff5ef9e2e0600b014781688798d6b736372937a18cda062387912cc180be386c28841505e0405fa54bfc3ad2de0696c819a83b0a916d6edcc8c667eb8141441e588f8342e816f00abd2e17ba79301009c8cb69538eacdef4ebb36e72f08bda91a19f3d4e041b4b5fd693337926e8732af034e21daadc4aa76e69c2004a3fd10b1e4abda049c4a9a9d85918ea7b2ef03e647d3c4eaeed4d6fb0b4230bc1eed70d22858a5c7646dba7d67539a9655377011dae28ab03c5b55b523a80521149d911d46aaea3178911e938801240f3fdae28a6fa20dbc84768c8eac3d574e8824a87c61b7026c68db796f2685b6b36793011ce6397d5c607ba8b77f579b04b7101e5dad03b602b6ebfdfd67d3fdbb9a32a4ccb602b381a782fda3bd4bdefe4204ad007fc8cd614fe9b1b62513beab2983cacd86966cf43bbdbb04f2f617226e05f48d19bb1e5b5786d3e51403308ebfa0ad175807dabcbf8cfc0b91e2f51c931f629d1e537fc9b4ef69cad0f2db01cc037e6deb441aff42744dca0e7c688775cc23c1a7f48a0124c0c4fd7e963b6dcc03be92701622e42ba79df97e3fcb016fa67ec94c36001c5da0aaacd59b6fb7012e896b61005cc0edc0c9aaca1a4757667fd98c3600fbd1a5195ee05e6026f0a1c4b8d00f1fea3172cfe1b7bebd5b0c202df1fbb4b44f41c6061600df035a24de059d163d2616e8317204b733b3a79033d600426cf75581478189c04380cc11642f1e3d0626ea31a146184b6200a94a184741750037ea4dbe37a42e641d6f00b3f418e8883196c4005209550ddafcef8f6dc012fdda24f522e3d9dca3bcb786f31fdcced43c2a4e0ca0bf769d2baa745f6fe8ad81ab80bd524f328ebd7ad99e10698b2f10d0624a0c204d70457fde7000781298025c8f7666a190ded4e86539452fdb4092634a0c20e92d80d8537d7bd192904e465bffbd55ea51dab1552fbb497a59c6b498475a0069d60588135eb4f5dfd3810b80b7a55ea53c6feb65355d2fbbb84ce265c2f9115961007ebf96eb3dcea8c04a6011dac8f19364f0f2d034c4ab97c92cbd8c56124b76bf20f8bc5a6c8901a4384938defb4bb4c1a4d168d960f648fd338c3dc02d7a595ca5974d3ac7961840ccaf82e415d201b47c70138185c033805bea64c271eb5a2fd4b5bf5f2f8b4c8aada461c9b42fe44b7ec35c05ded1af416879e22e07e612e7e3ccb21815580d3cad57fe962c892d3180342ba456e0f7fa351658065c8696b350cc20f24aff39f012f03c2990725b0c200d48a1819a5ab483211f0446a2a58ebe106dc3499ed4efa0b880f781d7f4ab5e624b0c202202a9b973ab01f8a37e150267a18d562f02a66679a5df06bca55fefa1e5de93d8120388b29052dfa5ed68e71baed0ff3c541f2f988f967aea64c09aa195dd0b7c017ca25fab49d2009eb400b2c500d2efc8ef03c0cbfa0590af9bc0a968f3da33d156b399d3ad3706ec449b9adb007c86965cd399aeb1a506c40084c4e3043ed22f7a98c254a05aff751cda20e338bd05612407d136dad4a2adbbdf86b60c775b3a57f66c415a00e9630aebf5ab37f93d0c6128da5464a5fe6bcf2b1728455bfb51d2ab45e1e0e81a860eb4117837daac46cfab59fff5408f0a9f35953c1363eb7f07001b578c23326615320000000049454e44ae426082, NULL);
INSERT INTO `user` (`iduser`, `username`, `password`, `name`, `role`, `email`, `photo`, `info`) VALUES
(2, 'RadmilaSosnova', '', 'Ing. Radmila Sosnová ', 'kontaktní osoba', 'RadmilaSosnova@veletrhpovolani.cz', '', ''),
(3, 'JaroslavProkop', '', 'Ing. Jaroslav Prokop', 'kontaktní osoba', 'JaroslavProkop@veletrhpovolani.cz', '', ''),
(4, 'CtiradSkopal', '', 'Mgr. Ctirad Skopal', 'kontaktní osoba', 'CtiradSkopal@veletrhpovolani.cz', '', ''),
(5, 'IvanLuger', '', 'Mgr. Ivan Luger ', 'kontaktní osoba', 'IvanLuger@veletrhpovolani.cz', '', ''),
(6, 'CharlottaGrenarova', '', 'PhDr. Charlotta Grenarová', 'kontaktní osoba', 'CharlottaGrenarova@veletrhpovolani.cz', '', ''),
(7, 'ArnostKlein', '', 'Ing. Arnošt Klein', 'kontaktní osoba', 'ArnostKlein@veletrhpovolani.cz', '', ''),
(8, 'MonikaKlapkova', '', 'Mgr. Monika Klapková', 'kontaktní osoba', 'MonikaKlapkova@veletrhpovolani.cz', '', ''),
(9, 'PetrKyjovsky', '', 'Ing. Petr Kyjovský', 'kontaktní osoba', 'PetrKyjovsky@veletrhpovolani.cz', '', ''),
(10, 'JindrichHonzik', '', 'Mgr. Jindřich Honzík ', 'kontaktní osoba', 'JindrichHonzik@veletrhpovolani.cz', '', ''),
(11, 'RichardVeselsky', '', 'Ing. Richard Veselský', 'kontaktní osoba', 'RichardVeselsky@veletrhpovolani.cz', '', ''),
(12, 'MiladaPazdernikova', '', 'Ing. Milada Pazderníková', 'kontaktní osoba', 'MiladaPazdernikova@veletrhpovolani.cz', '', ''),
(13, 'ZdenekKlein', '', 'Mgr. Zdeněk Klein', 'kontaktní osoba', 'ZdenekKlein@veletrhpovolani.cz', '', ''),
(14, 'SlavkaKrystova', '', 'Ing. Slavka Krystová Florková, MBA', 'kontaktní osoba', 'SlavkaKrystova@veletrhpovolani.cz', '', ''),
(15, 'JosefGabrhel', '', 'PaedDr. Josef Gabrhel', 'kontaktní osoba', 'JosefGabrhel@veletrhpovolani.cz', '', ''),
(16, 'JosefZemek', '', 'Ing. et Ing. Josef Zemek ', 'kontaktní osoba', 'JosefZemek@veletrhpovolani.cz', '', ''),
(17, 'LenkaMetzlova', '', 'Ing. Lenka Metzlová', 'kontaktní osoba', 'LenkaMetzlova@veletrhpovolani.cz', '', ''),
(18, 'PavelAndrys', '', 'Ing. Pavel Andrys ', 'kontaktní osoba', 'PavelAndrys@veletrhpovolani.cz', '', ''),
(19, 'MichalDurec', '', 'Mgr. Michal Durec, DiS', 'kontaktní osoba', 'MichalDurec@veletrhpovolani.cz', '', ''),
(20, 'JanaKypusova', '', 'Ing. Jana Kypúsová', 'kontaktní osoba', 'JanaKypusova@veletrhpovolani.cz', '', ''),
(21, 'MiroslavWeisz', '', 'Mgr. Miroslav Weisz', 'kontaktní osoba', 'MiroslavWeisz@veletrhpovolani.cz', '', ''),
(22, 'PavlaHostasova', '', 'Ing. Pavla Hostašová ', 'kontaktní osoba', 'PavlaHostasova@veletrhpovolani.cz', '', ''),
(23, 'JanaChlebovska', '', 'Mgr. Jana Chlebovská', 'kontaktní osoba', 'JanaChlebovska@veletrhpovolani.cz', '', ''),
(24, 'JanMeca', '', 'Ing. Jan Meca ', 'kontaktní osoba', 'JanMeca@veletrhpovolani.cz', '', ''),
(25, 'JiriKalicinsky', '', 'Ing. Jiří Kaličinský', 'kontaktní osoba', 'JiriKalicinsky@veletrhpovolani.cz', '', ''),
(26, 'TomasRezab', '', 'Mgr. Tomáš Řežáb', 'kontaktní osoba', 'TomasRezab@veletrhpovolani.cz', '', ''),
(27, 'KarlaLabudova', '', 'Ing. Karla Labudová', 'kontaktní osoba', 'KarlaLabudova@veletrhpovolani.cz', '', ''),
(28, 'VeraPredikantova', '', 'Ing. Věra Predikantová', 'kontaktní osoba', 'VeraPredikantova@veletrhpovolani.cz', '', ''),
(29, 'TomasFuhrer', '', 'Ing. Tomáš Führer', 'kontaktní osoba', 'TomasFuhrer@veletrhpovolani.cz', '', ''),
(30, 'MartinRusky', '', 'Mgr. Martin Ruský', 'kontaktní osoba', 'MartinRusky@veletrhpovolani.cz', '', ''),
(31, 'DianaVolejnickova', '', 'Ing. Diana Volejníčková', 'kontaktní osoba', 'DianaVolejnickova@veletrhpovolani.cz', '', ''),
(32, 'Miroslav Trefil', '', 'Mgr. Miroslav Trefil', 'kontaktní osoba', 'MiroslavTrefil@veletrhpovolani.cz', '', ''),
(33, 'MarcelaHanakova', '', 'PhDr. Marcela Hanáková  ', 'kontaktní osoba', 'MarcelaHanakova@veletrhpovolani.cz', '', ''),
(34, 'VitezslavDolezi', '', 'Ing. Vítězslav Doleží ', 'kontaktní osoba', 'VitezslavDolezi@veletrhpovolani.cz', '', ''),
(35, 'AlesZouhar', '', 'Ing. Aleš Zouhar ', 'kontaktní osoba', 'AlesZouhar@veletrhpovolani.cz', '', ''),
(36, 'StanislavZapletal', '', 'Ing. Stanislav Zapletal', 'kontaktní osoba', 'StanislavZapletal@veletrhpovolani.cz', '', ''),
(37, 'JosefVondal', '', 'Ing. Josef Vondál', 'kontaktní osoba', 'JosefVondal@veletrhpovolani.cz', '', ''),
(38, 'PavelZubek', '', 'Ing. Pavel Zubek', 'kontaktní osoba', 'PavelZubek@veletrhpovolani.cz', '', ''),
(39, 'JanaKellnerova', '', 'Mgr. Jana Kellnerová', 'kontaktní osoba', 'JanaKellnerova@veletrhpovolani.cz', '', ''),
(40, 'TomasJavurek', '', 'Ing. Tomáš Javůrek', 'kontaktní osoba', 'TomasJavurek@veletrhpovolani.cz', '', ''),
(41, 'JanaFoltynova', '', 'RNDr. Jana Foltýnová, Ph.D. ', 'kontaktní osoba', 'JanaFoltynova@veletrhpovolani.cz', '', ''),
(42, 'AlenaSimeckova', '', 'Mgr. Alena Šimečková', 'kontaktní osoba', 'AlenaSimeckova@veletrhpovolani.cz', '', ''),
(43, 'SosVeterinarni', '', 'Sos Veterinarni', 'kontaktní osoba', 'SosVeterinarni@veletrhpovolani.cz', '', ''),
(44, 'MichalPospisil', '', 'Mgr. Ing. Michal Pospíšil', 'kontaktní osoba', 'MichalPospisil@veletrhpovolani.cz', '', ''),
(45, 'MiroslavBucanek', '', 'Mgr. Miroslav Bučánek', 'kontaktní osoba', 'MiroslavBucanek@veletrhpovolani.cz', '', '');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`idarticle`),
  ADD KEY `title` (`title`),
  ADD KEY `edited` (`edited`),
  ADD KEY `fk_article_users1_idx` (`author_id`),
  ADD KEY `published` (`published`);

--
-- Klíče pro tabulku `article_has_category`
--
ALTER TABLE `article_has_category`
  ADD PRIMARY KEY (`article_idarticle`,`category_idcategory`),
  ADD KEY `fk_article_has_category_category1_idx` (`category_idcategory`),
  ADD KEY `fk_article_has_category_article1_idx` (`article_idarticle`);

--
-- Klíče pro tabulku `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`idbranch`),
  ADD UNIQUE KEY `branch_name_UNIQUE` (`branch_name`);

--
-- Klíče pro tabulku `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idcategory`),
  ADD KEY `category_name` (`category_name`);

--
-- Klíče pro tabulku `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idcourse`),
  ADD UNIQUE KEY `idcourse_UNIQUE` (`idcourse`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`),
  ADD KEY `fk_course_branch1_idx` (`branch_idbranch`),
  ADD KEY `name_UNIQUE` (`course_name`) USING BTREE;

--
-- Klíče pro tabulku `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idevent`),
  ADD KEY `event_name` (`event_name`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`);

--
-- Klíče pro tabulku `firm`
--
ALTER TABLE `firm`
  ADD PRIMARY KEY (`idfirm`),
  ADD KEY `firm_name_UNIQUE` (`firm_name`),
  ADD KEY `address` (`address`),
  ADD KEY `city` (`city`),
  ADD KEY `fk_firm_users1_idx` (`contact_id`),
  ADD KEY `ico_UNIQUE` (`ico`) USING BTREE;

--
-- Klíče pro tabulku `firm_has_course`
--
ALTER TABLE `firm_has_course`
  ADD PRIMARY KEY (`firm_idfirm`,`course_idcourse`),
  ADD KEY `fk_firm_has_course_course1_idx` (`course_idcourse`),
  ADD KEY `fk_firm_has_course_firm1_idx` (`firm_idfirm`);

--
-- Klíče pro tabulku `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`idmedia`),
  ADD KEY `filename` (`filename`),
  ADD KEY `title` (`title`),
  ADD KEY `extension` (`extension`),
  ADD KEY `created` (`created`),
  ADD KEY `filesize` (`filesize`),
  ADD KEY `mime` (`mime`),
  ADD KEY `fk_media_users1_idx` (`users_id`);

--
-- Klíče pro tabulku `media_has_article`
--
ALTER TABLE `media_has_article`
  ADD PRIMARY KEY (`media_idmedia`,`article_idarticle`),
  ADD KEY `fk_media_has_article_article1_idx` (`article_idarticle`),
  ADD KEY `fk_media_has_article_media1_idx` (`media_idmedia`);

--
-- Klíče pro tabulku `partnership`
--
ALTER TABLE `partnership`
  ADD PRIMARY KEY (`firm_idfirm`,`school_idschool`),
  ADD KEY `fk_firm_has_school_school1_idx` (`school_idschool`),
  ADD KEY `fk_firm_has_school_firm1_idx` (`firm_idfirm`);

--
-- Klíče pro tabulku `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`idschool`),
  ADD UNIQUE KEY `school_name_UNIQUE` (`school_name`),
  ADD UNIQUE KEY `izo_UNIQUE` (`izo`),
  ADD KEY `address` (`address`),
  ADD KEY `city` (`city`),
  ADD KEY `fk_school_users1_idx` (`contact_id`);

--
-- Klíče pro tabulku `school_has_course`
--
ALTER TABLE `school_has_course`
  ADD PRIMARY KEY (`school_idschool`,`course_idcourse`),
  ADD KEY `fk_school_has_course_course1_idx` (`course_idcourse`),
  ADD KEY `fk_school_has_course_school1_idx` (`school_idschool`);

--
-- Klíče pro tabulku `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`idspace`),
  ADD UNIQUE KEY `sign_UNIQUE` (`sign`);

--
-- Klíče pro tabulku `stand`
--
ALTER TABLE `stand`
  ADD PRIMARY KEY (`idstand`),
  ADD KEY `fk_stand_event1_idx` (`event_idevent`),
  ADD KEY `fk_stand_space1_idx` (`space_idspace`),
  ADD KEY `fk_stand_school1_idx` (`school_idschool`);

--
-- Klíče pro tabulku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`role`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `article`
--
ALTER TABLE `article`
  MODIFY `idarticle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `category`
--
ALTER TABLE `category`
  MODIFY `idcategory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `course`
--
ALTER TABLE `course`
  MODIFY `idcourse` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Courses of study', AUTO_INCREMENT=599;

--
-- AUTO_INCREMENT pro tabulku `event`
--
ALTER TABLE `event`
  MODIFY `idevent` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `firm`
--
ALTER TABLE `firm`
  MODIFY `idfirm` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pro tabulku `school`
--
ALTER TABLE `school`
  MODIFY `idschool` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pro tabulku `space`
--
ALTER TABLE `space`
  MODIFY `idspace` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `stand`
--
ALTER TABLE `stand`
  MODIFY `idstand` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_users1` FOREIGN KEY (`author_id`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `article_has_category`
--
ALTER TABLE `article_has_category`
  ADD CONSTRAINT `fk_article_has_category_article1` FOREIGN KEY (`article_idarticle`) REFERENCES `article` (`idarticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_article_has_category_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course_branch1` FOREIGN KEY (`branch_idbranch`) REFERENCES `branch` (`idbranch`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `firm`
--
ALTER TABLE `firm`
  ADD CONSTRAINT `fk_firm_users1` FOREIGN KEY (`contact_id`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `firm_has_course`
--
ALTER TABLE `firm_has_course`
  ADD CONSTRAINT `fk_firm_has_course_course1` FOREIGN KEY (`course_idcourse`) REFERENCES `course` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_firm_has_course_firm1` FOREIGN KEY (`firm_idfirm`) REFERENCES `firm` (`idfirm`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_users1` FOREIGN KEY (`users_id`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `media_has_article`
--
ALTER TABLE `media_has_article`
  ADD CONSTRAINT `fk_media_has_article_article1` FOREIGN KEY (`article_idarticle`) REFERENCES `article` (`idarticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_media_has_article_media1` FOREIGN KEY (`media_idmedia`) REFERENCES `media` (`idmedia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `partnership`
--
ALTER TABLE `partnership`
  ADD CONSTRAINT `fk_firm_has_school_firm1` FOREIGN KEY (`firm_idfirm`) REFERENCES `firm` (`idfirm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_firm_has_school_school1` FOREIGN KEY (`school_idschool`) REFERENCES `school` (`idschool`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `school`
--
ALTER TABLE `school`
  ADD CONSTRAINT `fk_school_users1` FOREIGN KEY (`contact_id`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `school_has_course`
--
ALTER TABLE `school_has_course`
  ADD CONSTRAINT `fk_school_has_course_course1` FOREIGN KEY (`course_idcourse`) REFERENCES `course` (`idcourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_school_has_course_school1` FOREIGN KEY (`school_idschool`) REFERENCES `school` (`idschool`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `stand`
--
ALTER TABLE `stand`
  ADD CONSTRAINT `fk_stand_event1` FOREIGN KEY (`event_idevent`) REFERENCES `event` (`idevent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stand_school1` FOREIGN KEY (`school_idschool`) REFERENCES `school` (`idschool`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stand_space1` FOREIGN KEY (`space_idspace`) REFERENCES `space` (`idspace`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
