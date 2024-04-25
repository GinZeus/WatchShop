--create database WatchShop
--use WatchShop
--use master
--drop database WatchShop

create table [Role](
	[role_id] int not null identity(1,1) primary key,
	[role_name] nvarchar(32),
);

--select * from Role
create table [Account](
	[acc_id] int not null identity(1,1) primary key,
	[username] nvarchar(32) ,
	[password] nvarchar(60) ,
	[email] nvarchar(150),
	[status] int,
	[role_id] int,
	[balance] float,
	[create_time] datetime,
	[update_time] datetime,

	FOREIGN KEY (role_id) REFERENCES [Role](role_id)
	
);
create table [User](
	[user_id] int not null  primary key,	
	[fullname] nvarchar(50) ,
	[address] nvarchar(200),
	[phone_number] varchar(20),
	[avatar] varchar(500),
	FOREIGN KEY ([user_id]) REFERENCES [Account](acc_id)
);

create table [Order](
	[order_id] int not null identity(1,1) primary key,
	[user_id] int,
	[fullname] nvarchar(100),
	[phone_number] varchar(20),
	[email] varchar(150),
	[address] nvarchar(250),
	[note] nvarchar(250),
	[order_date] datetime,
	[total] float,
	[status] int,
	[update_time] datetime,
	FOREIGN KEY([user_id]) REFERENCES [User]([user_id])
);

create table [Brand](
	[brand_id] int not null identity(1,1) primary key,
	[brand_name] nvarchar(100),
	[brand_address] nvarchar(100),
	[brand_status] int,
);

create table [Category](
	[cate_id] int not null identity(1,1) primary key,
	[cate_name] nvarchar(100),
	[status] int
);

create table [Product] (
	[p_id] int not null identity(1,1) primary key,
	[product_name] nvarchar(100),
	
	[brand_id] int,
	[quantity] int,
	[rate] float,
	[thumbnail] varchar(500),
	[ori_price] float,
	[sale_price] float,
	[discount] int,
	[status] int,
	[create_time] datetime,
	[update_time] datetime,
	FOREIGN KEY([brand_id]) REFERENCES [Brand]([brand_id]),
	

);

create table [Mid](
	[p_id] int not null,
	[cate_id] int not null,
	FOREIGN KEY([cate_id]) REFERENCES Category([cate_id]),
	FOREIGN KEY([p_id]) REFERENCES Product([p_id])
)

create table [ProductDetail](
	[pdetail_id] int not null  primary key,
	[des] nvarchar(1000),
	[material] nvarchar(100),
	[width] int,
	[duration] float,
	[shape] nvarchar(50),
	[image1] varchar(500),
	[image2] varchar(500),
	FOREIGN KEY([pdetail_id]) REFERENCES [Product]([p_id]),

);
create table [OrderDetails](
	[odetail_id] int not null identity(1,1) primary key,
	[order_id] int,
	[p_id] int,
	[price] float,
	[quantity]  int,
	[i_total] float,
	FOREIGN KEY([order_id]) REFERENCES [Order]([order_id]),
	FOREIGN KEY([p_id]) REFERENCES [Product]([p_id])
);

create table [Feedback](
	[fb_id] int not null identity(1,1) primary key,
	[user_id] int,
	[p_id] int,
	[content] nvarchar(500),
	[rate_s] int,
	[status] int,
	
	[update_time] datetime,
	FOREIGN KEY([user_id]) REFERENCES [User]([user_id]),
	FOREIGN KEY([p_id]) REFERENCES [Product]([p_id])
);

create table [Slider](
	[s_id] int not null identity(1,1) primary key,
	[thumbnail] varchar(500),
	[status] int,
	[content] nvarchar(200),
	[create_time] datetime,
	[update_time] datetime

);

create table [Blog](
	[blog_id] int not null identity(1,1) primary key,
	[title] nvarchar(500),
	[thumbnail] varchar(500),
	[intro] nvarchar(4000),
	[author] nvarchar(50),
	[update_time] datetime,
	[status] int ,
);

create table [BlogDetail](
	[bdetail_id] int not null primary key,
	[header1] nvarchar(500),
	[cont1] nvarchar(4000),
	[image] varchar(500),
	[header2] nvarchar(500),
	[cont2] nvarchar(4000),
	[conclusion] nvarchar(4000),
	[status] int
	FOREIGN KEY([bdetail_id]) REFERENCES [Blog]([blog_id])
);

--Role
insert into [Role](role_name) values ('admin')--1     
insert into [Role](role_name) values ('manage')--2
insert into [Role](role_name) values ('seller')--3
insert into [Role](role_name) values ('customer')--4

-- Account
insert into [Account] ([username],[password],[email],[role_id],[status],[balance],[create_time],[update_time]) 
values('admin','88f4avs9gmoLJnJAZgwp1RVCInA=','hungambrose123@gmail.com',1,2,0,getDate(),getDate())
insert into [Account] ([username],[password],[email],[role_id],[status],[balance],[create_time],[update_time]) 
values('manager','88f4avs9gmoLJnJAZgwp1RVCInA=','datnguyen2572003@gmail.com',2,2,0,getDate(),getDate())
insert into [Account] ([username],[password],[email],[role_id],[status],[balance],[create_time],[update_time]) 
values('seller','88f4avs9gmoLJnJAZgwp1RVCInA=','nguyentri16112003@gmail.com',3,2,0,getDate(),getDate())
insert into [Account] ([username],[password],[email],[role_id],[status],[balance],[create_time],[update_time]) 
values('customer','88f4avs9gmoLJnJAZgwp1RVCInA=','trinmhe176657@fpt.edu.vn',4,2,0,getDate(),getDate())

--User
insert into [User]([user_id],[fullname],[address],[phone_number],[avatar])
values (1,N'Nguyễn Đức',N'Cẩm Phả, Quảng Ninh','0987654321','img/ProfilePicture/buffKangaroo.jpg')
insert into [User]([user_id],[fullname],[address],[phone_number],[avatar])
values (2,N'Nguyễn Viết',N'Thạch Thất, Hà Nội','0987654123','img/ProfilePicture/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.avif')
insert into [User]([user_id],[fullname],[address],[phone_number],[avatar])
values (3,N'Nguyễn Minh',N'Việt Yên, Bắc Giang','0192837465','img/ProfilePicture/possum1.webp')
insert into [User]([user_id],[fullname],[address],[phone_number],[avatar])
values (4,N'Trần Nam',N'Hà Nội','0987527123','img/ProfilePicture/bf6.jpg')

--Category
insert into Category([cate_name],[status])values ('Ladies',1)--1
insert into Category([cate_name],[status])values ('Men',1)--2
insert into Category([cate_name],[status])values ('Couples',1)--3
insert into Category([cate_name],[status])values ('Smart watches',1)--4

--Brand
insert into Brand([brand_name],[brand_address],[brand_status])values('Curnon',N'Việt Nam',1) --1
insert into Brand([brand_name],[brand_address],[brand_status])values('Casio','Japan',1) --2
insert into Brand([brand_name],[brand_address],[brand_status])values('Citizen','Japan',1) --3 -
insert into Brand([brand_name],[brand_address],[brand_status])values('Boss','Germany',1) --4
insert into Brand([brand_name],[brand_address],[brand_status])values('G-Shock','Japan',1) --5
insert into Brand([brand_name],[brand_address],[brand_status])values('Maserati','Italy',1) --6
insert into Brand([brand_name],[brand_address],[brand_status])values('Apple','USA',1) --7
insert into Brand([brand_name],[brand_address],[brand_status])values('Samsung','Korea',1)--8
insert into Brand([brand_name],[brand_address],[brand_status])values('Accurist','British',1)--9 
insert into Brand([brand_name],[brand_address],[brand_status])values('AVI-8','British',1) --10
insert into Brand([brand_name],[brand_address],[brand_status])values('Ben Sherman','British',1)--11 
insert into Brand([brand_name],[brand_address],[brand_status])values('CALVIN KLEIN','USA',1) --12
insert into Brand([brand_name],[brand_address],[brand_status])values('Continental','Germany',1) --13
insert into Brand([brand_name],[brand_address],[brand_status])values('Ducati','Italy',1) --14
insert into Brand([brand_name],[brand_address],[brand_status])values('Ebel','Switzerland',1) --15
insert into Brand([brand_name],[brand_address],[brand_status])values('Diesel On','Italy',1) --16
insert into Brand([brand_name],[brand_address],[brand_status])values('JDM Military','Switzerland',1)--17 



-- Product
insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('KASHMIR RISE',1,'img/product/product1_thumb.jpg',20,100,140,5,0,1,GETDATE(),getDate())

insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('Ladies Citizen Eco-Drive Bracelet Watch',3,'img/product/product2_thumb.jpg',20,250,290,5,0,1,GETDATE(),getDate())

insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('GM-2100B-3ADR x GM-S2100-3ADR',5,'img/product/product3_thumb.jpg',20,230,272,5,0,1,GETDATE(),getDate())


insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('Continental Chronograph Watch',13,'img/product/product4_thumb.jpg',20,240,280,5,0,1,GETDATE(),getDate())

insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('Maserati Attrazione',6,'img/product/product5_thumb.jpg',20,400,430,5,0,1,GETDATE(),getDate())

insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('BOSS Atea',4,'img/product/product6_thumb.jpg',20,300,350,5,0,1,GETDATE(),getDate())

insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )
values ('Apple Watch Series 3',7,'img/product/product7_thumb.jpg',20,400,450,5,0,1,GETDATE(),getDate())

--Mid
insert into [Mid] (p_id,cate_id) values (1,2)
insert into [Mid] (p_id,cate_id) values (2,1)
insert into [Mid] (p_id,cate_id) values (3,1)
insert into [Mid] (p_id,cate_id) values (3,2)
insert into [Mid] (p_id,cate_id) values (3,3)
insert into [Mid] (p_id,cate_id) values (4,2)
insert into [Mid] (p_id,cate_id) values (5,2)
insert into [Mid] (p_id,cate_id) values (6,1)
insert into [Mid] (p_id,cate_id) values (7,4)

--Product Detail
insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (1,'Curnon Kashmir Rise mens watch carries the attractive, strong, and masculine beauty of a man; Metal strap, scratch-resistant Sapphire glass, 3ATM water resistance...','Steel',40,'Circle',17520,
'img/product/product1_1.jpg',
'img/product/product1_2.jpg')

insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (2,'Citizen Eco-Drive Crystals EM1022-51D is an incredible attractive Ladies watch from Eco-Drive Crystals collection. Case material is Stainless Steel while the dial colour is Mother of pearl. This model has got 50 metres water resistancy - it can be submerged in water for periods, so can be used for swimming and fishing. It is not recommended for high impact water sports. We ship it with an original box and a guarantee from the manufacturer.'
,'Gold',34,'Circle',17520,
'img/product/product2_1.jpg',
'img/product/product2_2.jpg')

insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (3,'','Steel',44,'Circle',17520,
'img/product/product3_1.jpg',
'img/product/product3_2.jpg')

insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (4	,'Guess Continental GW0260G2 is a practical and very impressive Gents watch from Sport collection. Case is made out of Stainless Steel and the Black dial gives the watch that unique look. ',
'Gold',44,'Circle',17520,
'img/product/product4_1.jpg',
'img/product/product4_2.jpg')

insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (5	,'Maserati Attrazione R8851126003 is a practical and attractive Gents watch from Attrazione collection.','Stainless Steel',43,'Circle',17520,
'img/product/product5_1.jpg',
'img/product/product5_2.jpg')

insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (6	,'BOSS ladies multifunction watch from the Atea family.','Stainless Steel',38,'Circle',17520,
'img/product/product6_1.jpg',
'img/product/product6_2.jpg')

insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])
values (7	,'The third generation of Apple Watch does anything you throw at it.','Ion-X glass & Fluoroelastomer',40,'Rectangular',48,
'img/product/product7_1.jpg',
'img/product/product7_2.jpg')

--Feedback



-- Slider
insert into [Slider] ([thumbnail], [content], [status], [create_time], [update_time])
values ('https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=600', 'Limited time offer: Enjoy 5% off on all orders!', 1, GETDATE(), GETDATE());

insert into [Slider] ([thumbnail], [content], [status], [create_time], [update_time])
values ('https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'Limited time offer: Enjoy 5% off on all orders!', 1, GETDATE(), GETDATE());

insert into [Slider] ([thumbnail], [content], [status], [create_time], [update_time])
values ('https://images.pexels.com/photos/1120275/pexels-photo-1120275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'Limited time offer: Enjoy 5% off on all orders!', 1, GETDATE(), GETDATE());


-- Blogs
insert into [Blog]([title],[author],[intro],[thumbnail],[update_time],[status])
values ('A Deep Dive Into the New Pelagos FXD From Tudor – Literally',
'Roger Ruegger',
'The third iteration of the Pelagos FXD from Tudor (ref. M25717N-0001) 
comes with a matt black dial and is dedicated to the countless dive watches that 
were issued in the past to US Navy Sailors. The 42-mm dive watch is equipped with fixed
(“FXD”) strap bars, a satin-brushed titanium case with a water resistance of 200m, 
a COSC-certified in-house movement and a unidirectional elapsed-time rotating bezel,
the black dial features a single line of red text with the model’s name.',
'img/Blog/Vintage_Tudor_Submariners_SEAL_Team_One_Florida_2023-1024x576.jpg'
,
getDate(),1),
('Rule #1 When Buying Watches (And Also When Writing About Them)','Roger Ruegger'
,'When I first got to see press pictures of the new 2067 and 2057 from Breguet, I was pretty sure that I wouldn’t be the one to fall in love with the “mint green shade” featured on the Arabic numerals, hands and bezel of the 2057. After having seen and briefly worn one last Wednesday, it turns out I will have to change my hypothetical order from my initial favorite, the 2067, to the military-inspired version:'
,'img/Blog/Breguet_Type_20_Military_Frontal_Paris_2023.jpg'
,
getDate(),1),
('Green Rambles: The Vacation Watch Dilemma','Martin Green'
,'During this time of year, most people are taking their summer vacations. The fun of this always starts with the preparations; where are we going this year, what can we see there, what are good places to eat, and when you are a watch enthusiast…. what watch am I going to wear?'
,'img/Blog/DOXA_Press_SUB_300T_divingstar_879.10.361.10-1024x1148.jpg'
,
getDate(),1),
('Reversible Watches: The One You Know and Others You Don’t','Balazs Ferenczi'
,'For many people, a watch is not only an accessory that tells time; after all, numerous other devices surrounding us can do that today. It is also a piece of art, jewelry, perhaps a status symbol — maybe even equipment, as well; from divers’ watches to chronographs with pulsation scales on their bezels for specific purposes, the list is long.  Then you have those watches that people wear all the time, even while playing sports.'
,'img/Blog/Jaeger-LeCoultre_Reverso_560.jpg'
,
getDate(),1),
('What Did Divers Use Before There Were Dive Watches?','Roger Ruegger'
,'When Rolex and Blancpain launched their first wristwatches for divers in the early 1950s they did, in fact, create the archetype of the modern dive watch, thanks to the development of the quintessential rotating bezel. However, they did not invent the first watch used by divers.'
,'img/Blog/watches-find-your-breitling-diving-watches-2.jpg'
,
getDate(),1)


-- Blog Detail

insert into [BlogDetail]([bdetail_id],header1,cont1,[image],header2,cont2,[conclusion],[status])
values
(1,'Tudor and the US Navy',
'The US Navy issued Tudor diving watches for decades starting in the latter years of the ‘50s. The watches were used by SEAL teams from their commissioning in 1962 all the way the late ‘80s. They have also served Sailors in all types of underwater roles, including UDTs, Seabees and Navy dive school instructors. Throughout the decades, Tudor has supported the US Navy as a supplier of issued watches. In the 1965 “First Edition” of the Underwater Demolition Team Handbook, for example, a Tudor Oyster Prince Submariner ref. 7928 is pictured next to the “Diving Watch” paragraph. The handbook was an essential piece of literature for new operators as they studied UDT operational procedures. Later, in 1973, the US Navy Diving manual lists the Tudor Oyster Prince Submariner references 7016 and 7021 as “Navy-approved” diving watches. In 1974, the National Stock Number system was introduced to track the supply system of the US Department of Defense. From 1978, under code 6645-01-068-1088, a supply officer could purchase and issue a Tudor Oyster Prince Submariner reference 9411, or later 76100, to an approved sailor or operator in need of a reliable Navy-approved dive watch.',
'img/Blog/Tudor_Pelagos_FXD_Wristshot_Diving_Florida_2023.jpg'
,
'Fast forward to 2023:',
'The Pelagos FXD’s satin-brushed case (42mm in diameter, 12.75mm thick, 52mm from lug to lug) has fixed strap bars, which are directly machined into the main body of the titanium case, a key to the model’s characteristic silhouette. Another feature of this variant is the 60-notch rotating bezel, here unidirectional with a luminescent material-filled 60-minute-graduated ceramic insert with a traditional dive scale. Historically, the US Navy oftentimes had their divers fit their Tudor watches with fabric straps, typically one-piece ones in black or green made out of nylon. The Pelagos FXD comes with two straps: A one-piece green fabric strap with red central thread and self-gripping fastening system, and an additional dark grey embossed fabric-motif one-piece rubber strap. The 22-mm one-piece fabric strap has become one of the hallmarks of Tudor. It is produced in France on 19th century Jacquard looms by the Julien Faure company in the St-Etienne region. Movement is the Calibre MT5602 with a non-magnetic silicon hairspring and certified as a chronometer by the Swiss Official Chronometer Testing Institute (COSC). Another notable feature is the power reserve of about 70 hours when fully wound.',
'The Pelagos FXD is priced at $4,150 and available immediately.'
,1),
(2,'Mind you, the press pictures I had received from Breguet couldn’t have been of a better quality, but they just did not show the, for the lack of a better word, “full picture,” which includes so much more than one photo can transport. Thankfully, I know that very well by now, which is another reason why I always try to take hands-on photos and videos for my articles. More importantly, I have a rule to never judge a watch before I have seen it the flesh.'
,'Or even better, have worn it, ideally over a couple of days, should I intend to do a review. The same rule applies when buying a watch: watches tend to look different in real life, and, quite often, some releases also grow on me over time: When I first saw the Bathyscaphe from Blancpain in Basel ten years ago, for example, I wasn’t blown away. Now guess which watch has not only become one of Blancpain’s bestsellers, but also been on top of my list for the last eight years? – Exactly (still undecided between the chronograph with “tropical green” dial, the 1315-powered titanium version with brushed dial or the automatic with a black ceramic case). A new design requires time to be appreciated and explored, and quite often, that process starts with a bit of friction.'
,'img/Blog/Breguet-Type-XX-2067-lifestyle.jpg'
,'In the case of Breguet’s new Type XX, the brand stated that “four years of preparation preceded the arrival of the new generation of iconic Type XX,” mostly because of the development of the new self-winding Calibre 728 for the civilian version and Calibre 7281 for the military version.'
,'With the two unique watches made for Only Watch, the Type XX Only Watch 2021 (Ref. 2065ST/Z5/398) and the Type 20 Only Watch 2019 (Ref. 2055ST/Z5/398), both powered by restored Valjoux 235 movements, Breguet thankfully gave us a rare glimpse of what was to become a celebration of the anniversary of the Type XX’s “almost 70 years” with the release of the aforementioned 2067 and 2057 this week. Which means that a number of employees at Breguet started working on the new Type XX, even before the first human cases of COVID-19 had been identified. In other words: while the average watch collector has had a couple of days to learn about the latest novelties from Breguet by now, others have already spent years going over every detail, and, ultimately, getting accustomed to the final design of the watch. As a result, brands, retailers, journalists and customers often have very different timelines. The same applies when you switch roles: If a watch was, let’s say, on the market for two years, and didn’t meet the management’s expectations, the same executives may have had already six years with that watch when they consider pulling it, while potential customers still contemplate about what watch might have to go to fund it. Give it time.'
,'Good thing is that I have about four more weeks until I plan to hand in my Type XX article for the upcoming issue, and there is a real chance you, too, will have been able to see these two watches at selected retails partners of Breguet by then, since the brand made sure to already deliver the first watches (or you’ll see them at WatchTime New York in October). I’m curious to see how my last paragraph will turn out.'
,1),
(3,'Personally, it is in particular this last question that comes with some stress, surprisingly.'
,'Once we have settled on a destination, accommodation and have explored what activities we want to do, I can ponder weeks, if not months, about what watch to take with me. On a normal day, I switch watches at least three times a day. In part this is because they are my profession and I need to test quite a few of them, but on vacation, I don’t permit myself that luxury. I am also very hesitant to travel with more watches than the one on my wrist as I am both not too keen on hotel safes, and further know that for many countries’ customs— what we call a vacation, they see as import/export, with all the unpleasant fees that come with the declaration.'
,'img/Blog/Bell-Ross.jpg'
,'As if picking just one watch to travel with isn’t already challenging enough, I am a big fan of dress watches but like active vacations— not the most ideal combination. I also like to avoid precious metals when traveling due to the unwanted attention they can attract at some destinations. I love some excitement during my holiday, but being robbed isn’t one of them. The good thing is that it brings me a bit out of my comfort zone and challenges me to try new types of watches.'
,'An obvious solution as a watch journalist is to simply vacation with a loaner. While I have done this a few times, it proved less than ideal. First of all, my girlfriend is not too keen when we have to stop in the craziest places as I see a photo opportunity with the watch I’m reviewing. Secondly, I tend to be even more careful with watches that aren’t mine, and while usually nothing bad happens, you tend to be paying more attention to this aspect. Both are ingredients for making the vacation slightly less relaxing, the opposite of what it is supposed to be.'
,'So what am I wearing this year? I don’t know yet, but I do know that exploring all options is, to me, as much fun as selecting the vacation itself. It is part of the anticipation process and after all, a big decision, at least when you are a watch enthusiast!'
,1),
(4,'Most of us know the history of Jaeger-LeCoultre’s Reverso and its connection to British polo players. But have you heard about Cartier’s Basculante or Universal Genève’s Cabriolet? Read on!'
,'For those of you who don’t know the story: Jaeger-LeCoultre introduced the Reverso in 1931 after numerous British officers stationed in India allegedly complained that their watches broke too frequently during their heated polo matches. Jaeger-LeCoultre devised a design in which the case with the movement is housed in a separate, outer “frame.” This case could be pulled to the side and flipped over so the crystal could be faced towards the wrist, thus protecting it from impacts. Swiss watchmaking met British Colonial high society with these reversible Jaeger-LeCoultre watches. 
Jaeger-LeCoultre Reverso
The Reverso is probably reversible watch that is best known by a wider audience. However, Jaeger-LeCoultre was not the only company to produce these types of timepieces. In fact, according to history, another brand’s model was introduced even before the Reverso — namely, the Universal Genève Cabriolet. Universal Genève presented its model in 1929. The Cabriolet also has a square case that sits in an outer frame, but in this case the crown is at the 6 o’clock position. Above 12 o’clock there is a little screw that allows the wearer to snap the case out, turn it 180 degrees, than snap it back into the outer frame, securing it with the crown. Whether the brand was also planning to launch a watch for polo players, or whether it was only a coincidence is unknown to me, but it is very interesting nonetheless that two of the major brands of that era came up with such similar designs so close together.'
,'img/Blog/Cartier_Basculante_angle_560.jpg'
,'History, however, is even more interesting than that. Not long after the Cabriolet and the Reverso debuted in 1932  jeweler and watchmaker Cartier launched its answer to the rectangular dress/sports watch challenge, the Basculante (actually, the company states on its website that the year was 1933, but we have evidence that it came out before that). Explaining how the Cartier Basculante works is a little difficult, so I will let the picture below do the talking.'
,'Universal Genève’s mechanism was, and still is, so popular that a few other watch companies took the idea, changed it a bit and released watches very similar to the Cabriolet. The Rotary Revelations has three little pins on the top of the case and a crown for each dial at 3 and 9 o’clock. You can snap the case out at 12 o’clock (there is a screw that fixes the watch at 6 o’clock), rotate it and snap it back into the frame at 12 o’clock with the three pins securing it into the case. The process is almost the same in the Chronoswiss Cabrio. Here, the screw that holds the watch case to the frame is at 12 and a rivet is at 6 o’clock. After rotating the case, this rivet needs to be snapped into a little latch on the outer frame, locking the watch case.'
,'So, within three years, between 1931 and 1933, three very similar yet completely different reversible watches launched, marking a milestone in watchmaking and setting the foundations for future designs. In the years since, watch manufacturers from TAG Heuer to Omega have developed similar projects, some using the reversible feature to create two-faced watch, some simply paying homage to the original idea. Without a doubt, Jaeger-LeCoultre’s Reverso is still the most famous among all of these. However I find it very fascinating that if we dig a little deeper into the history of one model, a whole new world of watches we’ve never heard of opens up in front of our eyes. But then again, that is why we love vintage watches.'
,1),
(5,'If we travel back in time, we find that World War II (and, especially, the frogmen of the Italian Navy) demonstrated the potential of underwater warfare and thus the need for salvage.'
,'This, in turn, further increased the need for water-resistant watches in order to better conduct underwater missions involving timing and navigation. The 1940s marked the introduction of various water-resistant watches and, of course, the canteen-style watches that were equipped with little more than an additional crown cap for increased water resistance. Earlier, in the 1930s, there was Panerai supplying the Italian naval divers with various instruments as well as (in cooperation with Rolex) some of the first specifically developed watches for divers. Four years before that, and in a much more civilian environment, Omega launched the rectangular Marine, with a patented double sliding and removable case, which was (at least theoretically) water-resistant to a depth of more than 100 meters. Because of these attributes, the Marine was successfully used by underwater pioneers such as William Beebe (up to 14 meters) and Yves Le Prieur. But we still have to travel a bit further back to get to the beginning: In the 1920s, watch companies had already introduced various types of water-resistant watch cases for the increasingly popular wristwatch or “wristlet,” with the Rolex Oyster case as the most prominent example thanks to Mercedes Gleitze’s heavily advertised record swim. But the world beneath the deep, and with it the diver as a target audience, was basically nonexistent to the watch industry, as was the concept of horizontal, autonomous movement underwater.'
,'img/Blog/Hard_Hat_Pocket_Watch_Case_560.jpg'
,'It was the era of the hard hat diver.'
,'From the 1820s on, a few brave men started to walk on the seafloor using inventions that were initially intended for firefighting. Air was constantly supplied from the surface, and measuring time underwater was most likely not these men’s first priority. An increase in deep-sea exploration and the ongoing industrialization of diving led to the first autonomous diving helmets in the early 20th century, and with these also came an increased need for the diver to know how much time he spent underwater. The watch industry was already experimenting with water-resistant pocket watches for different reasons, and the idea of an external pocket watch on a diver’s suit thankfully was not pursued, given the physically demanding tasks performed by the divers.  The solution was much simpler: Divers mounted pocketwatches on the inside of their diving helmets, so that they always had the time in their sight, right next to the depth meter. One way of doing this was by affixing a second watch case to the helmet first (as pictured), so that the watch itself could be removed whenever needed.'
,'So, the first thing a diver saw and heard after the command, “Hat the diver!” was a ticking pocketwatch on the inside of his helmet, which hopefully never got wet.'
,1)

