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

CREATE TABLE restaurant_type (
	type_id int IDENTITY (2, 2) NOT NULL PRIMARY KEY,
	type varchar(30) NOT NULL
)

INSERT INTO restaurant_type (type)
VALUES ('American')

INSERT INTO restaurant_type (type)
VALUES ('Mexican')

INSERT INTO restaurant_type (type)
VALUES ('Greek')

INSERT INTO restaurant_type (type)
VALUES ('Thai')

INSERT INTO restaurant_type (type)
VALUES ('Japanese')

INSERT INTO restaurant_type (type)
VALUES ('Chinese')

INSERT INTO restaurant_type (type)
VALUES ('Italian')

INSERT INTO restaurant_type (type)
VALUES ('British')

INSERT INTO restaurant_type (type)
VALUES ('Indian');

CREATE TABLE restaurants (
	restaurant_id int IDENTITY (10,10) NOT NULL PRIMARY KEY,
	restaurant_name varchar(80) NOT NULL,
	location_zip varchar(9),
	image_source varchar(50)
)

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Yummy Bowl', '45069', 'yummybowl.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Chick Fil A', '45239', 'chickfila.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bob Evans', '45040', 'bobevans.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Skyline', '45239', 'betterchili.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Miyako Sushi&Grill', '45069', 'miyako.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('El Rancho Grande', '45040', 'elranchogrande.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Banana Leaf', '45040', 'bananaleaf.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bawarchi', '45069', 'bawarchi.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Fox and Hound', '45239', 'foxandhound.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Olive Garden', '45069', 'olivegarden.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Cheesecake Factory', '45069', 'cheesecakefactory.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Qdoba', '45040', 'qdoba.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Acapulcos', '45239', 'acapulcos.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Kyoto', '45069', 'kyoto.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Roll On In', '45040', 'rollonin.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Piada', '45040', 'piada.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Carrabas', '45239', 'carrabas.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tasty Pot', '45040', 'tastypot.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Thai Koon Kitchen', '45069', 'thaikoon.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bangkok Express', '45040', 'bangkokexpress.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('P.F. Changs', '45069', 'pfchangs.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Gyro Express', '45040', 'gyroexpress.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Santorini', '45239', 'santorini.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Pub at Rookwood Mews', '45239', 'pubatrookwoodmews.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Cock and Bull Public House', '45069', 'cockandbull.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bamboo House', '45040', 'bamboohouse.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Wingstop', '45239', 'wingstop.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('La PiNata', '45239', 'lapinata.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Hook Fish & Chicken', '45069', 'hookfishandchicken.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Biagios Bistro', '45040', 'biagiosbistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('McDonalds', '45239', 'mcdonalds.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Taco Bell', '45040', 'tacobell.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('The Old Bag of Nails Pub', '45069', 'oldbagofnailspub.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Godavari', '45040', 'godavari.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Raja India', '45239', 'rajaindia.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Basil Thai Bistro', '45040', 'basilthaibistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Red Squirrel', '45239', 'redsquirrel.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Los Panchos', '45040', 'lospanchos.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Fusabowl', '45069', 'fusabowl.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tags Cafe', '45239', 'tagscafe.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Sichuan Bistro', '45040', 'sichuanbistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Rusty Bucket', '45239', 'rustybucket.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('China Chef', '45040', 'chinachef.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Pitrellis', '45239', 'pitrellis.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tazikis', '45040', 'tazikis.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Kabuto', '45239', 'kabuto.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Panda Express', '45040', 'pandaexpress.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Thai Taste of West Chester', '45069', 'thaitaste.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Dancing Roll', '45040', 'dancingroll.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tikka Grill', '45069', 'tikkagrill.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Soho Japanese Bistro', '45040', 'sohobistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Indian Fusion', '45069', 'indianfusion.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Mi Burrito', '45040', 'miburrito.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Greek Isles', '45239', 'greekisles.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bucks Tavern', '45239', 'buckstavern.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Chuys', '45040', 'chuys.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('New Krishna', '45239', 'newkrishna.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Maggianos Little Italy', '45040', 'maggianos.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Mazunte Taqueria', '45239', 'mazuntetaqueria.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('The Eagle', '45069', 'eagle.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Oriental Wok', '45040', 'orientalwok.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Nicholsons Tavern', '45239', 'nicholsons.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Sebastians', '45069', 'sebastians.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Buddha Barn', '45040', 'buddhabarn.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Arlins', '45239', 'arlins.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Montgomery Inn', '45069', 'montgomeryinn.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Buca Di Beppo', '45040', 'buca.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Swagat India House', '45069', 'swagat.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Thai Spicy', '45040', 'thaispicy.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bravo!', '45239', 'bravo.jpg')







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
to comply with regulations and also deliver an impeccable experience.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (310, 'Back in 1954, a man named Ray Kroc discovered a small burger restaurant in California, and wrote the first page of our history.
From humble beginnings as a small restaurant, we are proud to have become one of the leading food service brands in the world with more than 36,000
restaurants in more than 100 countries.', '513-741-0266', 'At Mcdonalds, the safety of our customers and crew is a top priority. Today, more than ever,
we remain committed to following state and local health guidelines and will continue implementing coronavirus safety measures to help protect restaurant
crew and customers.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (320, 'We are open early with breakfast hours and if you find yourself out and about late at night, you can still order at our drive thru. We are serving
all your favorite menu items, from classic burritos and tacos to some new favorites like Crunchwrap Supreme.','513-398-9755', 'Taco Bell is monitoring and following
guidelines from health authorities worldwide regarding the novel Coronavirus (COVID-19) to keep its customers and employees safe and healthy.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (330, 'I called my pub "The Old Bag of Nails" because the first one was in an empty hardware store. And every day people stop by for great food, great
spirits, and an occasional hammer.', '513-492-7941', 'Patio and dine-in seating is available as we adjust to our new normal, wearing masks and sanitizing. But we are not
gonna let this stop us from enjoying the pub!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (340, 'The best South Indian restaurant in Cincinnati, Ohio. We specialize in providing south Indian food buffet with authentic south Indian cuisine.', 
'513-770-0444', 'Our dining room will remain open as long as it is safe for our staff and customers. Masks and gloves will be worn. We also offer delivery and carry out.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (350, 'At Raja India we offer distinctive cuisine in an informal, friendly setting.', '513-770-0500', 'We are experts in planning parties, buffets, intimate
business luncheons or family reunions. Therefore, we are experts in keeping our staff and customers safe even in large groups. We will be properly social distancing,
sanitizing and wearing masks.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (360, 'At Basil Thai Bistro, we pride ourselves on serving tradition Thai food!', '513-530-0899', 'We are now open for social-distanced dine-in, reservation only.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (370, 'Red Squirrel is a family-owned, diner-style restaurant. Our famous "original" sandwiches are considered the best in the city of Cincinnati.', '513-741-4800',
'We are back to regular business hours and dine-in is now open! We are completing a re-model and extensive safety training for our entire staff. Come check us out!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (380, 'Mexican restaurant with a full bar, best margaritas, happy hour every day, street tacos!', '513-923-3400', 'We will be remaining closed for the duration
of thi pandemic in an effort to help prevent the spread of Covid-19.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (390, 'We are committed to have the best service with the best fresh ingredients. Now just at the tip of your fingers, you can customize your own hibachi/poke
bowl and sushi roll.', '513-923-9888', 'Our team members ensure to give you the best food service while also keeping you safe, and following all federal regulations.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (400, 'Strip mall eatery serving breakfast, lunch, baked goods and espresso drinks in modest surroundings.', '513-741-1333', 'Thanks for all your support during this
difficult time! We are open and serving our full menu with curbside pick up and patio dining.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (410, 'Serving authentic Sichuan Chinese food since 2006.', '513-770-3123', 'We are BACK and ready to serve you some delicious Chinese cuisine. Open as usual for
carry-out, DoorDash and UberEats. Please support us through these tough times. Thank you!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (420, 'Curb your cravings with some of your Rusty Bucket faves!', '513-330-0150', 'All Rusty Bucket Restaurant and Tavern locations will be requiring guests to wear masks
or appropriate face coverings when entering and exiting our locations and in all common areas of the restaurant.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (430, 'Humble eatery dishing up generous portions of standard Chinese dishes in unpretentious surrounds.', '513-522-2212', 'During the pandemic we will be enforcing
all regulations such as mask requirements and sanitization guide lines.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (440, 'At Pitrellis, we pride ourselves in serving only authentic Italian cuisine and we work hard to offer a great selection of wines.', '513-770-0122', 'For the duration
of the pandemic we will remain carry-out only.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (450, 'Bucks Tavern prides itself on offering up the freshest of everything. Homemade chili, hand patted burgers and even hand breaded chicken tenders.',
'513-677-3511', 'We are back to our regularly scheduled business hours. Thank you for your support during this time!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (460, 'Kabuto Japanese Steakhouse & Sushi Bar serves a wide selection of traditional Japanese cuisine including sushi and sashimi, hibachi grilled
entrees and a variety of salads and appetizers.', '513-741-7222', 'We are open for both dine-in and carry-out now. We will not be serving lunch during this pandemic.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (470, 'From our world famous Orange Chicken to our health-minded Wok Smart™ selections, Panda Express defines American Chinese cuisine with bold flavors and fresh
ingredients. Freshly prepared. Every day.', '513-229-8379', 'As companies, communities and individuals across the globe stand together to navigate these uncertain times,
we remain steadfast at Panda Express in our commitment to care for and humbly serve you — our valued guests — as guided by our mission and values as a family business.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (480, 'Simple Thai place offering curries & noodle dishes.', '513-759-9999', 'During this pandemic we will be operating with shorter hours, social distancing,
limited seating and face-mask requirements.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (490, 'Here at Dancing Roll we provide you with the freshest ingredients in a hip atmosphere. The sushi is always half-priced dine-in or carry out.',
'513-755-6800', 'We will be officially reopened July 8th.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (500, 'We created Tikka Grill to share our love of the Mediterranean’s delicious flavors, wholesome ingredients, and bright spices. We take pride in
using our traditional cooking techniques and the highest quality ingredients to make a delicious food.', '513-777-3237', 'We have temporarily closed our dining area but are
still here to serve you orders to-go. We apologize for any inconvenience.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (510, 'Welcome to the Soho Japanese Bistro. Elegant dining, distinctive food and impeccable service, in a casual to upscale atmosphere.', '513-759-6876',
'Starting May 27th, Soho Japanese Bistro is officially OPEN for dining and available for carrying out and deliveries!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (520, 'Welcome to Indian Fusion where we serve Lentil Soup, Chapati, Chana Masala, and more!', '513-499-2023', 'Our dining room is open. We have a rigorous
safety program in place, including comfortable spaces for safe dining, sanitized common touch points, and wellness checks + masks for team members.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (530, 'Our Mexican restaurant is known for its modern interpretation of classic dishes and its insistence on only using high quality fresh ingredients.',
'513-805-7854', 'Due to the current situation we will remain open for carry out only.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (540, 'Authentic Greek Restaurant, Voted Best in Cincinnati', '513-755-0600', 'During the pandemic we have decided to remain carry out only for the safety of our family,
staff and customers.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (550, 'Bucks Tavern prides itself on offering up the freshest of everything. Homemade chili, hand patted burgers and even hand breaded chicken tenders.',
'513-677-3511', 'We are back to our regularly scheduled business hours. Thank you for your support during this time!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (560, 'Our founders had a vision of a fun and funky Tex-Mex restaurant that served authentic and fresh food in an atmosphere that appealed to everyone. From these
humble beginnings Chuys was born.', '513-779-2489', 'A big thank you to our amazing Chuys fans who have supported us during this challenging time. We are starting to open
our dining rooms. The health and safety of our employees and customers remains our top priority. Whether you choose to eat at our restaurant or continue to order for pickup
or delivery, we are here for you.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (570, 'Modern Indian eatery dishing up classic tandoori dishes, biryani & curry, coupled with beer & wine.', '513-769-6266', 'As of Monday July 13th we will be starting
our buffet back up - due to safety guidelines we will be adhering to all regulations such as mask requirements and switching out buffet utensils after each use.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (580, 'Maggianos Little Italy is an American casual dining restaurant chain specializing in Italian-American cuisine.', '513-794-0670', 'In these hard times we would like
to ask our customers to stay safe, healthy & full! Order online and pick up your Italian-American favorites today!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (590, 'The story of Mazunte is a simple one. Initially conceived with a theme influenced by Mexican Street Food, the original conception has never wavered.', '513-785-0000',
'As always, the safety of our staff and customers is our top priority. Due to the pandemic we will be strictly carry-out only, enforcing face mask requirements as well as social
distancing and proper sanitization.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (600, 'We start with cage free, free roaming, all natural chicken. It’s brined, dredged, then dropped into custom-built fryers. Its got a little kick and is served with our
house made hot honey.', '513-802-5007', 'Starting Friday, May 8 we will be serving up chicken and all the fixins for carryout and delivery at our Mass Ave location.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (610, 'Decorated with black lacquer & gold accents, this family-owned spot offers familiar Chinese cuisine.', '513-871-6888', 'We’re still smiling under our new uniform
addition😷 Thank you for letting us feed your families❤️🥡carry out and curbside service available till 9pm.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (620, 'The idea for Nicholson’s was born from our founder’s passion for all things Great Britain.', '513-564-9111', 'Dear guests: Though we have not had any positive cases of
Covid in our building, we will be temporarily closed until we can reopen to a more normal capacity.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (630, 'Classic Greek joint serving gyros, salads & other fast fare in no-frills digs since 1976.', '513-471-2100', 'We hope you are staying healthy and safe. We wanted to post a reminder
that for the time being, Sebastians closes at 7:00 pm. Thank you for supporting our business during these times.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (640, 'Authentic thai food, BYOB and friendly service.', '513-442-2010', 'OPEN Tuesdays thru Sundays for Carry-Out, since April 21st. Please Stay SAFE ALL!')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (650, 'Neighborhood watering hole with American pub grub & beer on tap, plus a roomy brick-walled patio.', '513-751-6566', 'During COVID-19 we will be operating at our normal hours while enforcing
social distancing, masks and proper sanitizing.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (660, 'Montgomery Inn is a barbecue restaurant chain based in the Cincinnati suburb of Montgomery, Ohio, United States. It is best known for its specialty, loin back ribs, and the barbecue sauce
used in preparation and serving.', '513-791-3482', 'We very much appreciate your continued support during this COVID-19 crisis. We look forward to seeing you again at the restaurant and appreciate your
support of our new safe in-restaurant practices.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (670, 'Our mission is to capture the fun and enthusiasm of an authentic Italian gathering along with delectable food. Every Buca di Beppo restaurant offers an eclectic setting designed to make every
occasion a party', '513-396-7673', 'The full Buca menu is available To Go, and many locations offer Curb Service. At select locations you may place a To Go order online through our online ordering system.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (680, 'Whether you are seeking a selection of Indian food or would like to enjoy some savory Indian Sweets, our restaurant has great options for all of our customers.', '513-755-2876',
'Swagat India House makes sure that you can enjoy the authentic flavors of our traditionally prepared Indian food in the comfort of your own home with our takeout service.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (690, 'Authentic Thai and sushi spot located conveniently in the Cincinnati area.', '513-271-8424', 'During these uncertain times, we will be remaining strictly carry out and delivery.')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message)
VALUES (700, 'Step into Bravo and experience the amazing homemade Italian inspired recipes. From pastas, to brick oven pizzas, to fresh salads, to perfectly charred grill items.', '513-234-7900', 'We are offering
patio dining and carry out at select locations.')




CREATE TABLE restaurant_reviews (
	review_id int IDENTITY (5, 5) NOT NULL PRIMARY KEY,
	restaurant_id int NOT NULL,
	restaurant_review varchar(250),
	restaurant_star_rating int NOT NULL
)

SELECT * FROM restaurant_details;

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (10, 'Higher quality meat than a typical hole in the wall chinese place. Delicious!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (20, 'Great place, great people, great service, great food!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (30, 'Comfort food, reasonable prices and good service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (40, 'Always great food and always super friendly staff/service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (50, 'Excellent food and service, great place for birthday party!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (60, 'Good food, friendly service, and tasty margaritas!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (70, 'The atmosphere was very cool, a bit edgy in a cool and intimate setting.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (80, 'Best indian food in town!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (90, 'Fantastic selection of beer/wine, good food, and good service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (100, 'Great service, love the breadsticks and salad.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (110, 'Great food, great service, and a wide variety of dishes to choose from.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (120, 'Better sauces and queso than the other burrito chains.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (130, 'The menu was plentiful, huge selection.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (140, 'Big variety of food experiences.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (150, 'Very fresh and tasty, high quality ingredients and excellent service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (160, 'Omg I just had the best piada experience!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (170, 'The atmosphere, the menu and staff make this a great choice!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (180, 'Great place for family dinner, friends, small groups, kids or casual date!', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (190, 'Really good Thai food for good prices.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (200, 'I would choose this location over other Thai places in the area.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (210, 'Upscale Chinese that we really enjoy!', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (220, 'Very good service, reasonable price and uality of food!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (230, 'I enjoyed the swift customer service and well cooked dishes.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (240, 'The staff and decor along with the beer selection make this an experience.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (250, 'A must visit place! Try the fish and chips, or the chicken nachos.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (260, 'This place is always great; the food and service!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (270, 'Very nice staff and clean environment, tasty combo meals.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (280, 'Personable staff, good food, cold drinks good service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (290, 'Great catfish, fresh and fast! Friendly staff and excellent service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (300, 'Both food and service were great!', 3);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (310, 'They gave me ketchup without asking, extra napkins and hot food. Very happy!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (320, 'Great location, awesome people, affordable prices and excellent food!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (330, 'Fantastic atmosphere and tasty dishes.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (340, 'They had variety of items in buffet, ambience is good and staff were welcoming.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (350, 'Very tasty lunch buffet with a wide variety of entrees and side dishes.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (360, 'The food is great, the staff is friendly, the prices are reasonable, and BYOB!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (370, 'Good service, decent food, prices comparable to other restaurants like it.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (380, 'Always great prices, great food, good service, and served quickly.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (390, 'Excellent meals, creative chef de cuisine, decent pay and excellent service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (400, 'Great food great staff makes you feel refreshed in the morning after work.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (410, 'Clean interior, fresh ingredients, proper seasoning, friendly staff.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (420, 'The service is constantly quick, great ambience, very kind staff members.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (430, 'Great food, good prices, and fast and friendly service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (440, 'Wonderful food, great service, intimate atmosphere, good wine selection', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (450, 'Very good food, served quickly, ample portions, friendly service.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (460, 'Excellent ambience, flavorful dishes, great service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (470, 'Great food, friendly service, reasonably priced, good portions.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (480, 'Very generous portions and fair price. Fresh and the best I can find lately.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (490, 'Great food, atmosphere, staff, and prices.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (500, 'This was my first time here and the employees were awesome.  The food was outstanding.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (510, 'Great Service, Great Food, Clean Restaurant, Fast, Calm Environment.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (520, 'Lovely interior, fabulous service and great taste (good prices, too.)', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (530, 'Finest food, kind staff members, always fantastic vibes.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (540, 'The experience at this place beats going to chain restaurants.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (550, 'Excellent food, prompt service, nice atmosphere, and appropriate prices.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (560, 'Food was delicious, Salsa is a bit spicy but still yummy.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (570, 'The drinks and food served quickly and the prices were fair.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (580, 'Best place to eat Italian food for your money.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (590, 'Delicious food, superb margaritas, great service, and an authentic Mexican vibe.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (600, 'Dog friendly, great location, fair price, great staff and amazing sandwiches!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (610, 'The customer service is regularly fast, good ambience, super friendly staff.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (620, 'The service is always rapid, lovely vibes, very kind staff.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (630, 'Prices are right, service is friendly and the food cannot be beat.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (640, 'Its a small place but service was good and food was excellent.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (650, 'Good ambience, amazing patio nice beer menu and very tasty food.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (660, 'Service and food A+ friendliest staff', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (670, 'The food is amazing to say the least and the staff is amazing, too.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (680, 'Anyone who enjoys a well executed Indian buffet should check this place out.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (690, 'Good flavor and portion size, casual atmosphere.', 3)

INSERT into restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (700, 'Good service, decent food and drinks, relaxed and rarely a wait.', 4);


CREATE TABLE user_favorites (
	user_id int NOT NULL,
	restaurant_id int NOT NULL
)

INSERT INTO user_favorites (user_id, restaurant_id)
VALUES (1, 10);


CREATE TABLE user_account (
	user_id int NOT NULL,
	user_zip varchar (9) NOT NULL,
	CONSTRAINT PK_user_account PRIMARY KEY (user_id)
)

INSERT INTO user_account (user_id, user_zip)
VALUES (1, 45040);

CREATE TABLE user_favorited_types (
	type_id int NOT NULL,
	user_id int NOT NULL
)

INSERT INTO user_favorited_types (type_id, user_id)
VALUES (4, 1)


CREATE TABLE restaurants_and_their_types (
	restaurant_id int NOT NULL,
	type_id int NOT NULL
)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (10, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (20, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (30, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (40, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (50, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (60, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (70, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (80, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (90, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (100, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (110, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (120, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (130, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (140, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (150, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (160, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (170, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (180, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (190, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (200, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (210, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (220, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (230, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (240, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (250, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (260, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (270, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (280, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (290, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (300, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (310, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (320, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (330, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (340, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (350, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (360, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (370, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (380, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (390, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (400, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (410, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (420, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (430, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (440, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (450, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (460, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (470, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (480, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (490, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (500, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (510, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (520, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (530, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (540, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (550, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (560, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (570, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (580, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (590, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (600, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (610, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (620, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (630, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (640, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (650, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (660, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (670, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (680, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (690, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (700, 14);

ALTER TABLE restaurants_and_their_types
ADD FOREIGN KEY (type_id)
REFERENCES restaurant_type(type_id);

ALTER TABLE restaurants_and_their_types
ADD FOREIGN KEY (restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE restaurant_reviews
ADD FOREIGN KEY(restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE user_favorites
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id);

ALTER TABLE user_favorites
ADD FOREIGN KEY(restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE user_favorited_types
ADD FOREIGN KEY(type_id)
REFERENCES restaurant_type(type_id);

ALTER TABLE user_favorited_types
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id);