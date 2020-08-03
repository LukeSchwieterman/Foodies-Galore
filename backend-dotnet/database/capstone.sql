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
VALUES ('El Rancho Nueva', 'Mexican', '45040');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Banana Leaf', 'Thai', '45040');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Bawarchi', 'Indian', '45069');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Fox and Hound', 'British', '45239');

INSERT INTO restaurants (restaurant_name, restaurant_type, location_zip)
VALUES ('Olive Garden', 'Italian', '45069');