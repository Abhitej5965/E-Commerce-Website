create database capstone_db_c7_g3;
use capstone_db_c7_g3;
CREATE TABLE cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
);


CREATE TABLE discount
(
    id character varying(255) NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
);

CREATE TABLE product_category
(
    category_id integer NOT NULL,
    category_name character varying(255) ,
    category_type integer,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
);

ALTER TABLE `product_category` 
CHANGE COLUMN `category_id` `category_id` INT NOT NULL AUTO_INCREMENT ;


CREATE TABLE product_info
(
    product_id character varying(255)  NOT NULL,
    product_name character varying(255)  NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_stock integer NOT NULL,
    product_description character varying(255) ,
     product_icon character varying(255) , 
     product_status integer DEFAULT 0,
    category_type integer DEFAULT 0,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
);

CREATE TABLE users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) ,
    email character varying(255) ,
    name character varying(255) ,
    password character varying(255) ,
    phone character varying(255) ,
    role character varying(255) ,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
);

ALTER TABLE `users` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) ,
    buyer_email character varying(255) ,
    buyer_name character varying(255) ,
    buyer_phone character varying(255) ,
    create_time timestamp,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
);

ALTER TABLE `order_main` 
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE product_in_order
(
    id bigint NOT NULL AUTO_INCREMENT,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255)  NOT NULL,
    product_icon character varying(255) ,
    product_id character varying(255) ,
    product_name character varying(255) ,
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        ,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
);



CREATE TABLE wishlist
(
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp ,
    user_id bigint,
    product_id character varying(255),
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_wish_Fkey FOREIGN KEY (user_id)
        REFERENCES users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE `discount`
ADD COLUMN user_email VARCHAR(255);

ALTER TABLE `discount` 
ADD INDEX `user_email_fkey_idx` (`user_email` ASC);
;
ALTER TABLE `discount` 
ADD CONSTRAINT `user_email_fkey`
  FOREIGN KEY (`user_email`)
  REFERENCES `users` (`email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `discount` 
DROP PRIMARY KEY;
;

ALTER TABLE `discount` 
ADD COLUMN `coupon` VARCHAR(255) NULL AFTER `user_email`,
CHANGE COLUMN `id` `id` BIGINT NOT NULL ,
ADD PRIMARY KEY (`id`);
;

ALTER TABLE `discount` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



INSERT INTO product_category VALUES (1, 'Certains', 0, '2022-07-12 19:03:26', '2022-07-12 19:03:26');
INSERT INTO product_category VALUES (2, 'Sofas', 1, '2022-07-12 19:03:27', '2022-07-12 19:03:27');
INSERT INTO product_category VALUES (3, 'Wall Shelves', 2, '2022-07-12 19:03:27', '2022-07-12 19:03:27');
INSERT INTO product_category VALUES (4, 'Metal Wall Art', 3, '2022-07-12 19:03:28', '2022-07-12 19:03:28');

INSERT INTO product_info VALUES ('C01','Blue Polycotton Curtain',3149,25,'Blue Polycotton Light Filtering 5 Feet Eyelet Curtain (Set of 2)','https://ii1.pepperfry.com/media/catalog/product/b/l/800x880/blue-semisheer-polycotton-5-feet-eyelet-window-curtain-set-of-2-by-curtain-label-blue-semisheer-poly-tuxtht.jpg',0,0,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('C02','Beige Polyester Floral',712,50,'Skyloom 100% Premium Fabric Floral Self Design Maroon Color Curtain','https://ii1.pepperfry.com/media/catalog/product/r/e/800x880/red-100--premium-fabric-floral-self-design-door-curtain-by-skyloom-red-100--premium-fabric-floral-se-3syftk.jpg',0,0,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('C03','Silver Polycotton Light Curtain',3129,100,'Stylish. Modern. Rustic. Curtains','https://ii1.pepperfry.com/media/catalog/product/c/r/800x880/cream-semisheer-polycotton-5-feet-pleat-window-curtain-set-of-2-by-curtain-label-cream-semisheer-pol-zlv6bs.jpg',0,0,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('C04','Grey Polyester Solid Curtain',2319,29,'Easy to wash and maintain, this curtain is worth investing in.','https://ii1.pepperfry.com/media/catalog/product/g/r/800x880/grey-polyester-solid-9ft-sheer-eyelet-2-pc-door-curtains-by-deco-window-grey-polyester-solid-9ft-she-59856v.jpg',0,0,'2022-07-12 19:03:26','2022-07-12 19:03:26');

INSERT INTO product_info VALUES ('S01','Dreamer Single Seater Sofa',10810,78,'Fabric does not lose color with rubbing','https://ii1.pepperfry.com/media/catalog/product/d/r/800x880/dreamer-single-seater-sofa-in-smoke-grey-colour-by-wakefit-dreamer-single-seater-sofa-in-smoke-grey--ipbjzo.jpg',0,1,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('S02','Napper Single Seater Sofa',8747,85,'Frame material: Neem wood, Support material: MDF & plywood','https://ii1.pepperfry.com/media/catalog/product/n/a/800x880/napper-single-seater-sofa-in-omega-blue-colour-by-wakefit-napper-single-seater-sofa-in-omega-blue-co-aflikg.jpg',0,1,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('S03','Brawny Single Seater Sofa',12900,67,'The sofas attributed to this style have a streamlined form with low','https://ii1.pepperfry.com/media/catalog/product/b/r/800x880/brawny-single-seater-sofa-in-blue-colour-by-hometown-brawny-single-seater-sofa-in-blue-colour-by-hom-ezglu1.jpg',0,1,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('S04','Exuberance 1 Seater Single Size ',5185,88,' The sofa come bed can be placed in your living room, bed room','https://ii1.pepperfry.com/media/catalog/product/e/x/800x880/exuberance-1-seater-single-size-8-inch-sofa-cum-foldable-mattress-exuberance-1-seater-single-size-8--qtfwu2.jpg',0,1,'2022-07-12 19:03:26','2022-07-12 19:03:26');

INSERT INTO product_info VALUES ('W01','Wood Wall shelf',1499,52,'Decorate your walls with these well designed and ergonomic wall shelves','https://ii1.pepperfry.com/media/catalog/product/e/n/800x880/engineered-wood-wallshelf-in-brown-colour-engineered-wood-wallshelf-in-brown-colour-ywiphe.jpg',0,2,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('W02','Marcus Wood & Metal Wall Shelf',849,103,'Decorative metal and wooden hanging wall shelves','https://ii1.pepperfry.com/media/catalog/product/m/a/800x880/marcus-wood---metal-wall-shelf-in-white-set-of-2-by-klaxon-marcus-wood---metal-wall-shelf-in-white-s-cqeaun.jpg',0,2,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('W03','Siramika Sheesham Book Shelf',3858,90,'Siramika Sheesham Wood Book Shelf in Provincial Teak Finish by Wooden Mood','https://ii1.pepperfry.com/media/catalog/product/s/i/800x880/siramika-sheesham-wood-book-shelf-in--provincial-teak-finish--by-wooden-mood-siramika-sheesham-wood--kbzbeb.jpg',0,2,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('W04','Wood Wall Mounted Set Top Box',699,200,'Available in a variety of styles and designs, you can use them to organise your essentials or display decorative items','https://ii1.pepperfry.com/media/catalog/product/h/o/800x880/home-sparkle-brown-engineered-wood-set-top-box-holder-home-sparkle-brown-engineered-wood-set-top-box-5xdo1n.jpg',0,2,'2022-07-12 19:03:26','2022-07-12 19:03:26');

INSERT INTO product_info VALUES ('M01','Iron Decorative Flower',2496,80,'This astoundingly designed Metal Art is durable and unique looking','https://ii1.pepperfry.com/media/catalog/product/f/l/800x880/floral--wall-art-by-the-shining-rays-floral--wall-art-by-the-shining-rays-xznltg.jpg',0,3,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('M02','Iron Abstract Wall Art',1539,99,'Metal Wall Hanging Excellent home decor','https://ii1.pepperfry.com/media/catalog/product/e/t/800x880/etched-wall-decor-by-the-shining-rays-etched-wall-decor-by-the-shining-rays-oxigyl.jpg',0,3,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('M03','Iron Abstract Wall Art ',3952,500,'A perfect choice for for Living Room and bed room wall painting','https://ii1.pepperfry.com/media/catalog/product/m/e/800x880/metal-mandala-with-led-by-the-shining-rays-metal-mandala-with-led-by-the-shining-rays-13l500.jpg',0,3,'2022-07-12 19:03:26','2022-07-12 19:03:26');
INSERT INTO product_info VALUES ('M04','Wrought Iron Butterfly Wall Art',999,90,'Add oodles of class to your roomwall by picking from our creative range of wall hangings','https://ii1.pepperfry.com/media/catalog/product/c/o/800x880/copper-iron-contemporary-butterfly-wall-decor-by-malik-design-copper-iron-contemporary-butterfly-wal-u88kly.jpg',0,3,'2022-07-12 19:03:26','2022-07-12 19:03:26');

INSERT INTO users VALUES (1, true, 'Plot 456, Nargarjuna Nagar, Delhi', 'adminc7g3@gmail.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');




