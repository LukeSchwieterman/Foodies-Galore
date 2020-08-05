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
VALUES ('Olive Garden', 'Italian', '45069');

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



CREATE TABLE restaurant_reviews (
	restaurant_id int NOT NULL,
	review_id int IDENTITY (5, 5) NOT NULL PRIMARY KEY,
	restaurant_review varchar(250),
	restaurant_star_rating int NOT NULL
)



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