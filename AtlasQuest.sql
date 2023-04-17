CREATE SCHEMA AtlasQuestDB COLLATE utf8mb4_general_ci;

-- ****************** Creating users table

DROP TABLE IF EXISTS users;
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       trail_name VARCHAR(100) NOT NULL,
                       first_name VARCHAR(100) NOT NULL,
                       last_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       boxes_found INT DEFAULT 0,
                       password VARCHAR(255) NOT NULL,
                       status enum('inactive', 'active', 'locked') NOT NULL,
                       privileges enum('none', 'editor', 'admin', 'premium') NOT NULL
);

-- ****************** Creating users stored procedures



-- ****************** Creating attribute table

DROP TABLE IF EXISTS attribute;
CREATE TABLE attribute (
    attributeId VARCHAR(25) PRIMARY KEY,
    imgURL VARCHAR(100)
);

-- ****************** Inserting attribute records

INSERT INTO attribute    (attributeId, imgURL)
VALUES ("Hand-carved", 	"https://www.atlasquest.com/i/stamp/hand-carved/48.png"),
       ("Custom-made", "https://www.atlasquest.com/i/stamp/custom-made/48.png"),
       ("Store-bought", "https://www.atlasquest.com/i/stamp/store-bought/48.png"),
       ("Indoors", "https://www.atlasquest.com/i/building/store/48.png"),
       ("Drive-by", "https://www.atlasquest.com/i/car/sports/48.png"),
       ("Stroll", "https://www.atlasquest.com/i/hike-length/stroll/48.png"),
       ("Walk", "https://www.atlasquest.com/i/hike-length/hike/48.png"),
       ("Hike", "https://www.atlasquest.com/i/hike-length/hike/48.png"),
       ("Trek", "https://www.atlasquest.com/i/hike-length/trek/48.png"),
       ("Backpack", "https://www.atlasquest.com/i/hike-length/backpack/48.png"),
       ("Urban location", "https://www.atlasquest.com/i/building/houses/48.png"),
       ("Wheelchair accessible", "https://www.atlasquest.com/i/wheelchair/48.png"),
       ("Pet-friendly", "https://www.atlasquest.com/i/animal/dog/48.png"),
       ("Bike-friendly", "https://www.atlasquest.com/i/bike/48.png"),
       ("Snow-friendly", "https://www.atlasquest.com/i/weather/snow/48.png"),
       ("Puzzle", "https://www.atlasquest.com/i/body/brain/48.png"),
       ("Compass Required", "https://www.atlasquest.com/i/compass/48.png")
       ;

-- ****************** Creating Letterbox table

DROP TABLE IF EXISTS Letterbox;
CREATE TABLE Letterbox (
    LetterboxId INT auto_increment PRIMARY KEY ,
    name VARCHAR(100) NOT NULL ,
    location VARCHAR(100),
    owner varchar(100) NOT NULL ,
    findability enum('good', 'average', 'challenging', 'impossible') NOT NULL ,
    status enum('active', 'unknown', 'unavailable', 'retired') NOT NULL ,
    planted DATE NOT NULL ,
    lastFound DATE,
    clue VARCHAR(9999)
);

-- ****************** Creating Letterbox stored procedures

DROP PROCEDURE IF EXISTS sp_insert_letterbox;

DELIMITER $$
CREATE PROCEDURE sp_insert_letterbox(
    IN p_name VARCHAR(100),
    IN p_location VARCHAR(100),
    IN p_owner VARCHAR(100),
    IN p_findability VARCHAR(15),
    IN p_status VARCHAR(15),
    IN p_planted DATE,
    IN p_lastFound DATE,
    IN p_clue VARCHAR(9999),
    OUT r_newId INT
)
BEGIN
    INSERT INTO Letterbox (name, location, owner, findability,
                           status, planted, lastFound, clue)
    VALUES (p_name, p_location, p_owner, p_findability, p_status,
            p_planted, p_lastFound, p_clue);

    SET r_newId = LAST_INSERT_ID();
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_select_all_letterboxs;

DELIMITER $$
CREATE PROCEDURE sp_select_all_letterboxes()
BEGIN
    SELECT LetterboxId, name,location, owner, findability, status,
           planted, lastFound, clue
    FROM letterbox
        ;
END$$
DELIMITER ;

-- ************ Inserting letterboxes ****************

CALL sp_insert_letterbox("LIBS 2021", "350 1st Ave NE, Cedar Rapids, IA",
    "Denver Camp Queen", "good", "active", '2021-02-21', '2021-07-16',
    "This box is planted in honor of my son who won 3rd place in all of his events at the recent Liberal Art Swimming and Diving Championships 2-18-21 to 2-21-21. Held 2-18-21 to 2-21-21 at the Coe College natatorium.

The Captain for Loras College Swim & Dive also led his team to a 3rd overall finish in this event. I am so proud of you my son! Your leadership, passion and dedication to your team shows in the enthusiasm and gracious competition that all your teammates bring to each meet for you.

To find the box: find the Hilton Doubletree downtown. Enter the parking garage structure directly across the street from the front entrance. Proceed to the 3rd level parking floor. Find the door to the SkyWalk bridge to the Hilton and the Conventiion Complex events center. Park opposite the door. Look for some pipes that run ceiling to floor that are corralled by a yellow metal brace. A hand''s width down the bracket you will find your butterfly swimmer in a metallic key box. A small logbook is included.")
;

CALL sp_insert_letterbox("Black Lives Matter", "55 12th Ave SE, Cedar Rapids, IA",
    "Lampwick", "challenging", "active", '2021-05-06', null,
    "Find the little free mini heritage center, it’s really cute. Open the right door and reach up toward yourself, above the doorway into the gable to find your prize.")
;

CALL sp_insert_letterbox("The Kettel House", "945 6th Ave, Marion, IA", "PurpleAce",
    "average", "active", '2013-06-06', '2019-05-11',
    "Update Aug. 2021
I no longer live in the area and have been informed that the Kettel House is no longer under the same ownership. I haven''t been there in years so if the box is not there, please let me know. If it is there let me know that as well and contact me. I am interested in having it sent to me so I can take this one off of my list.

History of the Bakery (as quoted by their website):

It all began as a desire to bake for a 4-H project. Emily made cinnamon rolls using her grandma''s recipe when she was 9 to take to the Linn County Fair. After multiple years of 4-H fairs,
                         a trip to the Iowa State Fair and many awards and ribbons later her cinnamon rolls were perfected! During this time Emily and Cindy sold baked goods at the local Farmers Market where they grew a rather large customer base. They increased their products to the ever popular Kolaches and Pecan Rolls and from there the options where endless! After many years and begging from their customers Emily and Cindy took the leap and opened a Bakery! Boy was everyone excited!

Emily and Cindy opened up their bakery in April 2012. They have become quite the hot spot for a nice quiet place to sit and enjoy their baked goods, for meetings, or for catering purposes in our town of Marion, IA. I hope you enjoy their baked goods as much as my family and friends do. For more information about The Kettel House visit their website at http://www.thekettelhouse.com/

Clue:
Find The Kettel House Bakery and Cafe at 945 6th Ave. near downtown Marion, IA. It''s a small little yellow house. Business hours are 7:30-4, Monday through Friday and 8-12 on Saturday. Closed on Sunday. Bring cash with you unless you plan on spending more than $10. Trust me, it''s worth it to get yourself a treat from here.

Walk through the front door and take a moment to admire the brightly colored Kettel House sign on the porch wall. My mom made that sign :) Continue through the door and work your way to the counter where you will find a display case full of goodies. There is something different in the case every day. Buy yourself a treat. My personal favorites are the Raspberry Cream Cheese Croissant or the very popular Kolache (pronouced CO-LA-CH). If you are unsure what a kolache is, just ask Emily or one of the girls behind the counter. They are more than happy to tell you. Take your treat to the table where you will never lose track of TIME. To the right of this table you will see a BARN almost touching the ceiling. BELOW the barn is what you are searching for (if you''re looking at the garden tin you''re looking too far down).

Please be careful removing and replacing the box from it''s hiding place. Emily, Cindy, and their employees are aware of the box and will be keeping an eye on it, but keep an eye out for any Muggles present in the establishment.

Thank you for taking the time to look for my box. This is one of my first carves so it''s pretty rough but I hope you enjoy it and have enjoyed finding a new bakery to visit in town. Be sure to come back and enjoy some more of the goodies they offer.")
;

CALL sp_insert_letterbox("Gust & Carrie", "Greencastle Cemetery, North Liberty, IA", "ebda", "good",
    "active", '2012-10-31', '2022-04-24',
    "On this Halloween night, a group of friends and family gathered together to celebrate the love of two. This wasn''t your typical wedding, actually it wasn''t an official wedding at all. Being All Hallows Eve, everyone gathered in costume in a not so typical location, a small somewhat hidden cemetery outside of North Liberty Iowa. Greencastle Cemetery is where you will find Gust & Carrie. This stamp is not in remind us of those who have past but a couple that you might say are little off center.

To find what you seek you need to find your way to Greencastle Cemetery. This is located west of North Liberty. If traveling on Interstate 380 take the North liberty exit and head west on County Rd F28 for about 3 miles till you can turn right on Half Moon Ave. Travel north on this road, about a mile, more or less, before the T, you will spot a Wild Life Management Area. This is where you will need to be. Walk through the gate and up the hill. You have now found Greencastle Cemetery.

Work your way through this small cemetery, past Muscrave, Kadera, Babcock, till you find yourself in the North West corner. While facing the corner you will see 2 Wild Life Management Signs. Stand so that you are facing the sign on the right. Too the left of this sign is a tree very close to the fence line. Here betweeen the tree and the fence is Gust & Carrie.");


CALL sp_insert_letterbox("1870's Riddle", "Natchaug State Forest, Eastford, CT", "Irish Tinker", "average",
    "active", '2002-07-25', '2015-10-16',
    "The riddle was taken from the autobiography 'When I Was A Girl In The Martin Box' by O.P. Phelps

Proceed to the main entrance of the Natchaug Forest which has a brown wooden sign and is on the east side of route 198 in Eastford, 5 ½ miles past the intersection of routes 198 and 6 in Chaplin and 3 miles south of route 44 and 198 intersection. Go over the bridge. Go up the long winding hill until you get to a Y intersection. Bear LEFT. Follow 1/2 mile. Turn LEFT into the GENERAL LYONS BIRTH PLACE.
Remember the solution to this riddle maybe inside or outside of woods!
THE RIDDLE:
Round as an apple,
Tall as a gun,
Pull on it''s tail
and it''s nose will run.
When you find the answer to this riddle stand beside it, facing EAST.
Take 23 paces (Left foot count)
There are a couple of directions you could take.
Take a reading of 200 degrees and walk until you pass an oblong bolder on your left. The man in the moon is also watching from the left.
Follow straight ahead.
Slow down by the tree w/ 2 belly buttons.
Look in the roots of a fallen tree for your treasure!
(I planted this box last week and while on an outing today we noticed that when standing right next to the solution to the riddle the compass seems to go spastic. So please walk two or three feet to the right of the riddle answer before you try to read your compass. Sorry about that!!!!!!)")
;

-- ****************** Creating LetterboxAttribute table

Drop TABLE if exists LetterboxAttribute;
CREATE TABLE LetterboxAttribute(
    LetterboxId         INT     NOT NULL ,
    attributeId         VARCHAR(25)    NOT NULL,
    FOREIGN KEY (LetterboxId) REFERENCES  Letterbox(LetterboxId),
    FOREIGN KEY (attributeId) REFERENCES  attribute(attributeId),
    PRIMARY KEY (LetterboxId, AttributeId)
)

-- ****************** Creating LetterboxAttribute stored procedures

DROP PROCEDURE IF EXISTS sp_insert_LetterboxAtribute;

DELIMITER $$
CREATE PROCEDURE sp_insert_LetterboxAtribute(
    IN p_letterboxid INT,
    IN p_attributeid VARCHAR(25)
)
BEGIN
    INSERT INTO LetterboxAttribute (LetterboxId, attributeId)
    VALUES (p_letterboxid, p_attributeid);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_select_attributes_by_LetterboxId;

DELIMITER $$
CREATE PROCEDURE sp_select_attributes_by_LetterboxId(
    IN p_LetterboxId    INT
)
BEGIN
    SELECT attribute.attributeId, attribute.imgURL
    FROM attribute JOIN LetterboxAttribute on attribute.attributeId = LetterboxAttribute.attributeId
    WHERE LetterboxAttribute.LetterboxId = p_LetterboxId
    ;
END$$
DELIMITER ;

-- ****************** Inserting LetterboxAttributes

INSERT INTO LetterboxAttribute  (LetterboxId, attributeId)
    VALUES (5, "Hand-carved"),
           (5, "Drive-by"),
           (5, "Pet-friendly"),
           (5, "Compass Required"),
           (5, "Puzzle"),
           (4, "Hand-carved"),
           (4, "Stroll"),
           (3, "Hand-carved"),
           (3, "Indoors"),
           (3, "Snow-friendly"),
           (3, "Urban location"),
           (2, "Hand-carved"),
           (2, "Drive-by"),
           (2, "Snow-friendly"),
           (2, "Pet-friendly"),
           (2, "Bike-friendly"),
           (2, "Urban location"),
           (1, "Hand-carved"),
           (1, "Drive-by"),
           (1, "Snow-friendly"),
           (1, "Bike-friendly")
;