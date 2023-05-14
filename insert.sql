-- delete all records from tables

CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname in ('public');

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;
select clean_tables();

-- reset sequence

CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
-- end of reset

-- userr
insert into userr  ( username , password ) values ('cterrazzo0', 'wTOTEjka5qeC');
insert into userr  ( username , password ) values ('shoulton1', '5OU3KU97xBqW');
insert into userr  ( username , password ) values ( 'zmatyushkin2', 'Q9ai6IUSvoG6');
insert into userr  ( username , password ) values ( 'rmeates3', 'hDp8yWqo');
insert into userr  ( username , password ) values ( 'fmcclements4', 'VlVuUL');
insert into userr  ( username , password ) values ('dyakovich5', '6TrYQ78JW');
insert into userr  ( username , password ) values ( 'ppillans6', 'mn0EGiib');
insert into userr  ( username , password ) values ( 'dwhiteman7', 'vhDLuP');
insert into userr  ( username , password ) values ( 'jmees8', 'k323TV58iY');
insert into userr  ( username , password ) values ( 'mspir9', 't9Z1KT');


-- type
insert into type  ( type_name ) values ( 'jeans');
insert into type  ( type_name ) values ( 'sandals');
insert into type  ( type_name ) values ( 'tank top');
insert into type  ( type_name ) values ( 'tie');
insert into type  ( type_name ) values ( 'sweatpants');
insert into type  ( type_name ) values ( 'shirt');
insert into type  ( type_name ) values ( 'socks');
insert into type  ( type_name ) values ( 't-shirt');
insert into type  ( type_name ) values ( 'coat');
insert into type  ( type_name ) values ('swimsuit');
insert into type  ( type_name ) values ( 'long sleeve');
insert into type  ( type_name ) values ( 'dress');
insert into type  ( type_name ) values ( 'pants');
insert into type  ( type_name ) values ( 'jacket');
insert into type  ( type_name ) values ('boots');
insert into type  ( type_name ) values ( 'skirt');
insert into type  ( type_name ) values ( 'shoes');
insert into type  ( type_name ) values ( 'underpants');
insert into type  ( type_name ) values ( 'hoodie');
insert into type  ( type_name ) values ( 'bra');
insert into type  ( type_name ) values ( 'top');
insert into type  ( type_name ) values ( 'leggings');
insert into type  ( type_name ) values ( 'shorts');
insert into type  ( type_name ) values ( 'sweater');
insert into type  ( type_name ) values ( 'cap');
insert into type  ( type_name ) values ( 'hat');
insert into type  ( type_name ) values ( 'sneakers');
insert into type  ( type_name ) values ( 'belt');
insert into type  ( type_name ) values ( 'scarf');
insert into type  ( type_name ) values ( 'vest');
insert into type  ( type_name ) values ( 'turtleneck');
insert into type  ( type_name ) values ( 'handbag');

-- style
insert into style ( style_name , description ) values ( 'formal', 'This style is characterized by elegance, sophistication, and a focus on traditional design elements.');
insert into style ( style_name , description ) values ( 'romantic', 'This style features soft, feminine details and a focus on creating a romantic atmosphere.');
insert into style ( style_name , description ) values ('vintage', 'This style draws inspiration from the past, featuring classic design elements from different eras.');
insert into style ( style_name , description ) values ( 'casual', 'This style is characterized by comfort and simplicity, with a focus on functional design.');
insert into style ( style_name , description ) values ( 'bohemian', 'This style is eclectic and unconventional, featuring bold colors and patterns, and a mix of different textures.');
insert into style ( style_name , description ) values ( 'coastal', 'This style is inspired by seaside living, featuring a relaxed and breezy aesthetic.');
insert into style ( style_name , description ) values ( 'sporty', null);
insert into style ( style_name , description ) values ( 'minimalist', 'This style is characterized by simplicity, with a focus on clean lines, neutral colors, and a lack of ornamentation.');
insert into style ( style_name , description ) values ( 'art deco', 'This style features bold geometric shapes, luxurious materials, and a focus on glamour and opulence.');
insert into style ( style_name , description ) values ( 'traditional', 'This style is rooted in classical design elements, featuring ornate details and a formal aesthetic.');

--founder
INSERT INTO founder (name, surname, age) VALUES ( 'Kevin', 'Plank', 49);
INSERT INTO founder ( name, surname, age) VALUES ( 'Calvin', 'Klein', 79);
INSERT INTO founder ( name, surname, age) VALUES ( 'Mario', 'Prada', NULL);
INSERT INTO founder ( name, surname, age)VALUES ( 'Adele', 'Fendi', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Louis', 'Vuitton', NULL);
INSERT INTO founder ( name, surname, age)VALUES ( 'Tommy', 'Hilfiger', 71);
INSERT INTO founder ( name, surname, age)VALUES ( 'Amancio', 'Ortega', 85);
INSERT INTO founder ( name, surname, age) VALUES ( 'Cristóbal', 'Balenciaga', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Guccio', 'Gucci', NULL);
INSERT INTO founder ( name, surname, age) VALUES ('Arthur', 'Ryan', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Erling', 'Persson', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Chip', 'Wilson', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Adolf', 'Dassler', NULL);
INSERT INTO founder ( name, surname, age)VALUES ( 'Ralph', 'Lauren', 82);
INSERT INTO founder ( name, surname, age) VALUES ( 'Rudolf', 'Dassler', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Rosalia', 'Mera', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Isak', 'Andic', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'Bill', 'Bowerman', NULL);
INSERT INTO founder ( name, surname, age) VALUES ( 'J.W.', 'Foster', NULL);

-- brand
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (1, 'Under Armour', '1996-06-26');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (2, 'Calvin Klein', '1968-04-12');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (3, 'Prada', '1913-06-29');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (4, 'Fendi', '1925-03-29');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (5, 'Louis Vuitton', '1854-11-11');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (6, 'Tommy Hilfiger', '1985-10-16');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (7, 'Zara', '1975-04-16');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (8, 'Balenciaga', '1919-07-25');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (9, 'Gucci', '1921-07-18');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (10, 'Primark', '1969-06-09');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (11, 'H&M', '1947-04-27');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (12, 'Lululemon', '1998-11-09');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (13, 'Adidas', '1949-02-13');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (14, 'Ralph Lauren', '1967-12-20');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (15, 'Puma', '1948-12-30');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (16, 'Pull&Bear', '1991-09-01');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (7, 'Stradivarius', '1994-10-23');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (17, 'Bershka', '1998-02-23');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (18, 'Nike', '1964-12-20');
INSERT INTO brand (founder_id, brand_name, year_of_foundation) VALUES (19, 'Reebok', '1958-03-15');

-- weather
INSERT INTO weather ( weather_name) VALUES ('sunny');
INSERT INTO weather ( weather_name)VALUES ('cloudy');
INSERT INTO weather ( weather_name) VALUES ('rainy');
INSERT INTO weather ( weather_name) VALUES ('snowy');
INSERT INTO weather ( weather_name) VALUES ('cool');
INSERT INTO weather ( weather_name) VALUES ('windy');
INSERT INTO weather ( weather_name) VALUES ('cold');
INSERT INTO weather ( weather_name) VALUES ('boiling hot');
INSERT INTO weather ( weather_name) VALUES ('partly cloudy');
INSERT INTO weather ( weather_name) VALUES ( 'sunny warm');
INSERT INTO weather ( weather_name) VALUES ( 'mild');
INSERT INTO weather ( weather_name) VALUES ( 'warm');

-- outfit
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (1,5, 'just my favourite', true, null);
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (2,7, 'favourite for cold weather', true, 'winter');
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (3,12, 'dress for some party', false, null);
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (4,null, 'my suit for sleep', false, null);
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (5,null, 'for parties', true, null);
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (6,null, 'for sport', false, 'summer');
insert into outfit  (outfit_id, weather_id, outfit_name, favourite, season) values (7,null, 'fav', true, null);
select setval(pg_get_serial_sequence('outfit','outfit_id'),7);


-- event
insert into event (outfit_id , event_name ) values (null, 'graduation ceremony');
insert into event (outfit_id , event_name ) values (null, 'charity fundraiser');
insert into event (outfit_id , event_name ) values (null, 'retirement party');
insert into event (outfit_id , event_name ) values (5, 'film premiere');
insert into event (outfit_id , event_name ) values (null, 'poetry slam');
insert into event (outfit_id , event_name ) values (null, 'political rally');
insert into event (outfit_id , event_name ) values (null, 'anniversary celebration');
insert into event (outfit_id , event_name ) values (null, 'music festival');
insert into event (outfit_id , event_name ) values (7, 'birthday party');
insert into event (outfit_id , event_name ) values (null, 'comedy night');
insert into event (outfit_id , event_name ) values (null, 'fashion show');
insert into event (outfit_id , event_name ) values (null, 'sports tournament');
insert into event (outfit_id , event_name ) values (null, 'engagement party');
insert into event (outfit_id , event_name ) values (null, 'product launch');
insert into event (outfit_id , event_name ) values (null, 'conference');
insert into event (outfit_id , event_name ) values (null, 'art exhibition');
insert into event (outfit_id , event_name ) values (null, 'baby shower');
insert into event (outfit_id , event_name ) values (null, 'book launch');
insert into event (outfit_id , event_name ) values (null, 'wedding ceremony');
insert into event (outfit_id , event_name ) values (null, 'networking event');
insert into event (outfit_id , event_name ) values (4, 'for sleep');
insert into event (outfit_id , event_name ) values (7, 'film premiere');



-- clothing
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 4, 4, 16, 1, 8, 'jeans skirt',E'0x89504e470d0a1a0a0000000d49484452', 'blue', 'spring-summer');
insert into clothing ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 6, 1, 13, 1, 5,'black straight trousers', E'0x89504e470d0a1a0a0000000d49484452', 'black', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 18, 2, 12, 1, null, 'red polka dot dress', E'0x89504e470d0a1a0a0000000d49484452', 'black', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 12, 1, 6, 1, null, 'white shirt', E'0x89504e470d0a1a0a0000000d49484452', 'white', 'spring-summer-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 13, 1, 14, 1, null, 'black jacket', E'0x89504e470d0a1a0a0000000d49484452', 'black', 'spring-summer-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 3, 4, 24, 1, 7, 'sweater with deers', E'0x89504e470d0a1a0a0000000d49484452', 'green', 'winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 7, 7, 21, 1, 10, 'red top', E'0x89504e470d0a1a0a0000000d49484452', 'red', 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 19, 7, 27, 1, 5, 'white nike sneakers',E'0x89504e470d0a1a0a0000000d49484452', 'white', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 15, 4, 9, 1, 6, 'bomber', E'0x89504e470d0a1a0a0000000d49484452', null, 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 16, 4, 1, 1, null, 'blue jeans', E'0x89504e470d0a1a0a0000000d49484452', null, null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 7, 1, 13, 2, 10, 'white trousers',E'0x89504e470d0a1a0a0000000d49484452', 'white', 'spring-summer');
insert into clothing  (brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 9, 7, 23, 2, 8,'sport fabric shorts', E'0x89504e470d0a1a0a0000000d49484452', 'dark blue', 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 3, 5, 18, 3, null, 'black lace briefs', E'0x89504e470d0a1a0a0000000d49484452', 'black', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 10, 4, 19, 2, 7, 'christmas hoodie', E'0x89504e470d0a1a0a0000000d49484452', 'green', 'winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (11, 4, 19, 2, 5, 'oregon hoodie', E'0x89504e470d0a1a0a0000000d49484452', 'yellow', 'winter-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (12, 6, 10, 2, 8, 'lemon swim shorts', E'0x89504e470d0a1a0a0000000d49484452', null, 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (19, 7, 27, 2, 10, 'nike free trainer', E'0x89504e470d0a1a0a0000000d49484452', 'yellow', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (11, 9, 1, 3, null, 'blue painted jeans', E'0x89504e470d0a1a0a0000000d49484452', 'blue', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (11, 1, 14, 3, 12, 'beige jacket', E'0x89504e470d0a1a0a0000000d49484452', 'beige', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (8, 3, 27, 3, 12, 'carpet sneakers', E'0x89504e470d0a1a0a0000000d49484452', 'brown', 'spring-summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (6, 10, 31, 3, 11, 'white turtleneck',E'0x89504e470d0a1a0a0000000d49484452', 'white', 'spring-summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 10, 7, 17, 4,8 ,'flippers', E'0x89504e470d0a1a0a0000000d49484452', 'blue', 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 12, 4, 30, 4,7 , 'knitted vest', E'0x89504e470d0a1a0a0000000d49484452', 'red', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (2, 7, 5, 3, 11, 'beige pants', E'0x89504e470d0a1a0a0000000d49484452', 'beige', 'spring-summer-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (16, 8, 8, 2, 10, 'grey t-shirt',E'0x89504e470d0a1a0a0000000d49484452', 'grey', 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 6, 8, 1, 2, 11, 'black jeans', E'0x89504e470d0a1a0a0000000d49484452', 'black', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (18, 4, 14, 2, 11, 'NASA jacket made of safety reflector',E'0x89504e470d0a1a0a0000000d49484452', null, 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (5, 4, 15, 2, 11, 'leather boots', E'0x89504e470d0a1a0a0000000d49484452', 'black', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (1, 7, 25, 3, 8, 'white cap', E'0x89504e470d0a1a0a0000000d49484452', 'white', 'spring-summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 5, 1, 6, 4, 11, 'white shirt', E'0x89504e470d0a1a0a0000000d49484452', 'white', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (9, 4, 14, 4, 11, 'leather jacket',E'0x89504e470d0a1a0a0000000d49484452', 'black', 'autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 14, 2, 12, 4, 8,'strapless medium dress', E'0x89504e470d0a1a0a0000000d49484452', 'turquoise', 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (10, 4, 13, 3, 5, 'leather pants', E'0x89504e470d0a1a0a0000000d49484452', 'black', 'autumn-winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 4, 2, 17, 4, null, 'louboutins', E'0x89504e470d0a1a0a0000000d49484452', 'black', 'spring-summer-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (null, 3, 1, 4, 12, 'low-waisted flared jeans', E'0x89504e470d0a1a0a0000000d49484452', 'blue', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 5, 9, 29, 4, 5, 'Louis Vuitton scarf', E'0x89504e470d0a1a0a0000000d49484452', 'brown', 'autumn-winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (11, 4, 25, 3, 7, 'speckled sweater like a cow', E'0x89504e470d0a1a0a0000000d49484452', 'white', 'autumn-winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (3, 4, 15, 3, 7, 'beige boots', E'0x89504e470d0a1a0a0000000d49484452', 'beige', 'winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (4, 4, 32, 3, null, 'bag', E'0x89504e470d0a1a0a0000000d49484452', 'black', 'spring-summer-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 17, 4, 24, 4, 7, 'striped sweater', E'0x89504e470d0a1a0a0000000d49484452', null, 'winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (20, 7, 10, 4, 8, 'diving suit', E'0x89504e470d0a1a0a0000000d49484452', 'dark blue', 'summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 7, 4, 19, 5, 7, 'hooded sweatshirt, shoes', E'0x89504e470d0a1a0a0000000d49484452', 'grey', 'autumn-winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (3, 2, 12, 6, 12, 'floral sundress', E'0x89504e470d0a1a0a0000000d49484452', 'pink', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 8, 4, 9, 5, null, 'trench coat', E'0x89504e470d0a1a0a0000000d49484452', 'beige', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (19, 7, 22, 5, null, 'athletic leggings', E'0x89504e470d0a1a0a0000000d49484452', 'black', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 17, 4, 24, 5, 7, 'wool sweater', E'0x89504e470d0a1a0a0000000d49484452', 'cream', 'winter');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values (3, 3, 1, 7, 12, 'high-waisted jeans', E'0x89504e470d0a1a0a0000000d49484452', 'blue', null);
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 16, 1, 12, 9, 10, 'wrap dress', E'0x89504e470d0a1a0a0000000d49484452', 'green', 'spring-summer');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 10, 4, 9, 9, 5, 'parka jacket ', E'0x89504e470d0a1a0a0000000d49484452', 'olive green', 'spring-autumn');
insert into clothing  ( brand_id, style_id, type_id, user_id, weather_id, clothing_name, foto, color, season) values ( 11, 4, 18, 2, null, 'boxers ', E'0x89504e470d0a1a0a0000000d49484452', 'black', null);


-- clothing_outfit
insert into clothing_outfit  (clothing_id, outfit_id) values (13,1);
insert into clothing_outfit  (clothing_id, outfit_id) values (18,1 );
insert into clothing_outfit  (clothing_id, outfit_id) values (19,1);
insert into clothing_outfit  (clothing_id, outfit_id) values (21,1);
insert into clothing_outfit  (clothing_id, outfit_id) values (20,1);

insert into clothing_outfit  (clothing_id, outfit_id) values (13,2);
insert into clothing_outfit  (clothing_id, outfit_id) values (33,2);
insert into clothing_outfit  (clothing_id, outfit_id) values (37,2);
insert into clothing_outfit  (clothing_id, outfit_id) values (38,2);

insert into clothing_outfit  (clothing_id, outfit_id) values (3,3);
insert into clothing_outfit  (clothing_id, outfit_id) values (8,3);

insert into clothing_outfit  (clothing_id, outfit_id) values (50,4);

insert into clothing_outfit  (clothing_id, outfit_id) values (34,5);
insert into clothing_outfit  (clothing_id, outfit_id) values (32,5);

insert into clothing_outfit  (clothing_id, outfit_id) values (17,6);
insert into clothing_outfit  (clothing_id, outfit_id) values (12,6);
insert into clothing_outfit  (clothing_id, outfit_id) values (25,6);

insert into clothing_outfit  (clothing_id, outfit_id) values (1,7);
insert into clothing_outfit  (clothing_id, outfit_id) values (8,7);
insert into clothing_outfit  (clothing_id, outfit_id) values (4,7);







