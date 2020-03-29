CREATE TABLE Artists (
    artist_id INT NOT NULL AUTO_INCREMENT,
    artist_name varchar(255) COLLATE utf16_hungarian_ci,
    profile_picture VARCHAR(255),
	PRIMARY KEY(artist_id)
);

CREATE TABLE Movies (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) COLLATE utf16_hungarian_ci,
	description TEXT COLLATE utf16_hungarian_ci,
	release_date DATE,
	movie_cover VARCHAR(255) COLLATE utf16_hungarian_ci,
	PRIMARY KEY(movie_id)
);

CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT,
    google_id VARCHAR(255),
	display_name VARCHAR(255) COLLATE utf16_hungarian_ci,
	PRIMARY KEY(user_id)
);

CREATE TABLE Genres (
    genre_id INT NOT NULL AUTO_INCREMENT,
	genre_name VARCHAR(40) COLLATE utf16_hungarian_ci,
	PRIMARY KEY(genre_id)
);

CREATE TABLE movie_genre (
	genre_id INT,
	movie_id INT,
	PRIMARY KEY(genre_id,movie_id),
	FOREIGN KEY(genre_id) REFERENCES Genres(genre_id),
	FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE follows (
    artist_id INT,
	user_id INT,
	PRIMARY KEY(artist_id,user_id),
	FOREIGN KEY(artist_id) REFERENCES Artists(artist_id),
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);


CREATE TABLE works_on (
    artist_id INT,
    movie_id INT,
	works_as VARCHAR(40) COLLATE utf16_hungarian_ci,
	PRIMARY KEY(artist_id,movie_id),
	FOREIGN KEY(artist_id) REFERENCES Artists(artist_id),
	FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE rates (
    movie_id INT,
	user_id INT,
	rating INT,
	PRIMARY KEY(movie_id,user_id),
	FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

CREATE TABLE comments (
	comment_id INT NOT NULL AUTO_INCREMENT,
    movie_id INT,
	user_id INT,
	content TEXT COLLATE utf16_hungarian_ci,
	PRIMARY KEY(comment_id),
	FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

INSERT INTO Genres(genre_name) VALUES("Akció");
INSERT INTO Genres(genre_name) VALUES("Dráma");
INSERT INTO Genres(genre_name) VALUES("Vígjáték");
INSERT INTO Genres(genre_name) VALUES("Életrajzi");
INSERT INTO Genres(genre_name) VALUES("Kaland");
INSERT INTO Genres(genre_name) VALUES("Krimi");
INSERT INTO Genres(genre_name) VALUES("Fantasy");
INSERT INTO Genres(genre_name) VALUES("Sci-fi");
INSERT INTO Genres(genre_name) VALUES("Romantikus");
INSERT INTO Genres(genre_name) VALUES("Western");
INSERT INTO Genres(genre_name) VALUES("Musical");
INSERT INTO Genres(genre_name) VALUES("Thriller");
INSERT INTO Genres(genre_name) VALUES("Horror");
INSERT INTO Genres(genre_name) VALUES("Háborús");
INSERT INTO Genres(genre_name) VALUES("Gengszter");


/*Adding movies to the db*/

INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Holnapolisz","Frank egykor zseniális feltaláló volt, de már belefáradt az egészbe. Casey viszont egy nagyon okos, lelkes lány, akit hajt a tudományos kíváncsiság. Most egy közös küldetésre vállalkoznak: megpróbálnak egy helyet felfedezni valahol a térben és időben, melyet úgy hívnak: Tomorrowland. Amit találnak, az örökre megváltoztatja a világot.","2015-05-22","tomorrowland.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Mission: Impossible - Fantom protokoll","Az Impossible Mission Force-ot leállítják, amikor felmerül a gyanú, hogy közük van egy globális terrorista összeesküvéshez. Beindul a Fantom Protokoll, és Ethan Huntnak és új csapatának be kell épülnie, hogy tisztára mossák a szervezet nevét. Nincs segítség, nincsenek összekötők, fű alatt kell akcióba lépniük. Ennél durvább és ennél intenzívebb küldetést még senki sem látott.","2011-01-15","ghost-protocol.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Becstelen brigantyk","A második világháborúban járunk. Franciaország német megszállás alatt nyög. Egy kislétszámú amerikai csapatot ide vezényeltek, feladatuk nem más, mint minél több nácival végezni. Aldo Raine hadnagy emberei ezt a küldetést szokatlan kegyetlenséggel teljesítik, olyannyira hogy hírhedtek lesznek a németek közt, a nácik rettegik nevüket, s még magának Hitlernek is okoznak álmatlan éjszakákat. Amikor egy német hősről szóló film premierjét tartják egy kis francia moziban, hirtelen lehetőség nyílik arra, hogy a Brigantyk néven elhíresült banda véget vethessen a világháborúnak...","2009-08-20","inglourious-basterds.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Ponyvaregény","Két idősödő, szabadszájú gengszter Vincent és Jules épp főnöküknek szereznek vissza egy aktatáskát. A bokszoló, Butch a hírhedt maffiafőnök, Marsellus Wallace átvágását tervezi. Egy piti rablópáros egy étterem kirablására készül. És a szálak összefutnak...","1995-04-13","pulp-fiction.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Titanic","A történelem leghíresebb tengeri katasztrófája volt a Titanic óceánjáró 1912. április 15-i jéghegynek ütközése. Egy tizenhét éves lány és egy fiatalember szerelmi kapcsolatának szemszögéből élhetjük át a tragédiát. A zárt, angliká- nus világban élő fiatal hölgy szemét az élet igazi dolgaira a nehéz sorsú fiú hívja fel. Szerelmük beteljesülésébe azonban nem csak a jéghegyek szólnak bele...","1998-01-22","titanic.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Avatar","A történet a távolabbi jövőben játszódik, amikor is az emberiség eljutott a hozzánk legközelebb lévő Alpha Centauri csillagrendszerbe, ahol a Pandorának keresztelt bolygón életet fedeznek fel. A bolygó egy eddig ismeretlen, különleges ásványi anyagban gazdag, így megindul a Pandora gyarmatosítása. Ezt a bolygó törzsi közösségekben élő őshonos népe, a na'vik nem nézik jó szemmel. Hogy az idegen atmoszférájú bolygón való mozgást és a fajok közti kommunikációt megkönnyítsék, hibrid avatarokat hoznak létre, amelyeket egy-egy ember telepatikus kapcsolaton keresztül irányít. Jake Sully, a háborús veterán, aki tolószékbe kényszerült, jelentkezik a programba. Azonban miután közelebbről is megismeri a na'vi kultúrát, rádöbben, hogy az emberek gátlástalanul kihasználják a bolygót, és a gyarmatosítók ellen fordul.","2009-12-17","avatar.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Hetedik","A történet helyszíne egy nagyváros vigasztalanul szürke betonrengetege, ahol egy elmebeteg sorozatgyilkos után nyomoz a rendőrség. A férfi a Bibliában megírt hét halálos bűn lajstromát követve szedi áldozatait. A nyugdíjba készülő, higgadt és bölcs William Sommerset nyomozó és a türelmetlen, lobbanékony természetű újonc, David Mills próbálják megakadályozni az őrültet újabb bűntettek elkövetésében.","1996-11-07","seven.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("A közösségi háló","A film a napjainkban vitathatatlanul a legnépszerűbb közösségi oldal, a Facebook történetét tárja elénk. Hogyan jött létre 2004-ben, a Harvardon ez a mára már több mint 500 millió aktív tagot számláló internetes közösség, és hová jutott el mostanra? Hogyan változott meg az akkor még egyetemista alapító, Mark Zuckerberg, valamint a Napster társalapítójának, Sean Parkernek az élete a hirtelen jött hírnévtől és természetesen a gazdagságtól...","2010-10-01","social-network.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Eredet","Két ifjú és ambiciózus építész együtt dolgozik, s nem csak kollégák, hanem a legjobb barátok is, ám kapcsolatukra némi árnyék vetül. A vállalatnál kifejlesztettek egy olyan technológiát, amely segítségével be lehet lépni az álmokba, és bizonyos emberek fejéből így információhoz lehet jutni. Amikor Cobb él ezzel a lehetőséggel, a dolgok egyre bonyolultabbakká válnak...","2010-07-22","inception.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Batman - A Sötét Lovag","Batman ismét a bűn nyomába ered: nekilát, hogy szétverje azokat a bűnszerveteket, melyek rettegésben tartják a város utcáit. Ezúttal is számos segítőre akad, elsősorban Jim Gordon rendőrfelügyelő és Harvey Dent államügyész személyében. A hármas fogat hatásosnak bizonyul, de hamarosan nagyobb káosz üti fel fejét Gotham City-ben, egy felettébb intelligens elme, mely Jokernek hívja magát.","2008-08-07","batman.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Blöff","A gyémántokra specializálódott, minden hájjal megkent tolvaj, Négyujjú Franky, miután teljesítette legfrissebb megbízatását, s eltulajdonított egy hatalmas drágakövet jogos tulajdonosától, New Yorkba indul, hogy szállítsa az árut főnökének, Avinek. Útközben azonban egy szusszanásnyira megáll Londonban, ahol apróbb brilleket kell kézbesítenie Avi unokatestvérének és más ékszerkereskedőknek. Amikor itt találkozik Penge Borisszal, még nem sejti, hogy küldetésének befellegzett...","2001-01-11","snatch.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Sherlock Holmes","Sherlock Holmes karaktere is halad a korral. Zseniális nyomozási módszerei és kiváló küzdőképessége a régi és klasszikus, ám a detektív már vérbeli akcióhős és nőcsábász is. Sherlock Holmes és társa, Dr. Watson egy olyan ügyön dolgozik, amely egész Anglia vesztét is okozhatja, így szükségük is lesz minden erejükre és képességükre, hogy megoldják a szövevényes problémát.","2009-01-07","sherlock-holmes.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Könnyű nőcske","Egy középiskolás lány élete gyanúsan hasonlítani kezd A skarlát betű főhősnőjének, Hester Prynne-nak az életéhez, amikor kiderül aprócska kis hazugsága arról, hogyan is vesztette el a szüzességét. Az iskolában pletykák kezdenek terjengeni róla, ami eleinte borzasztóan zavarja, egészen addig, míg úgy nem dönt, ebből hasznot is lehet húzni, és tervével jobbá teheti szociális és anyagi helyzetét is...","2010-09-17","easy-a.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Barátság extrákkal","Dylan és Jamie nagyon elfoglalt emberek. Saját magukra sincs sokszor idejük, egy kapcsolatra pedig végképp nem jut idő. A testi vonzalmat azonban nem tudják figyelmen kívül hagyni, ezért közelebbi kapcsolatba bonyolódnak: csak szex, mindenféle kötöttség és érzelem nélkül. Ez csak addig tart, míg Dylan bele nem szeret a lányba, ezzel felrúgva az alkujukat. A lány időközben már elkezdett egy másik sráccal randizni, ettől válik egyre bonyolultabbá a történet.","2011-09-22","friends-with-benefits.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Kaliforniai álom","Mia, a feltörekvő, fiatal színésznő és Sebastian, a szépreményű jazz zongorista Los Angelesben keresi az álmait. Mia meghallgatásról meghallgatásra jár és csak arra vágyik, hogy végre ne szakítsák félbe, Sebastian pedig szenvedélyesen küzd azért, hogy a klasszikus jazzt újra divatba hozza. Távlati terveikben a hollywoodi karrier, illetve egy saját zenés klub megalapítása szerepel - ekkor botlanak egymásba egy zsúfolt autópálya kellős közepén. A két fiatal szerelemre lobban, és vállvetve segítik egymást a kudarcokkal kikövezett úton. A sikerért keményen meg kell küzdeniük, ám eljön a nap, amikor dönteniük kell, mennyit hajlandóak feláldozni az álmaikért...","2016-12-29","lala-land.jpg");
INSERT INTO Movies(title,description,release_date,movie_cover) VALUES("Whiplash","Andrew híres akar lenni. New York, tehát az Egyesült Államok, tehát az egész világ egyik leghíresebb zeneiskolájába, a Shaffer Konzervatóriumba jár, dobolni tanul, rengeteget gyakorol, és mindenre képes volna a siker érdekében. Legalább is, azt hiszi. De találkozik egy tanárral, aki még nála is elszántabb. Ő abban hisz, hogy a tehetséget mindenáron fel kell szabadítani, és ami bujkál, azt ki kell préselni a tanulókból. Akkor is, ha kínlódnak, ha sírnak vagy belehalnak. A kezdő zenész és a sokat látott veterán egymásnak feszül. A tanár felveszi a kezdő dobost a zenekarába, de az első örömöt nagyon sok keserűség követi. És egyikük sem adja fel könnyen, amit elkezdett. Mindketten tartják a ritmust...","2015-02-05","whiplash.jpg");

/*Adding directors*/

INSERT INTO Artists(artist_name,profile_picture) VALUES("Brad Bird","brad-bird.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Quentin Tarantino","tarantino.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("James Cameron","james-cameron.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("David Fincher","david-fincher.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Christopher Nolan","christopher-nolan.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Guy Ritchie","guy-ritchie.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Will Gluck","will-gluck.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Damien Chazelle","damian-chazelle.jpg");



/*Adding artists */

INSERT INTO Artists(artist_name,profile_picture) VALUES("George Clooney","george-clooney.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Britt Robertson","britt-robertson.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Raffey Cassidy","raffey-cassidy.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Kathryn Hahn","kathryn-hahn.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Hugh Laurie","hugh-laurie.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Tom Cruise","tom-cruise.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Jeremy Renner","jeremy-renner.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Simon Pegg","simon-pegg.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Paula Patton","paula-patton.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Brad Pitt","brad-pitt.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Diane Kruger","diane-kruger.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Mélanie Laurent","melanie-laurent.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Christoph Waltz","christoph-wlatz.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Daniel Brühl","daniel-bruhl.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("John Travolta","john-travolta.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Uma Thurman","uma-thurman.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Bruce Willis","bruce-willis.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Samuel L. Jackson","sam-l-jackson.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Ving Rhames","ving-rhames.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Leonardo DiCaprio","leo-dicaprio.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Kate Winslet","kate-winslet.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Billy Zane","billy-zane.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Kathy Bates","kathy-bates.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Bill Paxton","bill-paxton.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Sam Worthington","sam-worthington.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Sigourney Weaver","sigourney-weaver.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Michelle Rodriguez","michelle-rodriguez.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Zoe Saldana","zoe-saldana.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Giovanni Ribisi","giovanni-ribisi.jpg");

/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Brad Pitt");*/
INSERT INTO Artists(artist_name,profile_picture) VALUES("Morgan Freeman","morgan-freeman.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Gwyneth Paltrow","gwyneth-paltrow.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Kevin Spacey","kevin-spacey.jpg");


INSERT INTO Artists(artist_name,profile_picture) VALUES("Jesse Eisenberg","jesse-eisenberg.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Andrew Garfield","andrew-garfield.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Justin Timberlake","justin-timberlake.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Rooney Mara","rooney-mara.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Armie Hammer","armie-hammer.jpg");

/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Leonardo DiCaprio");*/
INSERT INTO Artists(artist_name,profile_picture) VALUES("Joseph Gordon-Levitt","joseph-gordon-levitt.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Marion Cotillard","marion-cotillard.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Ellen Page","ellen-page.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Tom Hardy","tom-hardy.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Cillian Murphy","cilian-murphy.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Christian Bale","christian-bale.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Heath Ledger","heath-ledger.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Maggie Gyllenhaal","maggie-gyllenhaal.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Gary Oldman","gary-oldman.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Aaron Eckhart","aaron-eckhart.jpg");
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Michael Caine");*/
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Morgan Freeman");*/

INSERT INTO Artists(artist_name,profile_picture) VALUES("Benicio Del Toro","benicio-del-toro.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Vinnie Jones","vinne-jones.jpg");
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Brad Pitt");*/
INSERT INTO Artists(artist_name,profile_picture) VALUES("Jason Statham","jason-statham.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Robert Downey jr.","robert-downey-jr.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Rachel McAdams","rachel-mcadams.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Jude Law","jude-law.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Mark Strong","mark-strong.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Eddie Marsan","eddie-marsan.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Emma Stone","emma-stone.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Stanley Tucci","stanley-tucci.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Lisa Kudrow","lisa-kudrow.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Cam Gigandet","cam-gigandet.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Patricia Clarkson","patricia-clarkson.jpg");

INSERT INTO Artists(artist_name,profile_picture) VALUES("Mila Kunis","mila-kunis.jpg");
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Justin Timberlake")*/
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Emma Stone");*/
INSERT INTO Artists(artist_name,profile_picture) VALUES("Woody Harrelson","woody-harrelson.jpg");
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Patricia Clarkson");*/

/*INSERT INTO Artists(artist_name,profile_picture) VALUES("Emma Stone");*/
INSERT INTO Artists(artist_name,profile_picture) VALUES("Ryan Gosling","ryan-gosling.jpg");
/*INSERT INTO Artists(artist_name,profile_picture) VALUES("J. K. Simmons");*/
INSERT INTO Artists(artist_name,profile_picture) VALUES("John Legend","john-legend.jpg");


INSERT INTO Artists(artist_name,profile_picture) VALUES("Miles Teller","miles-teller.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("J. K. Simmons","j-k-simmons.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Paul Reiser","paul-reiser.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Melissa Benoist","melissa-benoist.jpg");
INSERT INTO Artists(artist_name,profile_picture) VALUES("Michael Caine","michael-caine.jpg");

/*works_on data */
INSERT INTO works_on(artist_id, movie_id,works_as) VALUES
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


/*movie_genre*/

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
