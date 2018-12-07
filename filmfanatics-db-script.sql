-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Dec 07. 22:42
-- Kiszolgáló verziója: 10.1.37-MariaDB
-- PHP verzió: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `filmfanatics`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `artists`
--

CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(40) CHARACTER SET utf16 COLLATE utf16_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `artists`
--

INSERT INTO `artists` (`artist_id`, `artist_name`) VALUES
(1, 'Brad Bird'),
(2, 'Quentin Tarantino'),
(3, 'James Cameron'),
(4, 'David Fincher'),
(5, 'Christopher Nolan'),
(6, 'Guy Ritchie'),
(7, 'Will Gluck'),
(8, 'Damien Chazelle'),
(9, 'George Clooney'),
(10, 'Britt Robertson'),
(11, 'Raffey Cassidy'),
(12, 'Kathryn Hahn'),
(13, 'Hugh Laurie'),
(14, 'Tom Cruise'),
(15, 'Jeremy Renner'),
(16, 'Simon Pegg'),
(17, 'Paula Patton'),
(18, 'Brad Pitt'),
(19, 'Diane Kruger'),
(20, 'Mélanie Laurent'),
(21, 'Christoph Waltz'),
(22, 'Daniel Brühl'),
(23, 'John Travolta'),
(24, 'Uma Thurman'),
(25, 'Bruce Willis'),
(26, 'Samuel L. Jackson'),
(27, 'Ving Rhames'),
(28, 'Leonardo DiCaprio'),
(29, 'Kate Winslet'),
(30, 'Billy Zane'),
(31, 'Kathy Bates'),
(32, 'Bill Paxton'),
(33, 'Sam Worthington'),
(34, 'Sigourney Weaver'),
(35, 'Michelle Rodriguez'),
(36, 'Zoe Saldana'),
(37, 'Giovanni Ribisi'),
(38, 'Morgan Freeman'),
(39, 'Gwyneth Paltrow'),
(40, 'Kevin Spacey'),
(41, 'Jesse Eisenberg'),
(42, 'Andrew Garfield'),
(43, 'Justin Timberlake'),
(44, 'Rooney Mara'),
(45, 'Armie Hammer'),
(46, 'Joseph Gordon-Levitt'),
(47, 'Marion Cotillard'),
(48, 'Ellen Page'),
(49, 'Tom Hardy'),
(50, 'Cillian Murphy'),
(51, 'Christian Bale'),
(52, 'Heath Ledger'),
(53, 'Maggie Gyllenhaal'),
(54, 'Gary Oldman'),
(55, 'Aaron Eckhart'),
(56, 'Benicio Del Toro'),
(57, 'Vinnie Jones'),
(58, 'Jason Statham'),
(59, 'Robert Downey jr.'),
(60, 'Rachel McAdams'),
(61, 'Jude Law'),
(62, 'Mark Strong'),
(63, 'Eddie Marsan'),
(64, 'Emma Stone'),
(65, 'Stanley Tucci'),
(66, 'Lisa Kudrow'),
(67, 'Cam Gigandet'),
(68, 'Patricia Clarkson'),
(69, 'Mila Kunis'),
(70, 'Woody Harrelson'),
(71, 'Ryan Gosling'),
(72, 'John Legend'),
(73, 'Miles Teller'),
(74, 'J. K. Simmons'),
(75, 'Paul Reiser'),
(76, 'Melissa Benoist'),
(77, 'Michael Caine');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `movie_id` int(11) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `content` text CHARACTER SET utf16 COLLATE utf16_hungarian_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`movie_id`, `user_id`, `content`) VALUES
(1, 'agi92@gmail.com', 'Nekem tetszett.'),
(1, 'peti2@gmail.com', 'Átlagos film, egyszer nézhető.'),
(2, 'peti2@gmail.com', 'Számomra csalódás a film.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `follows`
--

CREATE TABLE `follows` (
  `artist_id` int(11) NOT NULL,
  `user_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `follows`
--

INSERT INTO `follows` (`artist_id`, `user_id`) VALUES
(1, 'agi92@gmail.com'),
(3, 'agi92@gmail.com'),
(11, 'agi92@gmail.com'),
(23, 'agi92@gmail.com'),
(46, 'agi92@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(20) CHARACTER SET utf16 COLLATE utf16_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Akció'),
(2, 'Dráma'),
(3, 'Vígjáték'),
(4, 'Életrajzi'),
(5, 'Kaland'),
(6, 'Krimi'),
(7, 'Fantasy'),
(8, 'Sci-fi'),
(9, 'Romantikus'),
(10, 'Western'),
(11, 'Musical'),
(12, 'Thriller'),
(13, 'Horror'),
(14, 'Háborús'),
(15, 'Gengszter');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(40) CHARACTER SET utf16 COLLATE utf16_hungarian_ci DEFAULT NULL,
  `description` text CHARACTER SET utf16 COLLATE utf16_hungarian_ci,
  `release_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `description`, `release_date`) VALUES
(1, 'Holnapolisz', 'Frank egykor zseniális feltaláló volt, de már belefáradt az egészbe. Casey viszont egy nagyon okos, lelkes lány, akit hajt a tudományos kíváncsiság. Most egy közös küldetésre vállalkoznak: megpróbálnak egy helyet felfedezni valahol a térben és időben, melyet úgy hívnak: Tomorrowland. Amit találnak, az örökre megváltoztatja a világot.', '2015-05-22'),
(2, 'Mission: Impossible - Fantom protokoll', 'Az Impossible Mission Force-ot leállítják, amikor felmerül a gyanú, hogy közük van egy globális terrorista összeesküvéshez. Beindul a Fantom Protokoll, és Ethan Huntnak és új csapatának be kell épülnie, hogy tisztára mossák a szervezet nevét. Nincs segítség, nincsenek összekötők, fű alatt kell akcióba lépniük. Ennél durvább és ennél intenzívebb küldetést még senki sem látott.', '2011-01-15'),
(3, 'Becstelen brigantyk', 'A második világháborúban járunk. Franciaország német megszállás alatt nyög. Egy kislétszámú amerikai csapatot ide vezényeltek, feladatuk nem más, mint minél több nácival végezni. Aldo Raine hadnagy emberei ezt a küldetést szokatlan kegyetlenséggel teljesítik, olyannyira hogy hírhedtek lesznek a németek közt, a nácik rettegik nevüket, s még magának Hitlernek is okoznak álmatlan éjszakákat. Amikor egy német hősről szóló film premierjét tartják egy kis francia moziban, hirtelen lehetőség nyílik arra, hogy a Brigantyk néven elhíresült banda véget vethessen a világháborúnak...', '2009-08-20'),
(4, 'Ponyvaregény', 'Két idősödő, szabadszájú gengszter Vincent és Jules épp főnöküknek szereznek vissza egy aktatáskát. A bokszoló, Butch a hírhedt maffiafőnök, Marsellus Wallace átvágását tervezi. Egy piti rablópáros egy étterem kirablására készül. És a szálak összefutnak...', '1995-04-13'),
(5, 'Titanic', 'A történelem leghíresebb tengeri katasztrófája volt a Titanic óceánjáró 1912. április 15-i jéghegynek ütközése. Egy tizenhét éves lány és egy fiatalember szerelmi kapcsolatának szemszögéből élhetjük át a tragédiát. A zárt, angliká- nus világban élő fiatal hölgy szemét az élet igazi dolgaira a nehéz sorsú fiú hívja fel. Szerelmük beteljesülésébe azonban nem csak a jéghegyek szólnak bele...', '1998-01-22'),
(6, 'Avatar', 'A történet a távolabbi jövőben játszódik, amikor is az emberiség eljutott a hozzánk legközelebb lévő Alpha Centauri csillagrendszerbe, ahol a Pandorának keresztelt bolygón életet fedeznek fel. A bolygó egy eddig ismeretlen, különleges ásványi anyagban gazdag, így megindul a Pandora gyarmatosítása. Ezt a bolygó törzsi közösségekben élő őshonos népe, a na\'vik nem nézik jó szemmel. Hogy az idegen atmoszférájú bolygón való mozgást és a fajok közti kommunikációt megkönnyítsék, hibrid avatarokat hoznak létre, amelyeket egy-egy ember telepatikus kapcsolaton keresztül irányít. Jake Sully, a háborús veterán, aki tolószékbe kényszerült, jelentkezik a programba. Azonban miután közelebbről is megismeri a na\'vi kultúrát, rádöbben, hogy az emberek gátlástalanul kihasználják a bolygót, és a gyarmatosítók ellen fordul.', '2009-12-17'),
(7, 'Hetedik', 'A történet helyszíne egy nagyváros vigasztalanul szürke betonrengetege, ahol egy elmebeteg sorozatgyilkos után nyomoz a rendőrség. A férfi a Bibliában megírt hét halálos bűn lajstromát követve szedi áldozatait. A nyugdíjba készülő, higgadt és bölcs William Sommerset nyomozó és a türelmetlen, lobbanékony természetű újonc, David Mills próbálják megakadályozni az őrültet újabb bűntettek elkövetésében.', '1996-11-07'),
(8, 'A közösségi háló', 'A film a napjainkban vitathatatlanul a legnépszerűbb közösségi oldal, a Facebook történetét tárja elénk. Hogyan jött létre 2004-ben, a Harvardon ez a mára már több mint 500 millió aktív tagot számláló internetes közösség, és hová jutott el mostanra? Hogyan változott meg az akkor még egyetemista alapító, Mark Zuckerberg, valamint a Napster társalapítójának, Sean Parkernek az élete a hirtelen jött hírnévtől és természetesen a gazdagságtól...', '2010-10-01'),
(9, 'Eredet', 'Két ifjú és ambiciózus építész együtt dolgozik, s nem csak kollégák, hanem a legjobb barátok is, ám kapcsolatukra némi árnyék vetül. A vállalatnál kifejlesztettek egy olyan technológiát, amely segítségével be lehet lépni az álmokba, és bizonyos emberek fejéből így információhoz lehet jutni. Amikor Cobb él ezzel a lehetőséggel, a dolgok egyre bonyolultabbakká válnak...', '2010-07-22'),
(10, 'Batman - A Sötét Lovag', 'Batman ismét a bűn nyomába ered: nekilát, hogy szétverje azokat a bűnszerveteket, melyek rettegésben tartják a város utcáit. Ezúttal is számos segítőre akad, elsősorban Jim Gordon rendőrfelügyelő és Harvey Dent államügyész személyében. A hármas fogat hatásosnak bizonyul, de hamarosan nagyobb káosz üti fel fejét Gotham City-ben, egy felettébb intelligens elme, mely Jokernek hívja magát.', '2008-08-07'),
(11, 'Blöff', 'A gyémántokra specializálódott, minden hájjal megkent tolvaj, Négyujjú Franky, miután teljesítette legfrissebb megbízatását, s eltulajdonított egy hatalmas drágakövet jogos tulajdonosától, New Yorkba indul, hogy szállítsa az árut főnökének, Avinek. Útközben azonban egy szusszanásnyira megáll Londonban, ahol apróbb brilleket kell kézbesítenie Avi unokatestvérének és más ékszerkereskedőknek. Amikor itt találkozik Penge Borisszal, még nem sejti, hogy küldetésének befellegzett...', '2001-01-11'),
(12, 'Sherlock Holmes', 'Sherlock Holmes karaktere is halad a korral. Zseniális nyomozási módszerei és kiváló küzdőképessége a régi és klasszikus, ám a detektív már vérbeli akcióhős és nőcsábász is. Sherlock Holmes és társa, Dr. Watson egy olyan ügyön dolgozik, amely egész Anglia vesztét is okozhatja, így szükségük is lesz minden erejükre és képességükre, hogy megoldják a szövevényes problémát.', '2009-01-07'),
(13, 'Könnyű nőcske', 'Egy középiskolás lány élete gyanúsan hasonlítani kezd A skarlát betű főhősnőjének, Hester Prynne-nak az életéhez, amikor kiderül aprócska kis hazugsága arról, hogyan is vesztette el a szüzességét. Az iskolában pletykák kezdenek terjengeni róla, ami eleinte borzasztóan zavarja, egészen addig, míg úgy nem dönt, ebből hasznot is lehet húzni, és tervével jobbá teheti szociális és anyagi helyzetét is...', '2010-09-17'),
(14, 'Barátság extrákkal', 'Dylan és Jamie nagyon elfoglalt emberek. Saját magukra sincs sokszor idejük, egy kapcsolatra pedig végképp nem jut idő. A testi vonzalmat azonban nem tudják figyelmen kívül hagyni, ezért közelebbi kapcsolatba bonyolódnak: csak szex, mindenféle kötöttség és érzelem nélkül. Ez csak addig tart, míg Dylan bele nem szeret a lányba, ezzel felrúgva az alkujukat. A lány időközben már elkezdett egy másik sráccal randizni, ettől válik egyre bonyolultabbá a történet.', '2011-09-22'),
(15, 'Kaliforniai álom', 'Mia, a feltörekvő, fiatal színésznő és Sebastian, a szépreményű jazz zongorista Los Angelesben keresi az álmait. Mia meghallgatásról meghallgatásra jár és csak arra vágyik, hogy végre ne szakítsák félbe, Sebastian pedig szenvedélyesen küzd azért, hogy a klasszikus jazzt újra divatba hozza. Távlati terveikben a hollywoodi karrier, illetve egy saját zenés klub megalapítása szerepel - ekkor botlanak egymásba egy zsúfolt autópálya kellős közepén. A két fiatal szerelemre lobban, és vállvetve segítik egymást a kudarcokkal kikövezett úton. A sikerért keményen meg kell küzdeniük, ám eljön a nap, amikor dönteniük kell, mennyit hajlandóak feláldozni az álmaikért...', '2016-12-29'),
(16, 'Whiplash', 'Andrew híres akar lenni. New York, tehát az Egyesült Államok, tehát az egész világ egyik leghíresebb zeneiskolájába, a Shaffer Konzervatóriumba jár, dobolni tanul, rengeteget gyakorol, és mindenre képes volna a siker érdekében. Legalább is, azt hiszi. De találkozik egy tanárral, aki még nála is elszántabb. Ő abban hisz, hogy a tehetséget mindenáron fel kell szabadítani, és ami bujkál, azt ki kell préselni a tanulókból. Akkor is, ha kínlódnak, ha sírnak vagy belehalnak. A kezdő zenész és a sokat látott veterán egymásnak feszül. A tanár felveszi a kezdő dobost a zenekarába, de az első örömöt nagyon sok keserűség követi. És egyikük sem adja fel könnyen, amit elkezdett. Mindketten tartják a ritmust...', '2015-02-05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `movie_genre`
--

CREATE TABLE `movie_genre` (
  `genre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `movie_genre`
--

INSERT INTO `movie_genre` (`genre_id`, `movie_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 10),
(1, 12),
(2, 4),
(2, 5),
(2, 8),
(2, 10),
(2, 15),
(2, 16),
(3, 11),
(3, 13),
(3, 14),
(4, 8),
(6, 4),
(6, 7),
(6, 11),
(6, 12),
(8, 1),
(8, 6),
(8, 9),
(9, 5),
(9, 13),
(9, 14),
(11, 15),
(12, 7),
(12, 9),
(14, 3),
(15, 11);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rates`
--

CREATE TABLE `rates` (
  `movie_id` int(11) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `rates`
--

INSERT INTO `rates` (`movie_id`, `user_id`, `rating`) VALUES
(1, 'agi92@gmail.com', 8),
(1, 'peti2@gmail.com', 6),
(2, 'peti2@gmail.com', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `user_id` varchar(40) NOT NULL,
  `full_name` varchar(40) CHARACTER SET utf16 COLLATE utf16_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`user_id`, `full_name`) VALUES
('agi92@gmail.com', 'Fodor Ágnes'),
('andris22@gmail.com', 'Nagy András'),
('edi96@gmail.com', 'Szabó Edina'),
('peti2@gmail.com', 'Kiss Péter');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `works_on`
--

CREATE TABLE `works_on` (
  `artist_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `works_as` varchar(40) CHARACTER SET utf16 COLLATE utf16_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `works_on`
--

INSERT INTO `works_on` (`artist_id`, `movie_id`, `works_as`) VALUES
(1, 1, 'Rendező'),
(1, 2, 'Rendező'),
(2, 3, 'Rendező'),
(2, 4, 'Rendező'),
(3, 5, 'Rendező'),
(3, 6, 'Rendező'),
(4, 7, 'Rendező'),
(4, 8, 'Rendező'),
(5, 9, 'Rendező'),
(5, 10, 'Rendező'),
(6, 11, 'Rendező'),
(6, 12, 'Rendező'),
(7, 13, 'Rendező'),
(7, 14, 'Rendező'),
(8, 15, 'Rendező'),
(8, 16, 'Rendező'),
(9, 1, 'Színész'),
(10, 1, 'Színésznő'),
(11, 1, 'Színésznő'),
(12, 1, 'Színésznő'),
(13, 1, 'Színész'),
(14, 2, 'Színész'),
(15, 2, 'Színész'),
(16, 2, 'Színész'),
(17, 2, 'Színésznő'),
(18, 3, 'Színész'),
(18, 7, 'Színész'),
(18, 11, 'Színész'),
(19, 3, 'Színésznő'),
(20, 3, 'Színésznő'),
(21, 3, 'Színész'),
(22, 3, 'Színész'),
(23, 4, 'Színész'),
(24, 4, 'Színésznő'),
(25, 4, 'Színész'),
(26, 4, 'Színész'),
(27, 4, 'Színész'),
(28, 5, 'Színész'),
(28, 9, 'Színész'),
(29, 5, 'Színésznő'),
(30, 5, 'Színész'),
(31, 5, 'Színésznő'),
(32, 5, 'Színész'),
(33, 6, 'Színész'),
(34, 6, 'Színésznő'),
(35, 6, 'Színésznő'),
(36, 6, 'Színésznő'),
(37, 6, 'Színész'),
(38, 7, 'Színész'),
(38, 10, 'Színész'),
(39, 7, 'Színésznő'),
(40, 7, 'Színész'),
(41, 8, 'Színész'),
(42, 8, 'Színész'),
(43, 8, 'Színész'),
(43, 14, 'Színész'),
(44, 8, 'Színésznő'),
(45, 8, 'Színész'),
(46, 9, 'Színész'),
(47, 9, 'Színésznő'),
(48, 9, 'Színésznő'),
(49, 9, 'Színész'),
(50, 9, 'Színész'),
(51, 10, 'Színész'),
(52, 10, 'Színész'),
(53, 10, 'Színésznő'),
(54, 10, 'Színész'),
(55, 10, 'Színész'),
(56, 11, 'Színész'),
(57, 11, 'Színész'),
(58, 11, 'Színész'),
(59, 12, 'Színész'),
(60, 12, 'Színésznő'),
(61, 12, 'Színész'),
(62, 12, 'Színész'),
(63, 12, 'Színész'),
(64, 13, 'Színésznő'),
(64, 14, 'Színésznő'),
(64, 15, 'Színésznő'),
(65, 13, 'Színész'),
(66, 13, 'Színésznő'),
(67, 13, 'Színész'),
(68, 13, 'Színésznő'),
(68, 14, 'Színésznő'),
(69, 14, 'Színésznő'),
(70, 14, 'Színész'),
(71, 15, 'Színész'),
(72, 15, 'Színész'),
(73, 16, 'Színész'),
(74, 15, 'Színész'),
(74, 16, 'Színész'),
(75, 16, 'Színész'),
(76, 16, 'Színésznő'),
(77, 9, 'Színész'),
(77, 10, 'Színész');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`movie_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`artist_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- A tábla indexei `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- A tábla indexei `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`genre_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- A tábla indexei `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`movie_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- A tábla indexei `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`artist_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT a táblához `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Megkötések a táblához `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Megkötések a táblához `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Megkötések a táblához `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Megkötések a táblához `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
