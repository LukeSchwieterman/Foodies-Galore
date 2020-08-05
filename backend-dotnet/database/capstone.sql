USE master
GO

--drop database if it exists
IF DB_ID('foodies_galore') IS NOT NULL
BEGIN
	ALTER DATABASE foodies_galore SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE foodies_galore;
END

CREATE DATABASE foodies_galore
GO

USE foodies_galore
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

GO


CREATE TABLE restaurants (
	restaurant_id int IDENTITY (10,10) NOT NULL PRIMARY KEY,
	restaurant_name varchar(80) NOT NULL,
	restaurant_type varchar(50) NOT NULL,
	location_zip varchar(9)
)

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Yummy Bowl', 'Chinese', '45069');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Chick Fil A', 'American', '45239');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Bob Evans', 'American', '45040');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Skyline', 'Greek', '45239');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Miyako Sushi&Grill', 'Japanese', '45069');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('El Rancho Grande', 'Mexican', '45040');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Banana Leaf', 'Thai', '45040');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Bawarchi', 'Indian', '45069');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Fox and Hound', 'British', '45239');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Olive Garden', 'Italian', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Cheesecake Factory', 'American', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Qdoba', 'Mexican', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Acapulcos', 'Mexican', '45239')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Kyoto', 'Japanese', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Roll On In', 'Japanese', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Piada', 'Italian', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Carrabas', 'Italian', '45239')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Tasty Pot', 'Chinese', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Thai Koon Kitchen', 'Thai', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Bangkok Express', 'Thai', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('P.F. Changs', 'Chinese', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Gyro Express', 'Greek', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Santorini', 'Greek', '45239')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Pub at Rookwood Mews', 'British', '45239')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Cock and Bull Public House', 'British', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Bamboo House', 'Japanese', '45040')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Wingstop', 'American', '45239')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('La PiNata', 'Mexican', '45239')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Hook Fish & Chicken', 'British', '45069')

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Biagios Bistro', 'Italian', '45040');


SELECT * FROM restaurants;

CREATE TABLE restaurant_details (
	restaurant_id int NOT NULL PRIMARY KEY,
	restaurant_description varchar(400),
	restaurant_phonenumber varchar(12),
	covid_message varchar(400)
)

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (10, 'We are a local and family owned business, dedicated to serving authentic Chinese food, fast and fresh.',
'513-870-9500','During these uncertain times, the health and safety of our guests is our top priority. We have begun
sanitizing as well as social distancing all seating. Masks will be provided at the door if you do not have your own,
and each staff member will be wearing a mask and gloves.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (20, 'We should be about more than just selling chicken. We should be a part of our customers lives and the communities in which we serve.', '513-245-0934',
'As states and local communities begin to reopen for business, we are sharing our commitment to safe service and our approach to expanding the levels of service
offered at restaurants. We want guests to know - no mater which restaurant you visit - you will continue to receive the high-quality food, service and hospitality
that you have come to expect from Chick-fil-A.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (30, 'Bob Evans is a chain of family style restaurants. Our success is built on the basics: high-quality food and heartfelt hospitality.',
'513-770-0163', 'At Bob Evans Restaurants, we are taking precautions to adhere to social distancing guidelines, going above and beyond with cleaning
and safety procedures and making it easy to get you your favorite meals while protecting you and our employees.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (40, 'Skyline is famous for our incredibly delicious Cheese Coneys and 3-Ways. Our unique chili is still made with the original secret
family recipe passed down through generations.', '513-729-2200', 'Please know our neighborhood Skyline is prepared to serve you our delicious
food and hospitality in a clean and wholesome environment. Thank you for your patronage of Skyline Chili. All the best to you and your
families during this time.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (50, 'Miyako distinguishes itself from other Japanese restaurants in numerous different ways, mst remarkably the sushi bar, which is the
largest in town and one that makes impressively skilled and tasty sushi in fantastic and brillian combinations with fresh ingredients.', '513-777-3888',
'The new way of Miyako is here! Everyone is adapting to the new life after COVID-19, and so are we! We are continuously developing a way for all of
our beloved customers to enjoy our food.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (60, 'El Rancho Grande offers fresh, homemade dishes made to order. Our menu includes an amazing selection of seafood, chicken, steak
and unique entrees sure to satisfy any palate. Try our fajitas, chimichangas, chile rellenos, burritos and more!', '513-229-0595', 'We are very grateful
to have found continued support and patronage during this time. We would like to ensure to all guests that we have been taking the necessary steps
such as mask requirements and santizing, as well as social distancing.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (70, 'Each dish is made from scratch and presented as a work of art. Menu favorites include Curry, Spring Rolls, and of course the wildly
popular Pad thai.', '513-234-0779', 'During these difficult times, we continue to enforce social distancing, mask requirements, and proper
sanitation of the entire restaurant. We look forward to welcoming you back!');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (80, 'We offer an extensive menu of regional Indian dishes in an easygoing space with catering and delivery options.', '513-466-8212', 'Bawarchi
Biryanis would like to share with our guests and community members, who have been very supportive of us, the actions we are taking to keep our restaurant
safe and clean for our customers, for our employees, and the community at large which includes regularly disinfecing, limiting dining to the patio area,
using disposable-ware for serving and dining.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (90, 'This is your bar. This place is not about pleasing the status quo or knocking the rust off old pick-up lines. It is all about hanging
out with friends, playing games, and having a good drink.', '513-229-7921', 'Our promise to you is to continue to be a leader in safe sanitation
practices with all team members certified in safe food handling, as well as adhering to all mask-requirements and providing our guests with a mask
if you do not have one. Tables will be separated and patrons will be socially distanced around the bar.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (100, 'Italian generosity is always on the table. At Olive Garden, we know that life is better together and everyone is happiest when with family.',
'513-677-5922', 'The health and safety of our guests and team members has always been our first
priority. While our dining rooms were closed, we took great care to continue serving ToGo orders. But now that we will be reopening dine-in, we will be
requiring face coverings, and will be temperature checking all staff, social distancing and sanitizing all areas multiple times a day.');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (110, 'Our story begins in Detroit in the 1940s. Evelyn Overton found a recipe in the local paper that would inspire her "Original" Cheesecake.
Everyone loved her recipe so much that she decided to open a small cheesecake shop, which would one day grow into The Cheesecake Factory', '513-755-2761',
'The health and wellbeing of our staff members and guests is our top priority, and we are approaching the reopening of our dining rooms with that as our
guiding principle.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (120, 'At Qdoba, our mission is to bring flavor to peoples lives through our communities, our people, our restaurants, and our food. We believe
every individual makes a difference, and that even the smallest detail or act of kindness can make someones life a little more flavorful.', '513-770-0310',
'As COVID-19 continues to impact all of us, our teams are continuing to work hard serving you freshly prepared, flavorful meals. We are working to safely
welcome you back into our restaurants')

INSERT INTO restaurant_details(restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (130, 'Authentic Mexican cuisine your whole family will love!', '513-874-5777', 'As we continue to monitor the developemtns around COVID-19 news, our locations
have adjusted their services in order to continue serving our community as best we can.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (140, 'Kyoto Japanese Cuisine brings to the area the delicacy and quality of the cuisine from Japan.', '513-583-8897', 'We are currently open carry out only,
full menu is available. Our staff will wear masks and gloves and we will make sure to clean all surfaces and doors thoroughly every 30 minutes.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (150, 'We offer a menu that explores the edge of multi-cultural boundaries, bringing sushi burritos, sushi tacos, sushi bowls and even sushi donuts
to a whole new level. Our food is fast, fresh and affordable and takes sushi to a whole other level.', '513-480-1335', 'Our number one priority is you! And due to that,
our entire staff will be wearing masks as well as gloves that will be changed frequently, and sanitizing surfaces often.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (160, 'Piada started as an idea scribbled on a napkin during a visit to Rimini, Italy. Our chefs found distinct charm
in the family operated food carts and corner markets scattered throughout the streets of the city.', '513-492-9931', 'While our dining rooms
are reopening as local restrictions ease, we continue to offer in-store carry out, online, Curbside or Drive Thru Pick up.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (170, 'We are two Sicilian boys from Texas who love to cook and eat. We love the Sicilian food our parents and grandparents cooked.',
'513-339-0900', 'Our dining rooms are starting to safely open at limited capacity and hours to comply with regulations. We are happy to welcome you back and want
to ensure the safety of your visit.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (180, 'At tasty pot, we firmly believe that in order to live well, you must eat well. It is our mission to provide healthy dining in a comfortable modern
setting with excellent service.', '513-580-8888', 'Due to the COVID-19 pandemic, we are committed to the health and safety of our guests and staffs. Due to this,
we will remain carry-out and delivery only, as well as masking up and sanitizing all areas.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (190, 'Unpretentious bistro featuring familiar Thai dishes such as red curry, pad thai and fried rice.', '513-860-0143', 'Due to the current public situation,
we are strictly carry out as of now. We will be taking safety and cleanliness precautions to ensure the safety of our guests.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (200, 'Our Thai restaurant is known for its modern interpretation of classic dishes and its insistence on only using high quality fresh ingredients',
'513-381-2100', 'We are open for takeout and delivery during this time. We will be following regulations as far as cleanliness and social distancing.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (210, 'P.F. Changs is an Asian restaurant concept founded on making food from scratch every day in every restaurant. Created in 1993, we are the first
multi-unit restaurant concept in the US to honor and celebrate the 2,000 year old tradition of wok cooking as the center of every guest experience.', '513-531-4567',
'Our team members are ready to serve you, your friends and your family! Reservations are now being accepted at select dining rooms and we could not be more excited.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (220, 'Come to Gyro Express for some traditional Mediterranean cuisine.', '513-832-1845', 'For the safety of our staff and guests, we are currently
delivery and takeout only.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (230, 'A family restaurant serving Greek food as well as daily specials and soup. We serve breakfast, lunch and dinner all day long.',
'513-662-8080', 'Starting May 26th we will be reopening our dining room, sanitizing all spaces, and wearing protective gear.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (240, 'If you were looking for a great place with British vibes, this is the place.', '513-841-2748', 'Beginning Friday, May 15th, our patios will be reopening,
and the 21st our dining rooms. We will be wearing masks, gloves, and following proper sanitization as well as social distancing guidelines.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (250, 'Voted best fix & chips in the city four locations.', '513-771-4253', 'We are now open for limited inside and outside seating!
We have been working overtime preparing for your return; cleaning, sanitizing and developing new protocols to safely once again serve our guests.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (260, 'Bamboo House is a hidden jewel just waiting to be discovered by your taste buds.', '513-574-8555', 'Staff will be wearing masks and gloves,
sanitizing and social distancing in order to adhere to guidelines.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (270, 'What began as a small buffalo-style chicken wing restaurant in Garland, Texas, continues to soar to great heights. Today there are more than
1,400 restaurants across the world.', '513-481-9464', 'During these uncertain times, we will be taking the time and effort to ensure the safety of our staff
and guests through mask-wearing, glove usage and proper sanitization.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (280, 'Our mission over the years has been very simple. To showcase the best Mexico has to offer and to impact the hearts of Americans one
delicious taco at a time.', '513-923-2733', 'Like many of you, we here at La Pinata are excited to open our dine in area back up and try to return back to normality.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (290, 'We provide the best food in the state! Come get a taste of Britain.', '513-771-1868', 'We are working diligently to ensure the safety of our
guests and staff with masks, gloves, sanitation and social distancing.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (300, 'Charming neighborhood hangout serving up classic Italian cuisine, desserts, wine and cocktails.', '513-861-4777',
'There have been service changes such as limiting the number of guests per table and in the restaurant as a total. We are doing everything we can
to comply with regulations and also deliver an impeccable experience.');





CREATE TABLE restaurant_reviews (
	restaurant_id int NOT NULL,
	review_id int IDENTITY (5, 5) NOT NULL PRIMARY KEY,
	restaurant_review varchar(250),
	restaurant_star_rating int NOT NULL
)

SELECT * FROM restaurant_details;

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (10, 'Higher quality meat than a typical hole in the wall chinese place. Delicious!', 4);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (20, 'Great place, great people, great service, great food!', 4);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (30, 'Comfort food, reasonable prices and good service.', 3);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (40, 'Always great food and always super friendly staff/service.', 4);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (50, 'Excellent food and service, great place for birthday party!', 4);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (60, 'Good food, friendly service, and tasty margaritas!', 3);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (70, 'The atmosphere was very cool, a bit edgy in a cool and intimate setting.', 4);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (80, 'Best indian food in town!', 4);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (90, 'Fantastic selection of beer/wine, good food, and good service.', 3);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (100, 'Great service, love the breadsticks and salad.', 3);


CREATE TABLE user_favorites (
	user_id int NOT NULL,
	restaurant_id int NOT NULL
)

INSERT INTO user_favorites (user_id, restaurant_id)
VALUES (1, 10);


CREATE TABLE user_account (
	user_id int NOT NULL,
	user_zip varchar (9) NOT NULL,
	user_likes_first varchar (30),
	user_likes_second varchar (30),
	user_likes_third varchar (30)
	CONSTRAINT PK_user_account PRIMARY KEY (user_id)
)

INSERT INTO user_account (user_id, user_zip, user_likes_first, user_likes_second, user_likes_third)
VALUES (1, 45040, 'Mexican', 'American', 'Japanese');

SELECT * FROM user_account