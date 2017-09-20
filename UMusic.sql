--use UMusic;
----user table--
--create table tb_admin (
--	adminId int identity(1,1) primary key not null,
--	adminName varchar(50) not null,
--	password varchar(50) not null,
--	adddate datetime 
--)
--create table tb_user(
--	UserId int identity(20170101,1) primary key not null,
--	UserName nvarchar(50) not null,
--	phone varchar(50) not null,
--	email varchar(50) not null,
--	password varchar(50) not null,
--	createDate date default getdate() not null--it's a default date system made
--)


----user details table--
-- create table tb_userDetails(
-- 	userDetailsId int identity(1,1) not null,
-- 	userId int  not null,
-- 	gender nvarchar(50) not null,
-- 	birthday date not null,
-- 	nickname nvarchar(50)not null,--the nick name user make for them
-- 	location nvarchar(50) not null -- where are the user come from
-- ) 
-- alter table tb_userdetails add constraint FK_userid foreign key(userId) references tb_user(userId)
-- alter table tb_userdetails add constraint PK_userdetailsid primary key(userDetailsId) 


----insert into tb_user(username,phone,email,password) values('sheeran','15109343434','jakghjkdf@qq.com','1231231')

----album table--
----insert tb_aritist and tb_genre first 
--create table tb_album(
--	albumId int identity(110000,1) primary key not null,
--	albumName varchar(50) not null,--the album name
--	genreId int not null,--foreign key  of tb_genre
--	artistId int not null,
--	locationId int not null,
--	addDate date default getdate() not null,--the time of album add
--	price float not null,--the price each album take 
--	imagesUrl varchar(50) not null ,--the album cover 
--	status nvarchar(50) not null,--mark the status such as 'remove the album' , 'add new album'...etc 
--	description nvarchar(50) not null,--the decription of album
--	leftNum int not null --for describing the storage 
--);
----drop table tb_album
--alter table tb_album drop column description
--alter table tb_album add description ntext not null;
--alter table tb_album add releaseDate date 

				 
----genre table--
--create table tb_genre(
--	genreId int identity(210000,1) primary key not null,
--	genreName varchar(50) not null
--)
----artist table--
--create table tb_artist(
--	artistId int identity(310000,1) primary key not null,
--	artistName varchar(50) not null,
--	imageUrl varchar(50) not null,--the artist's picture 
--	decription text not null -- the information of artist
--)

--alter table tb_artist add localId int not null constraint FK_A_localId foreign key(localId) references tb_local(localId)
----location table--
--create table tb_local(
--	localId int identity(86001,1) primary key not null,
--	localName nvarchar(50)
--)

--alter table tb_album add constraint FK_artistid foreign key(artistId) references tb_artist(artistId);
--alter table tb_album add constraint FK_genreid foreign key(genreId) references tb_genre(genreId);
--alter table tb_album add constraint FK_locationId foreign key(locationId) references tb_local(localId);

----select * from tb_local
----drop table tb_local
----alter table tb_local add constraint FK_localId foreign key(localId) references tb_local(localId)
----single song table--
--create table tb_singleSong(
--	songId int identity(410000,1) primary key not null,
--	albumId int not null,
--	songName nvarchar(50),
--	duration varchar(50)--length of each song
--)
--alter table tb_singleSong add constraint FK_s_albumId foreign key(albumId) references tb_album(albumId)
----order table--
--create table tb_order(
--	orderId int identity(40000,1) not null primary key,
--	orderdate date default getdate() not null,
--	orderStatus nvarchar(50) not null,
--	createDate date default getdate() not null,
--	total float not null --the total charge
--)

--create table tb_orderDetails(
--	orderDeatilsId int  identity(510000,1) primary key not null,
--	orderId int not null,
--	albumId int not null,
--	quantity int not null,
--	unitprice float not null
--);
--alter table tb_orderDetails add constraint FK_orderId foreign key(orderid) references tb_order(orderId);
--alter table tb_orderDetails add constraint FK_o_albumId foreign key(albumid) references tb_album(albumid);

----table cart--
--create table tb_cart(
--	cartId int identity(1,1) primary key not null,
--	userId int not null
--)
--alter table tb_cart add constraint FK_Ca_userid foreign key(userId) references tb_user(userid)

--create table tb_cartDetails(
--	cartDetailsId int identity(1,1) primary key not null,
--	cartId int not null,
--	albumId int not null,
--	quantity int not null
--)
--alter table tb_cartDetails add constraint FK_cartId foreign key(cartId) references tb_cart(cartId)
--alter table tb_cartDetails add constraint FK_C_albumId foreign key(albumId) references tb_album(albumId)
--alter table tb_cartDetails add constraint DF_quantity default(1) for quantity


----table advice--
--create table tb_advice(
--	adviceId int primary key identity(1,1) not null,
--	userId int not null,
--	content ntext not null,
--	createDate date default getdate() not null
--)
----drop table tb_advice
--alter table tb_advice add constraint FK_A_userid foreign key(userId) references tb_user(userid)
----collection table--
--create table tb_collection(
--	collectionId int primary key identity(1,1) not null,
--	albumId int not null,
--	userid int not null,
--)
--alter table tb_collection  add constraint FK_C_userid foreign key(userId) references tb_user(userId)
--alter table tb_collection  add constraint FK_Col_albumId foreign key(albumId) references tb_album(albumId)




--insert information
--use UMusic
--select * from tb_album
--select * from tb_genre
--select * from tb_artist
--select * from tb_local

--insert into tb_local values(N'欧美'),(N'华语'),(N'日本'),(N'韩国')
--insert into tb_genre values(N'流行'),(N'摇滚'),(N'乡村'),(N'纯音')
--insert into tb_artist values(N'Adele','..\imgs\artist\Adele.jpg',N'2008年，阿黛尔发行了首张专辑《19》，获得当年水星音乐奖提名，并在全球取得了超过900万的销售量。其中的单曲《Chasing Pavements》助其获得格莱美最佳新人和最佳流行女歌手两座大奖。2011年，阿黛尔推出第二张录音室专辑《21》，拥有三支冠军单曲。该专辑全球销量突破3200万，是21世纪全球销量最高的录音室专辑，被Billboard官网评为史上最伟大的专辑第一位',86001);
--insert into tb_artist values(N'Aimer','..\imgs\artist\aimer.jpg',N'2011年度日本乐坛话题新人Aimer于2011.9.7发售出道1st单曲「六等星の夜 / 悲しみはオーロラに / TWINKLE TWINKLE LITTLE STAR」。「六等星の夜」作为富士电视台热门动漫「未来都市NO.6」ED曲被日本网友誉为“神曲”，只要听过一次Aimer的 ハスキー・ヴォイス（husky voice）就无法再忘记那独一无二的声音了。',86003);
--insert into tb_artist values(N'Avril.Lavigne','..\imgs\artist\avril-lavigne.png',N'艾薇儿·拉维尼（Avril Lavigne），加拿大著名流行女歌手、摇滚小天后、歌曲创作者及演员。 2002年并以歌曲《Skater Boy》出名。其后的专辑《Let go》与《The Best Damn Thing》在数个国家的音乐排行榜上达到最前列。2006年入选《加拿大商业杂志》在好莱坞最有影响力的加拿大人（排行第17位）。2010年担任温哥华冬奥会闭幕式嘉宾，同年为迪士尼电影《爱丽丝梦游仙境》献唱主题曲《Alice》。2011年3月8日发布新专辑《Goodbye Lullaby》。Avril对音乐、时尚、个性以及性感的定义被年青人所普遍接受和模仿，是乐坛的领军人物。其积极向上，充满乐观的精神一直被大家所支持的。',86001);
--insert into tb_artist values('Back Number','..\imgs\artist\back-number.jpg',N'back number（バックナンバー），日本新生代乐团，由清水依与吏（主唱/吉他手/词曲创作）、小岛和也（贝司手）、栗原寿（鼓手）三位男性音乐人组成，唱片公司是日本环球唱片，2011年4月6日以单曲《花瓣》出道。6月发行第2张单曲《花束》，引起巨大反响，10月发行首张大碟《SUPER STAR》获得ORICON公信榜初登场4位，年底在第25届日本唱片大赏最佳新人歌手（ベスト5ニュー・アーティスト)中受赏。2012年相继发表《恋》、《星期天》等多首单曲，并在著名音乐节目Music Station中出演，以描写恋爱、青春等歌词加上优美的旋律配合摇滚式的编曲获得极大好评。',86002);
--insert into tb_artist values('BIGBANG','..\imgs\artist\BIGBANG.jpg',N'Bigbang是于2006年出道的韩国组合，由队长权志龙(G-Dragon)、崔胜铉(T.O.P)、东永裴(太阳)、姜大声、李胜贤(胜利)五位成员组成。2006年8月19日，Bigbang在YG Family世界巡回演唱会首尔站上正式出道，并于同年12月22日发行首张正规专辑《BIGBANGVOL.1 SINCE2007》。2007年5月，Bigbang开始进行全国巡回演唱会，并于7月推出了第一张迷你专辑《谎言》。',86004);
--insert into tb_artist values('Charlie Puth','..\imgs\artist\charlie-puth.jpg',N'小查尔斯·奥托·普斯（英语：Charles Otto Puth Jr.）是一位美国流行歌手，出生于美国新泽西州。2009年创建YouTube频道，上传翻唱视频并拥有一定的知名度。2011年凭借与Emily Luther翻唱的《Someone Like You》获得艾伦赏识。 2015年，凭借与Meghan Trainor合作的《Marvin Gaye》被大家所知。',86001);
--insert into tb_artist values('Coldplay','..\imgs\artist\coldplay.jpg',N'Coldplay是英国摇滚乐坛进入新世纪之后崛起的最受欢迎的摇滚乐队之一，他们秉承了英式摇滚乐队一贯的风格，成为了英国新一代乐队中的杰出代表。Coldplay有四个成员，1996年时在UCL（University College London）四人相遇，两年后决定合组此乐团。Coldplay乐队成军之后的每一张专辑都不断进步，一步一步地扩大他们的影响，目前他们正处于事业的快速上升期。',86001);
--insert into tb_artist values('DJ OKAWARI','..\imgs\artist\DJ OKAWARI.png',N'Dj Okawari来自于日本静冈县，曲风为各种chillout，例如jazz-hiphop和chill-hop，有一种十分空灵自然的唯美感。主要作品：在2008年发行了Debut，名为Diorama，中文翻译过来便是西洋镜的意思，也就如同专辑名称一样，专辑里的每一首歌都十分具有画面感，美妙的钢琴配合轻快的鼓点造就了一张唯美的专辑。',86003);
--insert into tb_artist values('Ed Sheeran','..\imgs\artist\EdSheeran.jpeg',N'爱德华·克里斯多弗·希兰（Edward Christopher Sheeran）艺名艾德·希兰（Ed Sheeran），1991年2月17日出生于英国英格兰西约克郡，是大西洋唱片（Atlantic Records）旗下的一位歌手同时也是一位创作人。 2011年6月，推出首支单曲《The A Team》荣获英国单曲榜第三名，同时该单曲在第55届格莱美颁奖典礼中被提名为年度最佳歌曲。2012年在第32届全英音乐奖中荣获英国最佳男艺人、英国最具突破艺人、英国最佳单曲和英国最佳专辑四项提名。 2014年第二张专辑专辑《X》在英国销售达170万张。',86001);
--insert into tb_artist values('EGOIST','..\imgs\artist\EGOIST.jpg',N'EGOIST是在2011年10月TV动画「罪恶王冠」中设定的拥有超高人气及超大影响力的的网络歌手，在剧中演唱OP/ED以及插曲。而实际上这位歌手则是由supercell的ryo担任制作、并由ryo选出的chelly担任演唱的角色。',86003);
--insert into tb_artist values('EXO','..\imgs\artist\EXO.jpg',N'EXO是韩国SM娱乐有限公司于2012年4月8日正式推出的12人男子流行演唱团体。现以金珉锡、金俊勉、张艺兴、边伯贤、金钟大、朴灿烈、都暻秀、金钟仁、吴世勋9名成员的形式展开活动。EXO这个名字从意为太阳系以外的外部行星EXO PLANET一词中得来，蕴含了他们是从未知的世界来的新星之意。2012年4月8日，推出首张迷你专辑《MAMA》正式出道。2013年6月3日，发行首张正规专辑《XOXO》，正规一辑《XOXO（Kiss&Hug）》专辑销量突破100万张 。',86004);
----insert into tb_artist values('','',N'',);
--insert into tb_artist values('f(x)','..\imgs\artist\f(x).jpg',N'f(x)，韩国SM娱乐有限公司于2009年推出的女子流行演唱组合，成员有宋茜、刘逸云(Amber )、崔雪莉、朴善怜和郑秀晶。2009年9月5日，f(x)以《LA chA TA》正式出道，11月9日发行首张单曲《Chu~♡》，并于同年获得第17届韩国文化演艺大奖最佳新人奖；2010年5月28日，发行首张迷你专辑《NU ABO》；',86004);
--insert into tb_artist values('IU','..\imgs\artist\IU.jpg',N'李知恩 (IU)，1993年5月16日出生于韩国首尔特别市，韩国女歌手、演员、主持人。2008年以一首《迷儿》正式出道，历经一年的练习生生涯。2011年以一首《好日子》在韩国走红，随后于2011年末推出正规二辑《Last Fantasy》 PK记录74次，AK约90次。',86004);
--insert into tb_artist values(N'周杰伦','..\imgs\artist\jay.jpg',N'著名歌手，音乐人，词曲创作人，编曲及制作人，MV及电影导演。新世纪华语歌坛领军人物，中国风歌曲始祖，被时代周刊誉为“亚洲猫王”，是2000年后亚洲流行乐坛最具革命性与指标性的创作歌手，亚洲销量超过3100万张，有“亚洲流行天王”之称',86002);
--insert into tb_artist values('Maroon5','..\imgs\artist\Maroon5.jpg',N'Maroon5，中文译名魔力红乐队，来自LA的摇滚乐队，确切一些说是新灵魂摇滚。maroon 融合了红色的狂野魅力，神秘热情，奔放烈爱再掺入摇滚力道，灵魂旋律及放克节奏，这样的红流泻着新灵魂乐性感风情的放克摇滚这样的红，在流行歌坛注入了一股新的颜色。',86001);
--insert into tb_artist values('ONE OK ROCK','..\imgs\artist\ONE OK ROCK.png',N'ONE OK ROCK（ワンオクロック），日本AMUSE事务所四人乐队，现任成员：Taka(タカ，Vocal&Guitar)、Toru(トオル，Guitar&Vocal)、Ryota(リョータ，Bass)、Tomoya (トモヤ，Drums)。2005年夏天，Toru和他高中的好朋友ALex以及Ryota一起在准备好他们自己的乐器后组成了摇滚乐队ONE OK ROCK，之后Taka加入他们。2006年7月26日凭借第一张迷你专辑「ONE OK ROCK」出道，销量不错。',86003);
--insert into tb_artist values('One Republic','..\imgs\artist\onerepublic.jpg',N'One Republic（共和时代或称一体共和） 是美国的一个流行摇滚乐队，曲风pop-rock/indie/alternative。乐队成立是2004年科罗拉多州，几个成员都是受Ryan Tedder所影响，贝斯手Meyers，吉他手Filkins、Drew Brown，鼓手Eddie Fischer。',86001);
--insert into tb_artist values('Sam Smith','..\imgs\artist\sam-smith.jpg',N'萨姆·史密斯(Sam Smith)，1992年5月19日出生于英国伦敦，英国创作型男歌手。 2014年，他成为英国BBC年度之声冠军 。2月，他获得全英音乐奖评论选择奖。5月，他的首张录音室专辑《In The Lonely Hour》首周在英国专辑榜夺冠 。7月，他获得了MTV音乐录影带大奖两项大奖提名 。',86001);
--insert into tb_artist values('Sia','..\imgs\artist\sia.png',N'SiA，全名Sia Kate Isobelle Furler.生于1975年12月18日，澳大利亚。父母均从事音乐工作，"I only owned 2 CDs: a Jackson 5 anthology and Jeff Buckley Grace."SiA在真正从事音乐之前，她听的音乐真的很少很少。因为在和Zero 7一起巡回演出之后，SiA才非常认真的去听各种不同的音乐作品。',86001);
--insert into tb_artist values('Taeyang','..\imgs\artist\Taeyang.jpg',N'韩国当红偶像实力组合BigBang中心主唱主领舞。拥有东方人少见的地道黑人R&B唱腔，充满灵魂和力量的黑人舞蹈。第一张以他的名字命名的专辑——太阳mini 1辑‘Hot’！震惊了乐坛，改变了人们对当红组合成员solo的看法，获得了大众及评论界的认可，成为了成功的solo男歌手。',86004);
--insert into tb_artist values('T-ara','..\imgs\artist\T-ara.jpg',N'T-ara，别称“皇冠团”，拥有“韩国最百变女团”、“歌谣界的变色龙”等美誉，是M-net公司准备了三年时间的女子组合，于2009年7月29日出道，由全宝蓝、李居丽、朴素妍、咸恩静、朴孝敏、朴智妍六名散发不同魅力的成员组成。组合名称T-ara源自英文Tiara，意指将成为歌谣界的女王。T-ara以无限挑战的团队宗旨完美诠释了百变的无尽吸引力及超高风格驾驭力，如今不仅在歌谣界发光发热，更是在影视界、艺能界小有建树，是韩国极具代表性的偶像团体之一',86004);
--insert into tb_artist values('Taylor Swift','..\imgs\artist\Ts.jpg',N'泰勒·斯威夫特（Taylor Swift），美国乡村音乐著名创作女歌手。1989年出生于美国宾州。2006年与独立唱片公司Big Machine签约并发行首张个人专辑《Taylor Swift》。第二张专辑《Fearless》在2008年11月11日发行，在Billboard排行榜上到达了第一的位置，首支单曲《Love Story》在2008年9月正式发行，成为了第二畅销的乡村单曲，在公告牌最热100中最高排到第四。',86001);
--insert into tb_artist values(N'蔡健雅','..\imgs\artist\caijianya.jpg',N'新加坡人，华语著名歌手、词曲作者，音乐制作人。1997年在新加坡由其经纪公司 Music & Movement 旗下的Yellow Music发行英语专辑《Bored》而正式出道，1999年将国语唱片签约于宝丽金唱片旗下，并推出首张国语同名专辑《蔡健雅》。2000年因宝丽金唱片并入环球唱片旗下，因此《记念》及之后的唱片皆由台湾环球唱片发行。在此一专辑中，蔡健雅以〈记念〉一曲成功打响在台湾市场的知名度。同年入围台湾第11届金曲奖最佳新人奖。',86002);
--insert into tb_artist values(N'蔡依林','..\imgs\artist\caiyiling.jpg',N'中国台湾著名流行女歌手。1999年在台湾地区出道，被媒体冠以“少男杀手”称号，于7月份推出了第一支个人单曲EP《和世界做邻居》，9月正式推出首张国语专辑《Jolin 1019》，知名度迅速上升，获得大量人气。当时与孙燕姿、萧亚轩、梁静茹并称台湾四小天后。2003年3月，推出转型作品《看我72变》专辑，获得巨大成功。2007年受颁第十八届台湾金曲奖最佳国语女演唱人。',86002);
--insert into tb_artist values(N'陈奕迅','..\imgs\artist\chenyixun.jpg',N'著名实力派粤语流行音乐歌手、演员，香港演艺人协会副会长之一，曾被美国《时代杂志》形容为影响香港乐坛风格的人物，同时也是继许冠杰、张学友之后第三个获得“歌神”称号的香港男歌手。同时他也是继张学友后另一个在台湾获得成功的香港歌手，在2003年他成为了第二个拿到台湾金曲奖“最佳国语男演唱人”的香港歌手。陈奕迅曾被《时代》杂志形容为影响香港乐坛风格的人物。',86002);
--insert into tb_artist values(N'初音未来','..\imgs\artist\chuyin.jpg',N'初音未来（初音ミク），通常简称为“初音”。初音未来（初音ミク，中文界部分人简称为“初音”）可指CRYPTON FUTURE MEDIA以Yamaha的VOCALOID 2语音合成引擎为基础开发贩售的虚拟女性歌手软件角色主唱系列的第一作；亦可指该音乐软件的拟人化产物，是此软件的角色，也衍生出动漫和游戏人物。',86003);
--insert into tb_artist values(N'方大同','..\imgs\artist\datong.jpg',N'香港知名男歌手，于美国夏威夷出生，并先后于上海和广州生活，于1998年定居香港。方大同的爸爸是鼓手，所以从小他就受了不少音乐的熏陶。听着R&B，soul音乐长大，方大同对音乐有自己的无师自通：“从小到大，没有人教我怎么弹琴，我三四岁就喜欢唱歌了，然后就是乐器，吉他、钢琴、打鼓都是自学的，虽然我爸爸就是打鼓的，但他也没有教过我应该如何打鼓，因为他打鼓，所以家里有鼓，我就自己乱打，后来慢慢就会了。',86002);
--insert into tb_artist values(N'防弹少年团','..\imgs\artist\fangdan.jpg',N'防弹少年团（BTS），是韩国BigHit Entertainment旗下2013年出道的男子演唱组合，由金南俊（Rap Monster）、金硕珍（JIN）、闵玧其（SUGA）、郑号锡（J-HOPE）、朴智旻（JIMIN）、金泰亨（V）、田柾国（JUNG KOOK）7名成员组成。"防弹"有挡住子弹的意思，而防弹少年团的含意是"具有承受像子弹一样的时代偏见和压力的饶舌音乐团体"；而歌迷的官方昵称为“A.R.M.Y”，是“ Adorable Representative M.C for Youth ”的缩写（值得敬仰的青年饶舌代表）。',86004);
--insert into tb_artist values(N'高梨康治','..\imgs\artist\gaoli.jpg',N'高梨康治，日本作曲家、编曲家、键盘演奏者；和风硬摇滚乐队“六三四Musashi”的成员之一。早年曾在J.D.K.BAND等诸多摇滚乐队中活跃。因格斗大会PRIDE的主题曲为人熟知后，逐渐开始涉及剧伴音乐。现今主要致力于动画音乐的制作工作，《火影忍者》、《光之美少女》、《妖精的尾巴》、《地狱少女》等一系列知名动画中的经典曲目皆是出自他的手笔。',86003);
--insert into tb_artist values(N'和田光司','..\imgs\artist\hetian.jpg',N'和田光司（1974年01月29日-2016年4月3日），出生于日本京都府福知山市， 日本歌手。和田光司最为乐迷所知的歌曲是1999年为动画《数码宝贝》献唱的主题曲《Butter-fly》。1999年4月，和田光司在富士电视台系动画《数码宝贝大冒险》中演唱主题歌，成功完成了首次亮相。2016年4月3日，因咽喉癌医治无效去世。',86003);
--insert into tb_artist values(N'久石让','..\imgs\artist\jiushi.jpg',N'久石让，日本著名作曲家、歌手、钢琴家，以担任电影配乐为主，是宫崎骏作品中不可欠缺的配乐大师，从宫崎骏的《风之谷》至《悬崖上的金鱼公主》的二十多年间所有长篇动画电影的音乐制作，更与北野武是黄金组合，创作了《坏孩子的天空》、《花火》、《菊次郎的夏天》、《大佬》等佳作的配乐。1981年久石让推出第一张专辑《Information》，确定了自己的音乐风格。',86003);
--insert into tb_artist values(N'林俊杰','..\imgs\artist\jj.jpg',N'著名男歌手，作曲人、作词人、音乐制作人，偶像与实力兼具。林俊杰出生于新加坡的一个音乐世家。在父母的引导下，4岁就开始学习古典钢琴，不善言辞的他由此发现了另一种与人沟通的语言。小时候的林俊杰把哥哥当作偶像林俊杰和哥哥林俊峰，跟随哥哥的步伐做任何事，直到接触流行音乐后，便爱上创作这一条路。',86002);
--insert into tb_artist values(N'那英','..\imgs\artist\nayin.jpg',N'中国著名女歌手。华语乐坛90年代首屈一指的实力派天后，多次在央视春晚演唱歌曲，出演过多部影视剧。1988年，对那英来说是意义重大的一年，那一年在“阳光杯青年歌手大赛”中，那英凭着苏芮的《一样的月光》和《我找到自己》获得了第三名。1993年：再度荣获全国十大最受欢迎歌手奖；4月，签约福茂唱片。1994年：出版首张个人专辑《为你朝思暮想》；1995年：出版第二张个人专辑《白天不懂夜的黑》。',86002);
--insert into tb_artist values(N'少女时代','..\imgs\artist\shaonv.jpg',N'少女时代（Girls Generation）是韩国SM娱乐有限公司于2007年推出的女子流行演唱团体，由金泰妍、郑秀妍、李顺圭、黄美英、金孝渊、权俞利、崔秀英、林允儿和徐珠贤9人组成，现以8人形式进行演艺活动。2007年8月5日，少女时代发行首支单曲《再次重逢的世界》正式出道，并于11月1日发行第一张同名专辑《少女时代》 。',86004);
--insert into tb_artist values(N'孙燕姿','..\imgs\artist\sunyanzi.jpg',N'孙燕姿（Stefanie Sun），新加坡人，华语流行女歌手，以独特的嗓音和唱腔、扎实的音乐功底著称。2000年签约华纳音乐，发行首张专辑《孙燕姿同名专辑》，以《天黑黑》一曲成名，并获得包括台湾金曲奖在内的亚洲各地15个最佳新人奖，至今仍为华语歌坛之纪录。2003年，发表新专辑《The Moment》，其中《遇见》一曲迅速为听众所熟悉，连年囊括各地颁奖礼最佳女歌手、身处事业巅峰期的她暂别歌坛一年。',86002);
--insert into tb_artist values(N'薛凯琪','..\imgs\artist\xuekaiqi.jpg',N'香港著名女歌手，演员。18岁开始，出道前的薛凯琪开始兼职做三年模特儿，2003年加入华纳唱片公司；2004年开始加入乐坛。《奇洛李维斯回信》的功不可没，唱到‘街知巷闻’乃全港人所共知。2004年，她更被无线电视邀请参与电视剧《学警雄心》拍摄，成为女主角。2004年，在04年度香港各大颁奖礼中，23岁的薛凯琪是获得最多奖项的一个新人。',86002);
--insert into tb_artist values(N'薛之谦','..\imgs\artist\xuezhiqian.jpg',N'薛之谦，中国内地男歌手，籍贯上海市。2004年，第一次参加大型歌唱比赛莱卡我型我Show全国偶像歌手大赛，但其后由于种种原因退出比赛。2005年再次站上了我型我Show的舞台。赛后成功签约上腾娱乐，成为一名艺人，2006年带着超高人气的他，成功发行同名专辑。销量一路飙红，连续再版三次，总销量突破50万张，也是06年中国内地销量最好的新人之一。',86002);
--insert into tb_artist values('PSY','..\imgs\artist\psy.jpg',N'朴载相，外文名：PSY，别名：鸟叔，出生于1977年12月31日，毕业于美国伯克利音乐学院，2001年正式的出道，2010年8月签入YG Entertainment，是韩国很著名的R&B实力派歌手，“鸟叔”之名大概是源自于他2001年1月18日发行的正式一辑《PSY来自神经质的世界》中的歌曲《鸟》，这首歌当时在席卷韩国，让鸟叔人气飙升。让鸟叔真正在全球火起来的，是2012年的《江南Style》',86004);
--insert into tb_artist values('July','..\imgs\artist\july.jpg',N'July，本名李东勋，是韩国歌手、作曲家。1980年2月6日出生于韩国釜山广域市，曾就读于韩国梁山大学建筑设备系，中途辍学。July于2006年1月23日发行了个人第一张专辑《旧爱》，现在所属社为digitalrecord。',86004);
--insert into tb_artist values(N'泽野弘之','..\imgs\artist\zeye.jpg',N'日本作曲家。出生于东京都。以电视剧、动画、电影、电影音乐为中心进行作曲和编曲工作，同时也为许多艺人写作曲子。所属事务所为Legendoor。代表作包括电视剧《医龙-Team Medical Dragon-》系列配乐、动画《机动战士高达 UC》、《罪恶王冠》、《进击的巨人》、《KILL la KILL》、《ALDNOAH.ZERO》、《青之驱魔师》、《终结的炽天使》、《甲铁城的卡巴内里》系列配乐等。',86003);
--insert into tb_album values('',,,,'',,'',N'',,'');

--insert into tb_album values('PSY 7TH ALBUM',210000,310037,86004,'2017-3-21',12.3,'..\imgs\album\PSY 7TH ALBUM.jpg',N'在售',236,N'为了尽到“大众歌手”的使命，为了激情收尾多事多难的2015年，PSY携收录有9首新曲的专辑华丽回归。仅凭连续6天的新曲宣传节目就可想而知PSY作为“作词作曲家”对本次专辑的自信。但更重要的是，这让我们体会到了PSY多希望给大众听自己的音乐，作为“大众歌手”多想尽早与听众互动。');
--insert into tb_album values(N'PSY六甲',210000,310037,86004,'2017-3-21',11.5,'..\imgs\album\PSY_six_1.png',N'下架',0,N'鸟叔此砖为神砖，加入Yg后的第一张真正意义上的专辑。不仅每首歌都质量奇高，合作的人也都是泡菜各种意义上的歌坛大大，主打歌更有无挑成员加持。当然，虽然出来后最后大家所记得的只剩下一首进军国际的江南Style','2012-07-15');
--insert into tb_album values('PSYFIVE',210000,310037,86004,'2017-2-20',11.5,'..\imgs\album\PSYFIVE.jpg',N'在售',55,N'不能用一首江南style就概括了psy叔 其他音乐也超级出色','2010-10-20');
--insert into tb_album values('Cheap House',210000,310037,86004,'2016-3-8',19.9,'..\imgs\album\Cheap House.jpg',N'在售',602,N'暂无专辑简介','2006-07-10');
--insert into tb_album values('3',210000,310037,86004,'2014-9-5',19.9,'..\imgs\album\3.jpg',N'下架',0,N'暂无专辑简介','2008-6-8');

--insert into tb_album values('To Heaven',210003,310039,86004,'2013-7-6',19.9,'..\imgs\album\To_Heaven.jpg',N'在售',789,N'暂无专辑简介','2006-12-07');
--insert into tb_album values('Time...',210003,310039,86004,'2014-5-2',19.9,'..\imgs\album\july-time.jpg',N'在售',456,N'《My Soul》，也就是网上流传的“忧伤还是快乐”，是July最有名的音乐，夹带着淡淡的悲伤缓缓道来，然后节奏开始逐渐变的欢快，纵使几个重复的音乐也丝毫不会让人觉得单调，静静的听却别有一丝韵味，就像人生，由悲转喜，由苦到甘，特别是中间欢快的节奏那段，掷地有声的触感，音乐的美好尽在指间流淌。','2007-04-25');
--insert into tb_album values('Beyond The Memory',210003,310039,86004,'2014-8-6',19.9,'..\imgs\album\Beyond_The_Memory.jpg',N'在售',487,N'暂无专辑简介','2011-03-01');
--insert into tb_album values('In Love',210003,310039,86004,'2016-8-9',19.9,'..\imgs\album\In_Love.jpg',N'在售',154,N'暂无专辑简介','2012-03-16');
--insert into tb_album values(N'又是春天',210003,310039,86004,'2016-8-4',19.9,'..\imgs\album\SPRING.jpg',N'在售',545,N'感性Hip-Hop艺人July正规三辑','2014-05-15');

--insert into tb_album values('Live Concert Solar 2010',210001,310019,86004,'2016-4-3',19.9,'..\imgs\album\Live_Concert_Solar.jpg',N'在售',848,N'暂无专辑简介','2011-02-08');
--insert into tb_album values('HOT',210001,310019,86004,'2016-7-3',19.9,'..\imgs\album\HOT.jpg',N'在售',153,N'暂无专辑简介','2008-05-22');
--insert into tb_album values('Solar',210001,310019,86004,'2017-1-7',19.9,'..\imgs\album\Solar.jpg',N'在售',654,N'韩国组合 BigBang 成员太阳7月1日发行的首张专辑《Solar》。太阳于2008年通过自己的单曲《只看着我》赢得了大众的好评，他的嗓音和R&B实力都得 到了人们的认可。新专辑《Solar》中收录了以前的热门曲目《祈祷》和《只看着我》。这次新专辑收录的歌曲反应了太阳从小就励志当歌手的愿望，所以他本人付出了很大的努力。','2010-07-01');
--insert into tb_album values('RISE',210001,310019,86004,'2017-6-3',19.9,'..\imgs\album\RISE.jpg',N'在售',364,N'Big Bang成员太阳第二张Solo正规专辑《RISE》公开。正规二辑经过4年时间准备，共收录9首歌曲。主打曲《眼鼻嘴》由制作人Teddy和Dee.P等共同创作，突出太阳感性歌声的R&B Slow抒情曲风。','2014-06-03');

--insert into tb_album values('Hot Summer',210000,310011,86004,'2016-1-4',19.9,'..\imgs\album\Hot_Summer.jpg',N'在售',253,N'暂无专辑简介','2011-06-14');
--insert into tb_album values('Electric Shock',210000,310011,86004,'2016-9-12',19.9,'..\imgs\album\fx-electric-shock-cover.jpg',N'在售',255,N'暂无专辑简介','2012-06-10');
--insert into tb_album values('Pink Tape',210000,310011,86004,'2016-5-22',19.9,'..\imgs\album\Pink_Tape.jpg',N'在售',277,N'暂无专辑简介','2013-07-29');
--insert into tb_album values('Red Light',210000,310011,86004,'2016-8-2',19.9,'..\imgs\album\fx-red-light.jpg',N'在售',678,N'f(x)正规第三辑《Red Light》，这张专辑是继去年强烈冲击歌坛的第二张正规专辑《Pink Tape》之后约1年之久再次发行的f(x)的新作，Teddy Riley、Thomas Troelsen、Kenzie、hitchhiker等国内外知名制作人参与其中，提高了专辑的完成度。专辑收录了各种风格的共11首歌曲，让全世界粉丝为之期待。','2014-07-07');

--insert into tb_album values('Baby Baby',210000,310033,86004,'2016-4-6',19.9,'..\imgs\album\Baby_Baby.jpg',N'在售',765,N'暂无专辑简介','2008-03-3');
--insert into tb_album values('Into The New World',210000,310033,86004,'2016-9-3',19.9,'..\imgs\album\Into-The-New World.jpg',N'在售',111,N'暂无专辑简介','2010-12-30');
----insert into tb_album values('BEST SELECTION NON STOP MIX',210000,310033,86004,'2016-9-3',19.9,'..\imgs\album\BEST-SELECTION-NON-STOP-MIX.jpg',N'在售',351,N'暂无专辑简介','2013-9-3');
--insert into tb_album values('LOVE & PEACE',210000,310033,86004,'2016-5-4',19.9,'..\imgs\album\LOVE&PEACE.jpg',N'在售',533,N'“LOVE & PEACE”是韩国的女子组合少女时代的第3张原创日语专辑。于2013年12月11日发行。唱片公司为NAYUTAWAVE RECORDS。','2013-12-11');
--insert into tb_album values('The Best',210000,310033,86004,'2016-9-4',19.9,'..\imgs\album\the best.jpg',N'在售',276,N'少女时代于7月23日推出她们的首张日文精选辑《The Best》，专辑收录了少女时代继2010年发行《Genie》在日本出道后，4年间发行的9张日文单曲、5首专辑收入曲以及新歌《Mr.Mr》日文版和《indestructible》。','2014-7-23');

--insert into tb_album values('T-ara Winter',210001,310020,86004,'2016-7-1',19.9,'..\imgs\album\T-ara_Winter.jpg',N'在售',777,N'暂无专辑简介','2013-12-14');
--insert into tb_album values('Queen of Pops',210000,310020,86004,'2016-4-5',19.9,'..\imgs\album\Queen_of_Pops.jpg',N'在售',245,N'暂无专辑简介','2014-07-02');
--insert into tb_album values('And&End',210000,310020,86004,'2016-9-3',19.9,'..\imgs\album\And&End.jpg',N'在售',111,N'T-ara时隔一年推出第十张迷你专辑《And&End》，挑战全新曲风和形象。主打曲《Sugar Free》是如同把一切清除掉的空虚一般去除掉糖分的Sugar Free(无糖)饮料做比喻来婉转的表达的曲子，并以此将这段时间未曾展示的说唱形式的旋律和T-ara标志性的副歌将融洽的结合。这首曲子适合T-ara以往的中毒性主打，舞蹈概念也将打造继鬼步舞、机器人舞之后新的流行舞蹈。','2014-09-11');
--insert into tb_album values('So Good',210000,310020,86004,'2017-1-1',19.9,'..\imgs\album\So_Good.jpg',N'在售',565,N'“歌谣界的变色龙”T-ara时隔一年以完整体出击，携第11张迷你专辑《So Good》强势回归。此次迷你专辑共收录了主打歌《완전 미쳤네 (So Crazy)》的中韩语双版本、《우리 헤어진 이유》、《For You》4首歌曲及主打歌伴奏。主打曲《완전 미쳤네 (So Crazy)》由知名作曲家勇敢的兄弟操刀，是一首强调铜管乐器音效的Funky舞曲。勇敢的兄弟曾为孝敏Solo出道时制作主打歌《Nice Body》，此次则是首次与T-ara团体合作，成员们将以完美的演绎，为歌迷一扫夏日的炎热。','2015-08-04');
--insert into tb_album values('Remember',210000,310020,86004,'2017-2-1',19.9,'..\imgs\album\T-ara_Remember.jpg',N'在售',633,N'“歌谣界的变色龙”T-ara于11月9日发行第12张迷你专辑《REMEMBER》，时隔1年3个月感性回归。 主打曲《TIAMO》由韩国知名作曲团队二段横踢制作，与T-ara代表性的舞曲风格不同，是具有柔和清凉感的中板节奏抒情曲，充满爱意的旋律与歌词，最大化表现出“TIAMO(我爱你)”的意义。','2016-11-09');


----insert into tb_album values('Skool Luv Affair',210001,310027,86004,'2017-1-5',19.9,'..\imgs\album\Skool_Luv_Affair_Special_Addition.jpg',N'在售',545,N'防弹少年团第二张迷你专辑《Skool Luv Affair》的改版专辑，包含之前迷你专辑的全部十首歌曲，而且还收录全新歌曲《MissRight》','2014-05-14')
--insert into tb_album values('Young Foreve',210001,310027,86004,'2017-5-5',19.9,'..\imgs\album\Young-Foreve.jpg',N'在售',645,N'韩国男子组合防弹少年团在5月2日公布《花样年华》系列的最后一张特别专辑《花样年华 Young Forever》。《花样年华 Young Forever》收录了许多去年发行的《花样年华 pt.1》、《花样年华 pt.2》中的歌曲，这次将以特别专辑的形式延续《花样年华》二部曲。','2016-05-02')
--insert into tb_album values('YOUTH',210001,310027,86004,'2017-6-5',19.9,'..\imgs\album\YOUTH.jpg',N'在售',525,N'在日本出道两周年的防弹少年团第二张日语录音室专辑《YOUTH》发布，收录包括先前在日本发行的多首单曲和“花样年华”系列中《I NEED U》、《RUN》的日语版本，同时专辑还收录了在日本获得公信榜周榜的原创歌曲《FOR YOU》等。','2016-09-07')
--insert into tb_album values('WINGS',210001,310027,86004,'2016-1-5',19.9,'..\imgs\album\WINGS.jpg',N'在售',745,N'少年，遇到了诱惑！防弹少年团，正规2辑《WINGS》发售！主打歌《血 汗 泪》蕴含着陷入诱惑的青春期的矛盾与成长！最初收录了防弹少年团全员的solo单曲！蕴含成员们的自传故事！','2016-10-10')
--insert into tb_album values('YOU NEVER WALK ALONE',210001,310027,86004,'2017-5-5',19.9,'..\imgs\album\YOU_NEVER_WALK_ALONE.jpg',N'在售',547,N'防弹少年团(BTS), 《YOU NEVER WALK ALONE》 发行! 《WINGS》外传“在一起的话就能展露笑容” ，给这个时代疼痛“青春”的“安慰”与“希望”！','2017-02-13')

--insert into tb_album values('Can You Hear Me',210002,310012,86004,'2016-4-6',19.9,'..\imgs\album\Can_You_Hear_Me.jpg',N'在售',865,N'暂无专辑简介','2013-03-20');
--insert into tb_album values('Modern Times',210002,310012,86004,'2016-6-7',19.9,'..\imgs\album\IU-Modern-Times.jpg',N'在售',165,N'U20日发表正规3辑改版专辑“Modern Times – Epilogue”。新专辑包括自作曲主打歌“在星期五见面吧”和“Cray-Pas”2首新歌，主打曲加入Swing节奏，歌词讲述恋爱之前的激动心情。History成员张理正参与feat并与IU共同出演MV。','2013-12-20');
--insert into tb_album values('Modern Times - Epilogue',210002,310012,86004,'2016-7-6',19.9,'..\imgs\album\Modern_Times - Epilogue.jpg',N'在售',885,N'国民妹妹IU向淑女变身,正规3辑《Modern Times》全13曲在各大音源网站公开,这是她2012年5月发布迷你专辑后时隔1年5个月的正式回归.自宣告回归以来IU公开了收录曲"双唇之间(50cm)""孩子呀和我走走吧"等7篇预告视频,展现了题材色彩的多样风格.','2013-10-08');
--insert into tb_album values('花书签',210002,310012,86004,'2016-8-6',19.9,'..\imgs\album\huashuqian.jpg',N'在售',333,N'随着时间流逝也不会褪色的，淳朴美丽的回忆的痕迹，IU特别翻唱专辑《花书签》。 IU的首张翻唱专辑《花书签》，如同细心夹在旧书中的花瓣和四叶草书签一样，充满怀旧浪漫的气息。收入曲由IU亲自挑选，用她特有的嗓音再次重新演绎多首经历时间考验，仍不褪色的流行曲。','2014-05-16');
--insert into tb_album values('CHAT-SHIRE',210002,310012,86004,'2016-4-26',19.9,'..\imgs\album\IU-CHAT-SHIRE.jpg',N'在售',765,N'韩国人气歌手兼演员IU第四张迷你专辑《CHAT-SHIRE》于10月23日公开，也是IU自去年5月发行翻唱专辑《(花书签)》后时隔1年5个月再次发表新专辑。 IU全面参与了此次迷你专辑收录曲的词曲创作并担任专辑监制，向歌迷讲述自己的真实故事。','2015-10-23');

--insert into tb_album values('Miracles In December',210000,310010,86004,'2016-10-16',19.9,'..\imgs\album\12_miracle.jpg',N'在售',85,N'EXO于12月9日发布冬季特别专辑《12月的奇迹》，并计划展开温暖的特别舞台。此次专辑是为了在2013年专辑销量突破96万张，出道2年便获得了大奖的纪念，献给粉丝们的报答特别企划。此次专辑将展现成员们冬季多样魅力，收录5首新歌。专辑同名主打曲《12月的奇迹》(Miracles in December)，歌曲以抒情曲风','2013-12-09');
--insert into tb_album values('EXODUS',210001,310010,86004,'2016-4-6',19.9,'..\imgs\album\EXO-EXODUS.jpg',N'在售',875,N'EXO正规2辑《EXODUS》于3月30日发行，专辑共收录中韩两版各10首风格多样的歌曲，由The Underdogs、Teddy Riley、Stereotypes、Kenzie等多位作曲家打造，SHINee成员钟铉也参与其中。主打歌《Call Me Baby》是一首有强烈中毒性Hook和旋律的歌曲','2015-03-30');
--insert into tb_album values('LOVE ME RIGHT',210002,310010,86004,'2016-11-6',19.9,'..\imgs\album\LOVE ME RIGHT.jpg',N'在售',765,N'EXO正规二辑《EXODUS》Repackage版专辑《LOVE ME RIGHT》正式公开！在二辑收录的10首歌曲基础上增收了《LOVE ME RIGHT》、《TENDER LOVE》、《FIRST LOVE》、《약속 (EXO 2014)》4首新曲，共28首中韩双版本歌曲。','2015-06-03');
--insert into tb_album values('EX ACT',210000,310010,86004,'2016-11-16',19.9,'..\imgs\album\EXACT.jpg',N'在售',858,N'暂无专辑简介','2016-06-09');
--insert into tb_album values('LOTTO',210000,310010,86004,'2016-12-1',19.9,'..\imgs\album\LOTTO.jpg',N'在售',858,N'新纪录制造机EXO（S.M.ENTERTAINMENT所属）通过正规三辑Repackage《LOTTO》预告席卷歌坛。18日0点（韩国时间），此次Repackage专辑中收录了已发表的9首歌曲，加上包括主打曲《Lotto》与追加收录的4首歌曲，共由13首歌曲构成，能够享受EXO多彩音乐色彩，预计会受到全球音乐粉丝的热烈反响，令人期待。','2016-08-17');

--insert into tb_album values('BIGBANG BEST SELECTION',210001,310004,86004,'2016-9-22',19.9,'..\imgs\album\BIGBANG.jpg',N'在售',100,N'暂无专辑简介','2012-06-06');
--insert into tb_album values('BIGBANG 2',210001,310004,86004,'2016-1-22',19.9,'..\imgs\album\BIGBANG2.jpg',N'在售',110,N'暂无专辑简介','2011-05-11');
--insert into tb_album values('ALIVE',210001,310004,86004,'2016-1-2',19.9,'..\imgs\album\ALIVE.jpg',N'在售',180,N'队长G-DRAGON参与作词作曲全力打造的新收录9曲。除了VERBAL (m-flo)负责日语歌词的《FANTASTIC BABY》，还有《BLUE》《BAD BOY》日语版，更有2月29日在韩国发售的迷你辑《ALIVE》中未收录的2首新曲，以这5首歌的日语版为主，加上作为额外曲目的《HaruHaru –Japanese Version》共计收录10首歌曲。','2012-02-29');
--insert into tb_album values('STILL ALIVE',210000,310004,86004,'2017-1-22',19.9,'..\imgs\album\STILL_ALIVE.jpg',N'在售',90,N'Big Bang迷你五辑《Alive》的特别版，收入原本的四首歌曲「Fantastic Baby」、「Bad Boy」、「Blue」和「Love Dust」外，加收五首新歌包括「Still Alive」及G-Dragon创作曲词的「Monster」。','2012-06-03');
--insert into tb_album values('MADE',210001,310004,86004,'2016-1-22',19.9,'..\imgs\album\MADE.jpg',N'在售',780,N'BIGBANG全新日本专辑《MADE SERIES》于2月3日正式发行！2015年、3年ぶりのカムバックプロジェクト[MADE SERIES]が全世界のチャートを席巻中のBIGBANG。','2016-02-03');

--insert into tb_album values(N'《我要成为双马尾》原声集',210002,310028,86003,'2016-1-22',19.9,'..\imgs\album\JanBeHorse.jpg',N'在售',10,N'暂无专辑简介','2014-12-26');
--insert into tb_album values(N'新妹魔王の契約者',210002,310028,86003,'2016-12-1',19.9,'..\imgs\album\Monster.jpg',N'在售',106,N'上栖綴人原作の人気ライトノベル『新妹魔王の契約者』より、TVアニメ第2期『新妹魔王の契約者 BURST』が2015年10月より放送!第1期に引き続き、『NARUTO』『地獄少女』などを手掛けた高梨康治が音楽を担当。アニメの世界観を重厚に、ときにセクシーに盛り立てる劇伴音楽に加え、オープニング・テーマ「Over The Testament」およびエンディング・テーマ「Temperature」のそれぞれTVサイズを収録。','2015-12-16');
--insert into tb_album values(N'NARUTO-ナルト- 疾風伝 オリジナル・サウンドトラック III',210002,310028,86003,'2016-8-22',19.9,'..\imgs\album\NARUTO.jpg',N'在售',10,N'暂无专辑简介','2016-07-06');
--insert into tb_album values('FAIRY TAIL',210002,310028,86003,'2016-3-22',19.9,'..\imgs\album\FAIRY_TAIL.jpg',N'在售',10,N'暂无专辑简介','2010-07-07');
--insert into tb_album values('SUPER LOVERS',210002,310028,86003,'2016-3-2',19.9,'..\imgs\album\SUPER_LOVERS.jpg',N'在售',10,N'原作・あべ美幸によるTVアニメ『SUPER LOVERS』より、メインキャラクターの海棠4兄弟のうち海棠亜樹(CV:松岡禎丞)と海棠蒔麻(CV:寺島拓篤)の歌うキャラクイター・ソングとBGMを収録したアルバムが登場。耽美な音楽の世界を楽しめる1枚。','2016-07-27');

--insert into tb_album values(N'ラブストーリー',210002,310003,86003,'2016-3-1',19.9,'..\imgs\album\janno1.jpg',N'在售',450,N'暂无专辑简介','2014-03-26');
--insert into tb_album values('Christmas Song',210001,310003,86003,'2016-4-11',19.9,'..\imgs\album\Christmas-Song.jpg',N'在售',490,N'暂无专辑简介','2015-11-18');
--insert into tb_album values('Chandelier',210001,310003,86003,'2016-5-1',19.9,'..\imgs\album\chandelier.jpg',N'在售',490,N'back number 5枚目のアルバムとなる『シャンデリア』のリリースが決定しました! 現在放送中のフジテレビ系月曜9時ドラマ「5→9~私に恋したお坊さん〜」主題歌「クリスマスソング」、NTTドコモCMソング「手紙」、大塚製薬 ポカリスエット イオンウォーターCMソング「SISTER」、サンスタートニックシャンプーキ.','2015-12-09');
--insert into tb_album values(N'僕の名前を',210002,310003,86003,'2016-3-11',19.9,'..\imgs\album\Janno2.jpg',N'在售',450,N'back numberはデビュー5周年当日にあたる4月6日に、自身がパーソナリティを務めるニッポン放送の番組「back numberのオールナイトニッポン」の中で「僕の名前を」のシングル化を発表。','2016-05-25');
--insert into tb_album values(N'アンコール (重演)',210002,310003,86003,'2017-3-1',19.9,'..\imgs\album\again.jpg',N'在售',40,N'back number双CD精选大碟发行，收录了「圣诞歌」、「高岭的花子小姐」、「花束」等人气曲目。','2016-12-28');

--insert into tb_album values(N'Nicheシンドローム',210001,310015,86003,'2016-4-11',19.9,'..\imgs\album\Niche.jpg',N'在售',111,N'暂无专辑简介','2010-06-09');
--insert into tb_album values(N'残響リファレンス',210001,310015,86003,'2016-4-8',19.9,'..\imgs\album\janno3.jpg',N'在售',181,N'暂无专辑简介','2011-10-05');
--insert into tb_album values(N'人生×僕=',210001,310015,86003,'2016-6-11',19.9,'..\imgs\album\Janno4.jpg',N'在售',871,N'暂无专辑简介','2013-03-06');
--insert into tb_album values('35xxxv',210001,310015,86003,'2016-4-22',19.9,'..\imgs\album\35xxxv.jpg',N'在售',188,N'ロングヒットとなった「人生×僕=」から約2年、海外での活動を本格化させ、世界基準のバンドとして飛躍的な成長をみせるONE OK ROCK7作目のフルアルバムが完成。映画『るろうに剣心 京都大火編』の主題歌 “Mighty Long Fall” や「FOOL COOL ROCK! ONE OK ROCK DOCUMENTARY FILM','2015-02-11');
--insert into tb_album values('Ambitions ',210001,310015,86003,'2017-4-8',19.9,'..\imgs\album\Ambitions .jpg',N'在售',451,N'美国摇滚权威媒体AP杂志评为【2017年最受期待的发行】！收录小栗旬主演的日本卖座电影【恶魔蛙男】主题曲「Taking Off」、话题单曲「Bedroom Warfare」、「I Was King」！到暑五秒以及低迷乐团主唱Alex Gaskarth站台助阵！宣洩难以驯服的野性，碰撞出新世代庞克音乐火花，将Emo风格挥洒淋漓尽致，加倍奉还视听感官无上限的绝对刺激！','2017-01-13');

--insert into tb_album values('All of my mind',210002,310029,86003,'2016-4-11',19.9,'..\imgs\album\All_of_my_mind.jpg',N'在售',547,N'暂无专辑简介','2001-12-05');
--insert into tb_album values('The Best Selection - Welcome Back',210002,310029,86003,'2016-5-11',19.9,'..\imgs\album\The-Best Selection-Welcome-Back.jpg',N'在售',578,N'暂无专辑简介','2007-02-28');
--insert into tb_album values('re-fly',210002,310029,86003,'2016-5-22',19.9,'..\imgs\album\re-fly.jpg',N'在售',547,N'ファン待望の最新作! TVアニメ『デジモンアドベンチャー』OP主題歌「Butter-Fly」でメジャーデビューから15年、夢と歌を世界中に届け続けている”不死蝶のアニ ソンシンガー”和田光司が、セルフカバー、オリジナル曲と魅力溢れるアルバムをリリース! TVアニメ『デジモンアドベンチャー』','2015-03-25');
--insert into tb_album values('DIGIMON SONG BEST OF KOJI WADA',210002,310029,86003,'2016-9-11',19.9,'..\imgs\album\DIGIMON-SONG-BEST-OF KOJI-WADA.jpg',N'在售',588,N'「DIGIMON SONG BEST OF KOJI WADA」 会場限定CDの販売が決定いたしました！ ','2016-07-31');
--insert into tb_album values('WADA DIGIMON MEMORIAL',210002,310029,86003,'2017-4-1',19.9,'..\imgs\album\MEMORIAL.jpg',N'在售',54,N'2016年4月3日に42才という若さで亡くなった、“不死蝶(バタフライ)”と呼ばれたシンガー、和田光司の代名詞デジモンソングコレクション。テレビシリーズ及び劇場作品で使用された楽曲を集めたベスト盤的1枚。s','2017-01-25');

--insert into tb_album values('DIORAMA',210003,310007,86003,'2016-5-11',19.9,'..\imgs\album\DIORAMA.jpg',N'在售',256,N'暂无专辑简介','2008-05-28');
--insert into tb_album values('Libyus Music Sound History',210003,310007,86003,'2016-7-11',19.9,'..\imgs\album\Libyus-Music-Sound-History.jpg',N'在售',174,N'DJ OKAWARI将众音乐家及DJ的作品重新采样混音，同时也收录了自己的两首新曲','2010-09-29');
--insert into tb_album values('Mirror',210003,310007,86003,'2016-5-7',19.9,'..\imgs\album\Mirror.jpg',N'在售',514,N'暂无专辑简介','2009-06-24');
--insert into tb_album values('Kaleidoscope',210003,310007,86003,'2016-5-7',19.9,'..\imgs\album\Kaleidoscope.jpg',N'在售',594,N'暂无专辑简介','2011-06-29');
--insert into tb_album values(N'Compass(罗盘)',210003,310007,86003,'2016-7-7',19.9,'..\imgs\album\Compass.jpg',N'在售',698,N'全世界期待！一起来一场音乐旅行吧！时隔五年半，日本知名乐曲制作人DJ OKAWARI发行第四张原创专辑《Compass》，他自身独特的跨越地域、风格的创作技巧将再次把我们带入美丽的音乐世界。','2017-01-11');


--insert into tb_album values(N'レム睡眠',210000,310025,86003,'2016-1-7',19.9,'..\imgs\album\sleep.jpg',N'在售',122,N'暂无专辑简介','2014-04-26');
--insert into tb_album values(N'初音ミク「マジカルミライ 2014」in OSAKA ',210000,310025,86003,'2016-10-7',19.9,'..\imgs\album\OSAKA.jpg',N'在售',182,N'バーチャルシンガー・初音ミクが2014年8月に大阪で行った公演をBD化。「High-energy Particle」「カゲロウデイズ」「二次元ドリームフィーバー」「心臓デモクラシー」「スキキライ」ほか、全26曲を収録。観客24,000人を熱狂させたステージが甦る。','2015-03-11');
--insert into tb_album values(N'初音ミクシンフォニー Miku Symphony 2016',210000,310025,86003,'2017-6-7',19.9,'..\imgs\album\Miku-Symphony.jpg',N'在售',1256,N'2017年将迎来初音未来10周年，特别挑选众多VOCALOID制作人的名曲并制作成管弦乐演奏版本的录音CD。','2016-11-09');
--insert into tb_album values('KARENT presents Winterlands Anthology',210000,310025,86003,'2016-12-4',19.9,'..\imgs\album\Anthology.jpg',N'在售',122,N'你的歌声为冬季物语拉开了序幕。 收录了SNOW MIKU 2017主题曲《Star Night Snow》的限量版专辑，为您倾情献上以冬天与星空主题的概念CD。','2017-01-25');
--insert into tb_album values('HATSUNE MIKU EXPO ',210000,310025,86003,'2016-11-11',19.9,'..\imgs\album\EXPO.jpg',N'在售',552,N'2016年開催のライブ・ツアー『HATSUNE MIKU EXPO 2016』の公式E.P.。','2016-03-09');

--insert into tb_album values('Brave Shine',210000,310001,86003,'2016-1-17',19.9,'..\imgs\album\Brave Shine.png',N'在售',162,N'年4月起正式播出、由制作公司ufotable负责打造的TV动画「Fate/stay night [Unlimited Blade Works]」第2季OP主题曲专辑。由曾献唱过TV动画「NO.6」及「夏雪密会」等作ED、OVA「机动战士高达UC」第6＆7章主题歌、PS Vita游戏「Fate/hollow ataraxia」所有歌曲的女性歌手Aimer担当。OP曲名为「Brave Shine」，该曲收录在Aimer的第8张单曲中。','2015-06-03');
--insert into tb_album values('DAWN',210000,310001,86003,'2016-5-17',19.9,'..\imgs\album\Aimer-DAWN.jpg',N'在售',782,N'Aimer第3张全长专辑《DAWN》是“不眠之夜物语”的最终章，穿越不眠之夜，遇见午夜的太阳，然后，终于迎来真正的黎明……','2015-07-29');
--insert into tb_album values('ninelie',210000,310001,86003,'2017-2-17',19.9,'..\imgs\album\ninelie.jpg',N'在售',522,N'フジテレビ“ノイタミナ”「甲鉄城のカバネリ」エンディング・テーマAimer、通算9枚目にして2016年最初のシングルリリースが決定。','2016-05-11');
--insert into tb_album values('daydream',210000,310001,86003,'2017-1-20',19.9,'..\imgs\album\Bdaydream.jpg',N'在售',162,N'「听过一次便无法忘怀的声音。」失而复得的灵性嗓音，跨越命运的新世代歌姬Aimer，众星跨刀最具话题新专辑《daydream》正式发行！','2016-09-21');
--insert into tb_album values(N'茜さす',210000,310001,86003,'2016-9-17',19.9,'..\imgs\album\janno5.jpg',N'在售',752,N'一度聞いたら忘れられない、深みのあるハスキーボイスが話題の女性シンガーAimer(エメ)がシングルをリリース。通算12枚目のシングルとなる今作は、2016年9月21日よりスタートする初の全国ホールツアーの最終公演(東京国際フォーラムホールA)にあわせて制作されたメモリアルな1枚。','2016-11-16');

--insert into tb_album values('The Everlasting Guilty Crown',210000,310009,86003,'2017-1-17',19.9,'..\imgs\album\Guilty-Crown.jpg',N'在售',192,N'暂无专辑简介','2012-03-07');
--insert into tb_album values('Reloaded',210000,310009,86003,'2015-1-17',19.9,'..\imgs\album\Reloaded.jpg',N'在售',592,N'TVアニメ「ギルティクラウン」から誕生したsupercellのryoがプロデュースを務める架空のアーティストEGOIST。','2012-12-05');
--insert into tb_album values('Extra terrestrial Biological Entities',210000,310009,86003,'2016-10-17',19.9,'..\imgs\album\Entities.jpg',N'在售',789,N'暂无专辑简介','2012-09-19');
--insert into tb_album values('Fallen',210000,310009,86003,'2016-11-17',19.9,'..\imgs\album\Fallen.jpg',N'在售',459,N'11月19日リリースのシングル。タイトル曲は、フジテレビ“ノイタミナ”アニメ『PSYCHO-PASS サイコパス 2』エンディング・テーマ。メタルやエレクトロ、ダブステップなど多彩なジャンルを織り交ぜた進化系のサウンドとなっている。','2014-11-19');
--insert into tb_album values(N'名前のない怪物',210000,310009,86003,'2016-1-7',19.9,'..\imgs\album\238954.jpg',N'在售',789,N'暂无专辑简介','2012-12-05');

--insert into tb_album values('Vermeer&Escher',210003,310030,86003,'2015-1-15',19.9,'..\imgs\album\Vermeer&Escher.jpg',N'在售',52,N'暂无专辑简介','2012-02-15');
--insert into tb_album values(N'風立ちぬ サウンドトラック (起风了)',210003,310030,86003,'2016-11-15',19.9,'..\imgs\album\WIND.jpg',N'在售',872,N'暂无专辑简介','2013-07-17');
--insert into tb_album values(N'The End of the World',210003,310030,86003,'2016-4-15',19.9,'..\imgs\album\World.jpg',N'在售',542,N'久石让与新日本爱乐交响乐团的再次演出！2015年8月，全国公演完美落幕的久石让的《JOE HISAISHI & WORLD DREAM ORCHESTRA 2015》CD音源发布，敬请欣赏。这次演出的主题是迎来战后七十周年(2015)的日本与全世界一起共有的“祈愿”。','2016-07-13');
--insert into tb_album values(N'柘榴坂の仇討',210003,310030,86003,'2016-9-13',19.9,'..\imgs\album\Janno6.jpg',N'在售',562,N'暂无专辑简介','2014-09-17');
--insert into tb_album values(N'「家族はつらいよ」',210003,310030,86003,'2015-1-14',19.9,'..\imgs\album\family.jpg',N'在售',52,N'山田洋次自《男人之苦》系列终结后阔别20年的喜剧作品。电影再次集结了在“东京家族”中饰演“家人”的8名实力派演员阵容。同一作品同一家庭，但却是完全不同的家族故事。','2016-03-09');

--insert into tb_album values(N'終わりのセラフ 名古屋決戦編',210001,310040,86003,'2017-1-15',19.9,'..\imgs\album\fight.jpg',N'在售',742,N'TVアニメ終わりのセラフ第2クール『名古屋決戦編』オリジナルサウンドトラックCD。集英社×WIT STUDIO、最強タッグが贈るダークファンタジーTVアニメ『終わりのセラフ』','2016-01-27');
--insert into tb_album values('GUILTY CROWN COMPLETE SOUNDTRACK',210001,310040,86003,'2017-5-1',19.9,'..\imgs\album\gc_SOUNDTRACK.jpg',N'在售',742,N'完全收录由泽野弘之进行编曲的原声盘。 包含之前发售的原声集中未收录的BD2、4、9卷特典，将《罪恶王冠》音乐世界完整展现！','2016-04-27');
--insert into tb_album values(N'甲鉄城のカバネリ',210001,310040,86003,'2016-5-1',19.9,'..\imgs\album\gc_SOUNDTRACK.jpg',N'在售',512,N'監督:荒木哲郎×脚本:大河内一楼×キャラクター原案:美樹本晴彦×音楽:澤野弘之×スタジオ:WIT STUDIOと豪華スタッフで贈る、2016年4月よりフジテレビノイタミナほかにて放送のTVアニメ『甲鉄城のカバネリ』のオリジナル・サウンドトラック。劇伴は数々のヒット作品のサントラを手掛ける澤野弘之!','2016-05-18');
--insert into tb_album values('Thunderbolt Fantasy',210001,310040,86003,'2017-4-1',19.9,'..\imgs\album\ThunderboltFantasy.jpg',N'在售',742,N'日本与台湾霹雳国际合作的布袋戏《Thunderbolt Fantasy 东离剑游记》原声发布，该剧音乐由泽野弘之担任，日本知名剧作家虚渊玄负责系列构成，台湾霹雳国际负责拍摄制作。','2016-08-24');
--insert into tb_album values('FANTASIA',210001,310040,86003,'2016-12-1',19.9,'..\imgs\album\FANTASIA.jpg',N'在售',242,N'泽野弘之学生时代自主制作的乐曲，收录9首未发表音源。澤野が学生時代に自主制作した『FANTASIA』のCD盤。 未発表音源9曲のCDを付属。小室哲哉、荒木哲郎との特別対談を収録! ','2017-02-22');

--insert into tb_album values('Its My Day',210001,310035,86002,'2015-1-15',19.9,'..\imgs\album\ItsMyDay.jpg',N'在售',652,N'拥有最完美、最美好的Fiona 薛凯琪 首张国语大碟 CD 青春 活跃 梦寐以求的甜味 2008第一次偶像崇拜 从梦幻来到现实 Everyday Is Special Day','2008-04-18');
--insert into tb_album values('Smile',210001,310035,86002,'2016-1-15',19.9,'..\imgs\album\Smile.jpg',N'在售',432,N'薛凯琪在2008年作了多项新尝试，首先在4月推出首张国语唱片《Its My Day》，12月则参与首个音乐舞台剧《Last Smile, First Tear》，并同时带来这张年度压轴广东唱片《Smile》。','2008-12-19');
--insert into tb_album values('AUGUST GIRL',210001,310035,86002,'2017-1-15',19.9,'..\imgs\album\AUGUST-GIRL.jpg',N'在售',252,N'Fiona薛凯琪全新专辑《AUGUST GIRL》 CD+DVD  全新专辑《AUGUST GIRL》，Fiona作出多种新尝试,从曲风到歌词，从外面到里面， 唱出不再少女的情怀，唱出更不一样的薛凯琪！','2011-07-08');
--insert into tb_album values(N'给十年后的我 Collection',210001,310035,86002,'2017-3-15',19.9,'..\imgs\album\Collection.jpg',N'在售',472,N'《给十年后的我 Collection》！ 特别收录: 全新单曲 《GONE》！ 其他收录包括: 给十年后的我、奇洛利瓦伊斯回信、男孩像你、拒绝毕彼特、南瓜车甜蜜蜜、天国的微笑、复刻回忆、糖不甩、小黑与我、All You Need Is Me、慕容雪、字花、XBF、麦当娜一吻、唇印、除下吊带前、楼梯转角...等。','2013-12-10');
--insert into tb_album values('Tonight',210001,310035,86002,'2015-1-15',19.9,'..\imgs\album\Tonight.jpg',N'在售',452,N'暂无简介','2014-10-03');
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
--insert into tb_album values(N'野蛮游戏 J-Game',210000,310023,86002,'2015-10-15',19.9,'..\imgs\album\J-Game.jpg',N'在售',722,N'一听就上瘾、再听朗朗上口，让人全身通电、闻之起舞！为了能让歌迷耳目一新，Jolin 找来一支全球限量发售的专业麦克风，这支麦克风神奇之处，就是让Jolin唱出的声音更加甜美。','2005-04-25');
--insert into tb_album values(N'舞娘',210000,310023,86002,'2016-7-15',19.9,'..\imgs\album\dancer.jpg',N'在售',379,N'台湾“流行教主”蔡依林加盟新唱片公司 Capiol 首张国语专辑《舞娘》，5月12日在台湾隆重推出，为了配合新碟主题《舞娘》，Jolin 将会飞到洛杉矶学习最新的舞蹈，希望给歌迷惊喜！Jolin 单是造型，就破天荒请来两位知名造型师，依照不同歌曲与造型师本身各自的专长，全力为 Jolin 打造流行教主的最新形象！','2006-05-01');
--insert into tb_album values(N'特务J',210000,310023,86002,'2016-10-1',19.9,'..\imgs\album\J.jpg',N'在售',792,N'2007 TOYOTR“一定要你心动”活动广告曲华语乐坛流行天后---蔡依林2007最新国语专辑！国语唱片行销新创举！EMI耗资千万制作的音乐电影!继“舞娘”之后，挑战自己的极限，献给所有歌迷最新礼物！','2007-09-21');
--insert into tb_album values(N'爱的练习语',210000,310023,86002,'2016-11-8',19.9,'..\imgs\album\love.png',N'在售',725,N'早于2005年曾出版《J1-Jolin的二十四堂英文日记课》和《Jolin的六场单字派对》，2008年流行教主蔡依林再接再厉，今回用英语谈情说爱，又翻唱西洋经典情歌，推出首张英文专辑并同时发行第三本英文书《Love Exercise 爱的练习语》。','2014-11-15');
--insert into tb_album values(N'呸 ',210000,310023,86002,'2017-1-8',19.9,'..\imgs\album\pei.jpg',N'在售',725,N'在心口不一的时代用玩笑乐观面对用音乐戏谑世界人生不过就是一场PLAY！亚洲流行天后JOLIN蔡依林  2014全新专辑 【呸】蔡依林领衔主演 10首人生剧场主打歌10首人生剧场主题曲 蔡依林音乐总监越玩越大','2008-10-30');

--insert into tb_album values(N'白天不懂夜的黑',210002,310032,86002,'2015-8-15',19.9,'..\imgs\album\daynight.jpg',N'在售',722,N'《白天不懂夜的黑》是那英1993年转战台湾歌坛签约福茂唱片，继1994年的首张专辑《为你朝思暮想》之后又一张在台湾歌坛初试啼声的第二张专辑，短期内曾在台创下销量近三白金(十五万张)的纪录。 ','1995-05-01');
--insert into tb_album values(N'干脆',210002,310032,86002,'2016-8-15',19.9,'..\imgs\album\gancui.jpg',N'在售',222,N'专在新世纪即将到来的最后一年，天后那英发行了她的第四张大碟《干脆》。 专辑中的十首歌，有20世纪末经典名句《愿赌服输》；有着个性的TITLE的《乾脆》；也有大热歌曲《梦醒了》的续篇《梦一场》以拨弦作点睛；而让全曲有别一般流行歌曲的《一万一千公里》；还有让人一新耳目的唱腔演绎《白丝线》。当然，最令人惊喜的是，特别收录与飞鸟·凉跨国“音缘”合作的《相见不如怀念》','1999-07-01');
--insert into tb_album values(N'如今',210002,310032,86002,'2015-6-15',19.9,'..\imgs\album\today.jpg',N'在售',792,N'这张《如今》专辑，由友善的狗制作人沈光远、罗纮武制作。由于那英与沈光远、罗纮武是第一次合作，在唱腔与想法上激出新的火花，加上配唱制作人马玉芬已经是那英的“老朋友”，他们维持以往那英Powerful的力度与新的演唱情绪上的掌控，让这张专辑更加细腻，并增加曲风、唱法上的丰富性','2002-11-01');
--insert into tb_album values(N'那又怎样',210002,310032,86002,'2014-8-15',19.9,'..\imgs\album\sowhat.jpg',N'在售',728,N'在2011年，那英推出全新专辑《那又怎样》。这张专辑的组成，是华人音乐圈的大团结，由金曲奖最佳制作人蔡健雅与内地甚具影响力创作型歌手汪峰的巧妙结合，刚柔并济的融合，与那英外刚内柔的个性相呼应。专辑制作人蔡健雅更是倾注心力，接下这一张专辑的制作，经历一开始的彷徨的自我交战，深感责任重大','2011-10-07');
--insert into tb_album values(N'征服',210002,310032,86002,'2015-8-15',19.9,'..\imgs\album\Remastered.jpg',N'在售',354,N'暂无专辑简介','2015-05-08');

--insert into tb_album values(N'若你碰到他',210001,310022,86002,'2016-9-15',19.9,'..\imgs\album\ifyou.jpg',N'在售',924,N'爱情全观创作人 蔡健雅Tanya 10首体验生活 勾勒人生的真实创作对Tanya来说，这是一张全新体验的专辑，“现在回头来看这一路专辑录制到完成的过程，感觉就像和多年认识的好友一起玩音乐一样，即使有着空间、时间的距离，却没有陌生的感觉','2009-08-19');
--insert into tb_album values(N'Just Say So',210001,310022,86002,'2016-9-5',19.9,'..\imgs\album\Just-Say-So.png',N'在售',254,N'2011冬 诚挚献礼谈情说爱第一人选 蔡健雅Tanya 2011遨游音乐世界真心力作「说到爱」+「Just Say So」重量级中英文创作双专辑喜欢蔡健雅的朋友们可以好好享受「双倍蔡健雅」了！这个冬天，Tanya除了带来全新国语创作专辑「说到爱」，更一并推出筹备多时的全新英文创作专辑「Just Say So」。','2011-11-18');
--insert into tb_album values(N'说到爱',210001,310022,86002,'2016-9-25',19.9,'..\imgs\album\talklove.jpg',N'在售',437,N'2012春诚挚献礼，谈情说爱第一人选蔡健雅2012遨游音乐世界真心力作！2012年3月，蔡健雅将为华语乐坛立下创举：这位来自新加坡的金曲歌后将同步推出国语专辑《说到爱》和英语专辑《Just Say So》，两张专辑皆为她亲自创作、制作及演唱','2011-11-18');
--insert into tb_album values(N'天使与魔鬼的对话',210001,310022,86002,'2016-2-15',19.9,'..\imgs\album\angeldemon.jpg',N'在售',422,N'曾经以为只需要一个念头就可以让自己重新恢复到最乐观明亮的自己但是你们也像我一样观察过自己的不安不快乐甚至崩溃吗？现在的我 已经可以让悲观与乐观同时共存在身上因为我终于正视那些黑暗一 层 一 层 地。－Tanya蔡健雅最好的自己，究竟是天使还是魔鬼?','2013-09-24');
--insert into tb_album values(N'失语者',210001,310022,86002,'2016-6-1',19.9,'..\imgs\album\noword.jpg',N'在售',224,N'我们拥有太多方式表达却忘了怎么说话究竟是你我都开不了口还是这个世界让我们都失去言语蔡健雅Tanya 2015全新专辑 【失语者】','2015-11-13');


--insert into tb_album values('The Moment',210001,310034,86002,'2015-6-13',19.9,'..\imgs\album\TheMoment.jpg',N'在售',144,N'专辑收录了孙燕姿最佳诚意代表作！50余首燕姿最爱的歌，淋漓尽致与你交换全部回忆！和每个人都一样，燕姿的音乐是从这些歌开始的……从一个平凡的女生，到万众瞩目的明星，在每一段交织的旋律里，有喜悦、有痛楚、有收获、有失去……','2003-08-01');
--insert into tb_album values(N'完美的一天',210001,310034,86002,'2015-2-13',19.9,'..\imgs\album\perfectday.jpg',N'在售',244,N'从音乐制作发想开始，如何透过新的制作人从零开始是主要的关键，贾敏恕“ 完美的一天”，FIR+五月天+孙燕姿联合创作与制作的“第一天”，我们可以从新的合作上，听到新的音乐性。李偲菘、李伟菘的“眼泪成诗”…向来对燕姿很有默契的掌握，亦展现了歌手在歌唱的音乐才华。 ','2005-10-01');
--insert into tb_album values(N'逆光',210001,310034,86002,'2015-6-13',19.9,'..\imgs\album\light.jpg',N'在售',144,N'逆光 中板轻快的节奏配合上燕姿她有力量却又肯定的声线，以钢琴为主底，加上大量合声及弦乐的配合，给人一种看到了希望的感觉，听到了新的希望的燕姿。','2007-03-01');
--insert into tb_album values('2 Her',210001,310034,86002,'2015-6-13',19.9,'..\imgs\album\2Her.jpg',N'在售',144,N'暂无专辑简介','2009-01-21');
--insert into tb_album values(N'克卜勒',210001,310034,86002,'2015-6-13',19.9,'..\imgs\album\2Her.jpg',N'在售',144,N'一闪一闪。亮晶晶用歌声、布置你的星空【孙燕姿 克卜勒】「 我只能竭尽一切的努力，然后把成果交到你们手上。」- 孙燕姿只有孙燕姿可以让一个16世纪的天文奇景变成2014年的音乐盛典。','2014-02-27');

--insert into tb_album values(N'橙月 Orange Moon',210002,310026,86002,'2016-7-13',19.9,'..\imgs\album\OrangeMoon.jpg',N'在售',144,N'《橙月 Orange Moon》專輯中所收錄的曲目聽下來，強烈感到音樂整體的氛圍始終有愛，有的愛幽默俏皮的正開始在萌芽、有的愛真摯深遠刻骨銘心、有的愛浪漫奇幻擁有無限想像空間、有的愛正在某處守候遠遠祝你幸福。像是沿著浪漫的情歌路線，一路走到不同階段的愛，過程中你會不斷找到自己經歷深刻的畫面，發現自己原有的最真實的感動','2008-12-27');
--insert into tb_album values(N'Timeless 可啦思刻 Orange Moon',210002,310026,86002,'2016-7-13',19.9,'..\imgs\album\Timeless.jpg',N'在售',144,N'音乐创作才华备受肯定的方大同，2009年特别推出一张自选辑《Timeless 可啦思刻》，收录了十首好好听的歌曲，这些旋律是他自小在父母亲的影响下而有所启发，无形之中影响了他的生活、成长与音乐，给予他创作的养分。','2009-08-11');
--insert into tb_album values(N'危险世界',210002,310026,86002,'2016-7-13',19.9,'..\imgs\album\dangerworld.jpg',N'在售',144,N'这个未知的世界充满各种危险重要的事物 坚定的信念 生命里那些特别的人都需要你我的保护纵使有再多的困难 在我们迈出步伐的那一刻却也给予了我们自己穿越冒险的力量','2014-04-11');
--insert into tb_album values(N'JTW西游记',210002,310026,86002,'2016-7-13',19.9,'..\imgs\album\JWT.jpg',N'在售',144,N'东方心性 穿越 西方世界十一个年头的自我修炼墨色眼神开始浮现光芒耀金皮囊逐渐解构重生方大同 全新音乐厂牌 赋音乐 旗下首张黑金双碟原创大碟 个人第九张录音室专辑《JTW西游记》','2016-09-28');
--insert into tb_album values('15',210002,310026,86002,'2016-7-13',19.9,'..\imgs\album\15.jpg',N'在售',144,N'有一种开始 是永远的无论什么时候结束 重新再来都是温热无比的那组秘密的数字 那个特殊的日期那首歌词让你想收藏，因为讲了好多你的故事，那首旋律让人好想唱歌，一定要亲自上KTV唱上几次，','2011-04-21');

--insert into tb_album values(N'学不会 Lost N Found',210000,310031,86002,'2016-6-4',19.9,'..\imgs\album\Found.jpg',N'在售',144,N'郎朗、林夕、方文山、姚若龙、青峰、天天、林秋离、葛大为等创作人联手刻画New JJ  [ 古典、流行、电子、爵士、中国风等11种多样面貌，各自精彩的林俊杰 ]  Lady Gaga专辑御用Engineer打造专辑母带Mastering，完美封存 ','2011-12-30');
--insert into tb_album values('Love & Dance Hit Songs',210000,310031,86002,'2016-6-4',19.9,'..\imgs\album\HitSongs.jpg',N'在售',144,N'暂无专辑简介','2012-12-21');
--insert into tb_album values(N'因你而在',210000,310031,86002,'2016-6-4',19.9,'..\imgs\album\youexists.jpg',N'在售',144,N'林俊杰 第十张个人专辑《因你而在》首波同名主打《因你而在》。','2013-03-13');
--insert into tb_album values(N'新地球',210000,310031,86002,'2016-6-4',19.9,'..\imgs\album\newearth.jpg',N'在售',144,N'金曲歌王 J J 林俊杰第 11 张 全新视野力作 《新地球》2013年，他失去了至亲；2014年，他获得了金曲奖他突然明白失去与获得是一体两面，提醒他去给予于是 他找到了他的新地球当失去与获得互为表里你 就是《新地球》12/27(六) 正式发行','2014-12-27');
--insert into tb_album values(N'林俊杰-和自己对话',210000,310031,86002,'2016-6-4',19.9,'..\imgs\album\taiktome.jpg',N'在售',144,N'林俊杰 JJ Lin 实验专辑「和自己对话 From M.E. To Myself」城市的人口密度是 拥挤身边的情感交流是 疏离梦想的葬身之地是 遗忘首创 实验概念 3D "声"历其境「戴上耳机，我们一起经历 爱」','2015-12-25');


--insert into tb_album values('H3M',210001,310024,86002,'2017-1-13',19.9,'..\imgs\album\H3M.jpg',N'在售',144,N'陈奕迅终于推出广东大碟，并联同 Moving On Stage 演唱会的大乐队组成 H3M，Eason 表示与乐队成员巡回演出超过一年，十分希望能够与他们出一张唱片，他说:“希望可以与 Moving On Stage band 做一张大碟，他们每一个人都会为我写歌，是十分值得纪念，好兴奋的事情。','2009-03-23');
--insert into tb_album values('Taste the Atmosphere',210001,310024,86002,'2017-1-13',19.9,'..\imgs\album\Atmosphere.jpg',N'在售',154,N'陈奕迅又有新搞作，在最新EP《Taste the Atmosphere》与三位天后交锋，在首支主打歌“讲男讲女”请来阔别乐坛23年的露云娜合唱，大胆地把两性心态来高谈阔论，由伍仲衡作曲和蓝奕邦填词。','2010-10-15');
--insert into tb_album values('Stranger Under My Skin',210001,310024,86002,'2017-1-13',19.9,'..\imgs\album\MySkin.jpg',N'在售',154,N'超脱俗世品嚐气氛后  陈奕迅交出审视自我另一面之作  《STRANGER UNDER MY SKIN》 情绪暗潮触动 ','2011-02-22');
--insert into tb_album values('The Key',210001,310024,86002,'2017-1-13',19.9,'..\imgs\album\TheKey.jpg',N'在售',154,N'陈奕迅《The Key》以音乐作钥匙 开启时代之曲。Eason Chan X C. Y. Kong X 梁荣骏 X Eric Kwok x林夕 x 小克 x 林若宁。跨进音乐新领域','2013-07-22');
--insert into tb_album values('rice & shine',210001,310024,86002,'2017-1-13',19.9,'..\imgs\album\shine.jpg',N'在售',154,N'Eason《rice & shine》「迷你臣」俏现精髓赤祼上身被水喉直射面上Eason最新国语专辑《rice & shine》于5月15日正式推出，是次封套拍摄找来林海峰（Jan）作为创作总监及着名摄影师夏永康（Wing Shya）操刀， 把「rice & shine」的概念以每个人起床后第一时间会做的两件事情表达出来。','2014-05-15');

--insert into tb_album values(N'深深爱过你',210001,310036,86002,'2016-11-13',19.9,'..\imgs\album\deeploveu.jpg',N'在售',364,N'薛之谦 2008全新个人创作专辑《深深爱过你》11月26日震撼发行CD集合了全媒体PK热曲之专辑同名主打《深深爱过你》前世、今生双版本，各电台榜首之中国风单曲《传说》，薛之谦首度尝试韩国劲爆热舞曲目《Let You Go》《星河之役》 重新演绎上张专辑主打歌曲《苏黎世的从前》回响奥运曲目《梦开始的原点》等','2008-11-24');
--insert into tb_album values(N'未完成的歌',210001,310036,86002,'2016-11-13',19.9,'..\imgs\album\notyet.jpg',N'在售',364,N'创作小天王薛之谦 即将于秋末发行自己的第一张个人新歌加精选专辑，首播个人创作主打歌《未完成的歌 》CD版。《未完成的歌 》是薛之谦逾一年的创作，甚至创作早于上张专辑的同名主打歌《深深爱过你》，而为何迟迟没有发表，薛之谦 表示：“一直没有很好的词来配合这首曲，所以我一直在等，终于等到让我觉得感动的歌词。 ','2009-12-01');
--insert into tb_album values(N'几个薛之谦',210001,310036,86002,'2016-11-13',19.9,'..\imgs\album\xue.jpg',N'在售',364,N'《几个薛之谦》于7月17日生日当天发行，其中第二波深情主打《我知道你都知道》全面曝光，这首薛之谦的最新创作歌曲也被湖南卫视最新大戏《胜女的代价》收为主插曲，随着剧情的铺垫将逐渐带领观众入戏。','2012-07-17');
--insert into tb_album values(N'初学者',210001,310036,86002,'2016-11-13',19.9,'..\imgs\album\new.jpg',N'在售',364,N'2016年华语乐坛杀出重围冠军作 薛之谦 《初学者》重拾初心 勇往直前在梦想丛林抱持初生之勇做变幻世界最后的初学者7/17 正式发行','2016-07-18');

--insert into tb_album values(N'七里香',210001,310013,86002,'2016-10-13',19.9,'..\imgs\album\7mile.png',N'在售',854,N'2004年夏天周杰伦带来浓郁《七里香》！限量预购版加送「Jay 海参威纸上写真剧场」(约36页写真集)，限量发售！随碟加赠珍藏VCD，内有「七里香」及「止战之殇」之MV。','2004-08-03');
--insert into tb_album values(N'依然范特西',210001,310013,86002,'2016-10-13',19.9,'..\imgs\album\stillfan.jpg',N'在售',854,N'周杰伦最新专辑《依然范特西》请出小哥费玉清对唱首波主打歌《千里之外》，周杰伦以R&B曲风搭配费玉清美声的唱腔，呈现强烈对比，制造出反差冲突，周杰伦表示去年就有此念头，今年透过老板杨峻荣找上费玉清，终于促成歌坛老少天王的合作。 ','2006-09-05');
--insert into tb_album values(N'十二新作',210001,310013,86002,'2016-10-13',19.9,'..\imgs\album\12new.jpg',N'在售',854,N'当时光敲第12响时，是该听周杰伦的时候了…周杰伦2012最新专辑 「十二新作」2012年12月 28日 压轴登场Jay.12的巧合与奥妙出道第12年','2012-12-28');
--insert into tb_album values(N'哎呦-不错哦',210001,310013,86002,'2016-10-13',19.9,'..\imgs\album\ayou.jpg',N'在售',854,N'今年度最特大号、最令人高度期待的音乐作品莫过于是周杰伦的最新专辑，首波主打「鞋子特大号」就以幽默拉开序幕！如同周杰伦的音乐总是给人各种惊奇的感受，12月26日推出的新专辑名为「哎呦，不错哦」','2014-12-26');
--insert into tb_album values(N'周杰伦的床边故事',210001,310013,86002,'2016-10-13',19.9,'..\imgs\album\bedstory.jpg',N'在售',854,N'夜深了猫头鹰出没数完第一千零一个尖叫声开始听周杰伦 的床边故事Jay Chou’s Bedtime Stories         今年最令人激动的乐坛震撼弹周杰伦2016年最新着魔专辑强势暗袭你的床边！','2016-06-24');
	
--insert into tb_album values('Dreaming Out Loud',210001,310016,86001,'2016-1-13',19.9,'..\imgs\album\DreamingOutLoud.jpg',N'在售',354,N'专辑风格在独立、流行和摇滚之间，歌曲的旋律都不错，让人很容易就能接受，对于喜欢流行还是摇滚的歌迷来说都是不错的选择。值得一提的是专辑中大部分歌曲都是由Ryan Tedder来完成，也是一个不简单的人物。','2007-11-20');
--insert into tb_album values('Waking Up',210001,310016,86001,'2016-1-13',19.9,'..\imgs\album\WakingUp.jpg',N'在售',354,N'暂无专辑简介','2010-01-01');
--insert into tb_album values('Native',210001,310016,86001,'2016-1-13',19.9,'..\imgs\album\Native.jpg',N'在售',354,N'暂无专辑简介','2013-03-22');
--insert into tb_album values('iTunes Session',210001,310016,86001,'2016-1-13',19.9,'..\imgs\album\iTunesSession.jpg',N'在售',354,N'暂无专辑简介','2014-07-22');
--insert into tb_album values('Oh My My',210001,310016,86001,'2016-1-13',19.9,'..\imgs\album\Oh-My-My.jpg',N'在售',354,N'金曲大神、流行摇滚名团OneRepublic暌违三年终回归，全新大碟Oh My My将于10月7日全球发行，豪华版收录高达20首歌！新专辑将以全新面貌展现乐队的音乐进化，“新颖、摩登、不一样，跟我们以前的音乐完全不同！”三首率先公开的先行歌曲，包括大胆混搭流行摇滚及电音的Wherever I Go，受80年代合成器流行启发的Kids，以及好听抓耳的Future Looks Good，无不令乐迷大呼喜欢，对专辑期待之情空前高涨，相信新专辑又会是一张饶富奇想色彩的流行摇滚大作！','2016-10-07');

--insert into tb_album values('It Wont Be Soon Before Long',210001,310014,86001,'2017-1-13',19.9,'..\imgs\album\BeforeLong.jpg',N'在售',354,N'在这些流行音乐届大腕级音乐人的打造之下，《It Wont Be Soon Before Long》处处透出的都是走在时尚前沿的声音。无论是开场曲《If I Never See Your Face Again》和《Little of Your Time》，还是《Little Of Your Time》和《Wake Up Call》，或是《Cant Stop》都很有去年红透美国的流行小天王Justin Timberlake的气质，在Adam Levine独特的嗓音之下铺垫的是时尚的舞曲元素以及以及复古的Funk，R&B节奏。','2008-07-06');
--insert into tb_album values('Overexposed',210001,310014,86001,'2017-1-13',19.9,'..\imgs\album\Overexposed.jpg',N'在售',354,N'Maroon 5日前在其官网发布了乐队最新录音室专辑《Overexposed》封面，而这张专辑将计划在美国时间6月26日上市。\n据了解，这次抢先曝光的新专辑封面照颇具涂鸦效果，利用色彩传神对应的恶搞乐队成员面貌之余，也似乎利用丰富而大胆的想像力向涂鸦鼻祖毕加索大师致敬。','2012-06-25');
--insert into tb_album values('Songs About Jane',210001,310014,86001,'2017-1-13',19.9,'..\imgs\album\SongsAboutJane.jpg',N'在售',354,N'美国流行组合 Maroon 5--《Songs About Jane》\\nmaroon 5 融合了红色的狂野魅力、神秘热情、奔放烈爱，再掺入摇滚力道、灵魂旋律及放克节奏，这样的红流泻着新灵魂乐性感风情的放克摇滚，这样的红在流行歌坛注入了一股新的颜色。','2002-06-25');
--insert into tb_album values('V',210001,310014,86001,'2017-1-13',19.9,'..\imgs\album\v.png',N'在售',354,N'美国流行摇滚乐队Maroon 5第五张录音室专辑《V》于2014年9月2日发行。首单《Maps》于6月16日发行。 跟制作人Max Martin, Benny Blanco, Ryan Tedder, Shellback和Sam Martin合作的这张专辑是在洛杉矶录音完成。','2014-09-02');
--insert into tb_album values('V',210001,310014,86001,'2017-1-13',19.9,'..\imgs\album\Singles.png',N'在售',354,N'Maroon 5于2015年9月25日发行精选专辑《Singles》，收录历年畅销单曲12首。','2015-09-25');

--insert into tb_album values('When We Were Young',210001,310000,86001,'2016-12-13',19.9,'..\imgs\album\WhenWeWereYoung.jpg',N'在售',554,N'Adele 正式推出新单曲“When We Were Young”,今起可全球数字音乐销售及流媒 体平台收听。“When We Were Young”是 Adele 专辑《25》的最新单曲,与 Tobias Jesso. Jr. 共同创作,由 Ariel Rechtshaid 制作。2016 年 2 月起,Adele 将开始已经售罄的英国及欧洲巡演,首站为 2 月 19 日贝尔法 斯特。之后 Adele 也将踏上美国、加拿大及墨西哥等地的巡演,也已售罄,详细日程 可前往网站 adele.com/live 查阅。','2016-02-05');
--insert into tb_album values('Skyfall',210001,310000,86001,'2016-12-13',19.9,'..\imgs\album\Skyfall.png',N'在售',554,N'阿黛尔（Adele）为《007》最新系列电影《Skyfall 天降杀机》献唱同名主题曲《Skyfall》，而这也将是继美国另类摇滚乐队Garbage、莎丽·贝希（Shirley Bassey）、保罗·麦卡特尼（Paul McCartney）以及麦当娜（Madonn）等曾经为007系列电影的主题曲做过贡献的又一超级大牌歌手。','2012-10-05');
--insert into tb_album values('19',210001,310000,86001,'2016-12-13',19.9,'..\imgs\album\19.png',N'在售',554,N'暂无专辑简介','2008-11-17');
--insert into tb_album values('21',210001,310000,86001,'2016-12-13',19.9,'..\imgs\album\21.png',N'在售',554,N'暂无专辑简介','2011-01-24');
--insert into tb_album values('25',210001,310000,86001,'2016-12-13',19.9,'..\imgs\album\25.png',N'在售',554,N'关于与自己和解，关于弥补消逝的时光。葛莱美 / 全英音乐奖 / 奥斯卡金像奖 / 金球奖流行天后完美回归★全球3000万销量经典专辑《21》后，暌违近五年全新专辑★首支单曲〈Hello〉横扫102国iTunes冠军，【亲爱妈咪】【听妈妈的话】加拿大天才导演Xavier Dolan操刀MV首日创下2770万点播纪录','2015-11-20');

--insert into tb_album values('We Are Born',210001,310018,86001,'2016-12-13',19.9,'..\imgs\album\WeAreBorn.jpg',N'在售',244,N'2004年英伦Trip-hop新贵乐团乐队Zero 7藉首张专辑《Simple Things》中一鸣惊人，着迷于Zero 7音乐的同时，乐迷们也被其中一把懒洋洋却又质感十足的女声深深吸引。这把让人惊艳的女声来自年轻的澳大利亚女歌手Sia(Sia Furler ，Sia发音是See-ah)。','2010-09-27');
--insert into tb_album values('Best Of...',210001,310018,86001,'2016-12-13',19.9,'..\imgs\album\Best Of.jpg',N'在售',244,N'专辑介绍：Following her retirement from live performance, Sia delivers an 18-track ‘Best Of’ album. It features tunes from throughout her career, as well as collaborations with Zero 7 and David Guetta, and the popular CSS remix of ‘Buttons’. ','2012-03-30');
--insert into tb_album values('Healing Is Difficult',210001,310018,86001,'2016-12-13',19.9,'..\imgs\album\HealingIsDifficult.png',N'在售',244,N'Aussie edition of 2002 solo album debut for Zero 7 vocalist includes one bonus track, Drink To Get Drunk (Different Gear Mix). Aussie girl Sia, now based in London, has a hip hop based, funk infused, innovative style over which she layers her incredible vocals & harmonies. Muzik magazine says, Full of fresh songs & raw beats & rhythms, this ladys worth waiting for, a classy act & thats the truth. Sony.','2002-05-28');
--insert into tb_album values('1000 Forms of Fear',210001,310018,86001,'2016-12-13',19.9,'..\imgs\album\1000FormsofFear.png',N'在售',244,N'暂无专辑介绍','2015-05-01');
--insert into tb_album values('This is acting',210001,310018,86001,'2016-12-13',19.9,'..\imgs\album\this-is-acting.jpg',N'在售',244,N'创作才女Sia 2016《 This is Acting》豪华版，集结原为阿黛尔、蕾哈娜等巨星量身打造曲目，融入主角心境重新诠释，尽情角色扮演。','2016-10-21');

--insert into tb_album values('Under My Skin',210001,310002,86001,'2016-2-23',19.9,'..\imgs\album\UnderMySkin.png',N'在售',244,N'“Under My Skin”这张专辑以非常戏剧性的歌曲"Take Me Away" 以及"Together"这两首歌曲作为开场，这样的用意是为了第一波的主打歌曲”Dont Tell Me"做极佳的情绪铺陈。”Dont Tell Me"这首单曲，充满了重节奏的吉他伴奏，绝对是一首深受电台欢迎的畅销单曲；','2004-05-24');
--insert into tb_album values('The Best Damn Thing',210001,310002,86001,'2016-2-23',19.9,'..\imgs\album\TheBestDamnThing.png',N'在售',244,N'《美丽坏东西》（英语：The Best Damn Thing）是加拿大唱作歌手艾薇儿·拉维尼的第三张录音室专辑，于2007年4月17日由RCA唱片发行。这张专辑与她上一张专辑《酷到骨子里》（Under My Skin）相比风格更加多样，多样许多评论者认为这是艾薇儿最商业化的作品。','2007-06-26');
--insert into tb_album values('Goodbye Lullaby',210001,310002,86001,'2016-2-23',19.9,'..\imgs\album\GoodbyeLullaby.png',N'在售',244,N'艾薇儿这次出辑，找来长久合作的伙伴Deryck Whibley, Evan Taubenfeld、Butch Walker，以及金牌词曲创作人Max Martin等人齐力打造这张歌迷期待已久的创作大碟。艾薇儿透过这张专辑的创作，延续过去一贯将她的生活体验融入其中的制作理念，但《Goodbye Lullaby》在她睽违近四年的时间中，呈现的将是更直接、更贴近她个人生命的全新作品。','2011-03-07');
--insert into tb_album values('Let Go Under My Skin',210001,310002,86001,'2016-2-23',19.9,'..\imgs\album\Let Go Under My Skin.png',N'在售',244,N'暂无专辑简介','2013-03-18');
--insert into tb_album values('Avril Lavigne',210001,310002,86001,'2016-2-23',19.9,'..\imgs\album\AvrilLavigne.jpg',N'在售',244,N'Avril Lavigne》是艾薇儿在2013年11月5日发行的新专辑，艾薇儿表示这张专辑多元化并带有一定的实验性，有摇滚十足的东西，同时也有一些流行味道比较重的作品，还有一些感人、励志的抒情歌曲，内容会涉及多方面，不会是仅仅只谈到"爱情"和"男孩"这些比较表面的主题。','2013-11-05');


--insert into tb_album values('Like I Can',210001,310017,86001,'2016-3-23',19.9,'..\imgs\album\LikeICan.jpg',N'在售',284,N'暂无专辑简介','2014-12-05');
--insert into tb_album values('The Lost Tapes- Remixed',210001,310017,86001,'2016-3-23',19.9,'..\imgs\album\TheLostTapes.png',N'在售',284,N'暂无专辑简介','2015-05-15');
--insert into tb_album values('Writings On the Wall',210001,310017,86001,'2016-3-23',19.9,'..\imgs\album\WritingsOntheWall.jpg',N'在售',284,N'Sam Smith献唱最新一部007电影《007：大破幽灵危机》的主题曲《Writings On the Wall》，他把这形容为自己职业生涯中最重要的时刻。回到最初，电影制作人Barbara Broccoli 和导演Sam Mendes把剧本给Sam，希望他能为电影写/唱一首歌。','2015-09-25');
--insert into tb_album values('Nirvana EP',210001,310017,86001,'2016-3-23',19.9,'..\imgs\album\NirvanaEP.jpg',N'在售',284,N'暂无专辑简介','2013-10-04');
--insert into tb_album values('In The Lonely Hour',210001,310017,86001,'2016-3-23',19.9,'..\imgs\album\LonelyHour.jpg',N'在售',284,N' 2013年大热的音乐制作人Sam Smith于5月发行首张个人专辑《In The Lonely Hour》。','2014-05-26');

--insert into tb_album values('A Rush Of Blood To The Head',210001,310006,86001,'2016-3-23',19.9,'..\imgs\album\TheHead.png',N'在售',284,N'2002年Coldplay推出第二张专辑《A Rush of Blood To The Head》，他们再次起用Parachutes专辑原班人马－混音及制作拍文件Ken Nelson、电脑工程师Mark Phythain。专辑从2001年10月开始筹备，虽然还是一贯Coldplay的酷劲，比起前一张却更加丰富','2002-08-26');
--insert into tb_album values('Parachutes',210001,310006,86001,'2016-3-23',19.9,'..\imgs\album\Parachutes.jpg',N'在售',284,N'《Parachutes》是Coldplay在利物浦的Parr Street Studio录音室，与曾为Gomez、Badly drawn boy作嫁的Ken Nelson共同制作。纯净、美丽的中、慢板旋律加上主唱Chris Martin神似Thom Yorke(Radiohesd主唱)轻柔却极具戏剧张力的淳美歌声','2000-07-10');
--insert into tb_album values('X&Y',210001,310006,86001,'2016-3-23',19.9,'..\imgs\album\X&Y.png',N'在售',284,N'这张唱片中的Coldplay也向人们展示了自己以前从未有过的进取精神，从“Talk”中Kraftwerk似的电子节拍，到“Swallowed In The Sea”中深受Pogues影响的曲风，整张专辑涉猎了丰富的音乐元素，向人们传递出一种厚重迷人、简约却又壮观的Coldplay之声。','2005-06-03');
--insert into tb_album values('Ghost Stories',210001,310006,86001,'2016-3-23',19.9,'..\imgs\album\GhostStories.png',N'在售',284,N'酷玩ColdPlay 2014年新专辑《Ghost Stories》于5月发行。这是Coldplay第六张录音室专辑。','2014-05-16');
--insert into tb_album values('A Head Full of Dreams',210001,310006,86001,'2016-3-23',19.9,'..\imgs\album\Dreams.png',N'在售',284,N'横跨英美两地录制、挪威双人制作组合Stargate与酷玩乐团御用制作人Rik Simpson联手打造！ 赞扬爱的美好、歌颂出生命的灵性奥妙、灌注正面积极能量的嬉皮人生哲学！','2015-12-04');

--insert into tb_album values('See You Again ',210001,310005,86001,'2016-4-23',19.9,'..\imgs\album\SeeYouAgain.png',N'在售',284,N'暂无专辑简介','2015-04-04');
--insert into tb_album values('Some Type of Love',210001,310005,86001,'2016-4-23',19.9,'..\imgs\album\SomeTypeofLove.png',N'在售',294,N'美国创作新人Charlie Puth最新EP《Some Type of Love 》于5月1日发行','2015-05-01');
--insert into tb_album values('Ego',210001,310005,86001,'2016-4-23',19.9,'..\imgs\album\Ego.jpg',N'在售',294,N'暂无专辑简介','2013-10-01');
--insert into tb_album values('Nine Track Mind',210001,310005,86001,'2016-4-23',19.9,'..\imgs\album\NineTrackMind.jpg',N'在售',294,N'以首支单曲创下超过13亿次YOUTUBE点阅率2016格莱美奖3项大奖提名12周蝉联全美流行榜冠军、拿下全球100多国排行#1全球大卖【速度与激情7】电影主题曲「See You Again」主唱华纳全球力捧 势不可挡偶像新巨星','2016-01-29');

--insert into tb_album values('Taylor Swift',210002,310021,86001,'2016-9-23',19.9,'..\imgs\album\TaylorSwift.jpg',N'在售',294,N'暂无专辑简介','2006-10-24');
--insert into tb_album values('Speak Now',210002,310021,86001,'2016-9-23',19.9,'..\imgs\album\speaknow.jpg',N'在售',294,N'《Speak Now》是美国乡乐流行女歌手泰勒·斯威夫特的第三张录音室专辑，专辑监制由泰勒本人担任。发行首周便以104.7万张的销售记录，拿下公告牌二百强专辑榜冠军。与此同年，专辑还拿下加拿大、新西兰、澳大利亚和中国台湾的专辑销售榜冠军，在全球已拥有580万张的销售记录 ，2011年，《Speak Now》获第39届全美音乐奖“最受欢迎乡村专辑”和公告牌音乐奖“最佳乡村专辑”奖  。','2010-01-01');
--insert into tb_album values('Fearless',210002,310021,86001,'2016-9-23',19.9,'..\imgs\album\fearless.jpg',N'在售',294,N'2006年冬天，乡村女歌手泰勒史薇芙特(Taylor Swift)推出她的首支单曲，以当红乡村巨星提姆·麦克罗(Tim McGraw)的名字当作标题，引起广大的注意，也打进了乡村排行前十名。另人惊奇的是,Taylor Swift不但是歌曲的作者,她首张同名专辑里面的所有歌曲也都是她亲自参与谱写的,而当时他才十五岁。','2009-03-08');
--insert into tb_album values('Taylor Swift',210002,310021,86001,'2016-9-23',19.9,'..\imgs\album\TaylorSwift.jpg',N'在售',294,N'暂无专辑简介','2012-10-22');
--insert into tb_album values('1989',210002,310021,86001,'2016-9-23',19.9,'..\imgs\album\1989.jpg',N'在售',294,N'Taylor Swift第五张个人专辑《1989》于2014年10月27日正式发行。这是Taylor Swift第一张流行专辑。首单《Shake It Off》于2014年8月19日发行。第三波单曲《Welcome To New York》词曲部分由Taylor和OneRepublic主唱Ryan Tedder合作完成,灵感来源于霉霉之前从洛杉矶搬往纽约经历。','2014-10-27');


--insert into tb_album values('Songs I Wrote With Amy',210001,310008,86001,'2016-9-20',19.9,'..\imgs\album\Amy.jpg',N'在售',294,N'Reissue of this 2010 EP from the acclaimed British singer/songwriter previously only available as a digital download. Songs I Wrote With Amy, which is a collection of love songs he wrote in Wales with fellow singer/songwriter Amy Wadge. Five tracks. Atlantic.','2011-12-11');
--insert into tb_album values('Loose Change',210001,310008,86001,'2016-9-20',19.9,'..\imgs\album\LooseChange.jpg',N'在售',294,N'暂无专辑简介','2011-12-11');
--insert into tb_album values('X',210001,310008,86001,'2016-9-20',19.9,'..\imgs\album\multiply.jpg',N'在售',294,N' 91年出生的英国民谣流行唱作人Ed Sheeran于2014年6月发行专辑《X》。这是他个人第二张录音室专辑，首发单曲《Sing》由Pharrell Williams制作并于4月7日上架发行。豪华版专辑里收录了《霍比特人2：史矛革荒漠》主题曲《I See Fire》。','2014-06-23');
--insert into tb_album values('+',210001,310008,86001,'2016-9-20',19.9,'..\imgs\album\plus.jpg',N'在售',294,N'暂无专辑简介','2012-05-29');
--insert into tb_album values('Divided',210001,310008,86001,'2016-9-20',19.9,'..\imgs\album\plus.jpg',N'在售',294,N'2300万张专辑总销量94亿串流点听次数40亿官方YouTube观赏次数不断改写历史、创造乐坛新纪录＊收录2017全新双单曲「Castle On The Hill山丘上的城堡」+「Shape Of You你的样子」，同步称霸全球多国排行榜冠军＋亚军席次，打破英美排行双纪录，合并拿下128国iTunes榜冠军，火速冲破全球5亿6000万串流点听次数！','2017-03-03');



--alter database UMusic collate Chinese_PRC_CI_AS
--set language 'Korean'
--set language 'Simplified Chinese'

--use UMusic
--select * from tb_singleSong
--select * from tb_album

--insert into tb_singleSong values(110207,'Thinking Out Loud','3:14');
--insert into tb_singleSong values(110207,'Photograph','3:04');
--insert into tb_singleSong values(110207,'Sing','3:51');
--insert into tb_singleSong values(110207,'The Man','3:44');
--insert into tb_singleSong values(110207,'One','3:14');
--insert into tb_singleSong values(110207,'Im a mess','4:14');
--insert into tb_singleSong values(110207,'Runaway','5:14');
--insert into tb_singleSong values(110207,'Nina','3:14');
--use UMusic
--select top 10 * from tb_album where albumId>(
--       select max(albumId) from ( 
--              select top 30 albumId from tb_album order by albumId
--       ) as t
--) order by albumId

--update tb_artist set imageurl='..\imgs\artist\Adele.jpg' where artistId = 310000;
--update tb_album set releaseDate='2012-07-9' where albumId = 110014;
--update tb_album set imagesurl='..\imgs\album\daydream.jpg' where albumId = 110095
--update tb_album set imagesurl='..\imgs\album\LetGoUnderMySkin.png' where albumId = 110184
--update tb_album set imagesurl='..\imgs\album\AndEnd.jpg' where albumId = 110039
--update tb_album set imagesurl='..\imgs\album\LOVEPEACE.jpg' where albumId = 110035



--select * from tb_artist where artistid = (
--	select artistid from tb_album where albumid= 110014
--)

--select * from tb_album where artistid = (
--	select artistid from tb_album where albumid = 110014
--)and albumid !=110014

------------------------------------
--The produce of search for album---
------------------------------------
--create proc albumProc 
--@albumId int 
--as 
--begin 
--select * from tb_album where artistid = (
--	select artistid from tb_album where albumid = @albumId
--)and albumid !=@albumId
--end 
--go
--drop proc albumProc
--exec albumProc 110014
--------------------end----------------------------

------------------------------------
--The produce of search for artist---
------------------------------------
--create proc artistProc 
--@artistId int 
--as 
--begin 
--select top 2* from tb_artist where localid=(
--	select localid from tb_artist where artistid = @artistId
--)and artistid!=@artistId
--end 
--go
--drop proc artistProc
--exec artistProc 310031

---------------end----------------------------
--select * from tb_User
--insert into tb_User values('edsheeran','15105758563','594002537@qq.com','123456','2017-3-29')

--select * from tb_User where UserName='edsheeran' and Password='123123'
--select * from tb_collection

--alter table tb_order add userid int not null
--alter table tb_order add constraint FK_o_userid foreign key(userid) references tb_user(userid)

--select *from tb_orderdetails
--SET IDENTITY_INSERT tb_order on
--insert into tb_order(OrderID,orderdate,OrderStatus,createdate,total,userid) values(4000011,'1994-2-20','wewew','1994-2-20',1,20170101);
--insert into tb_order values('1994-2-20','wewew','1994-2-20',1,20170101);
--insert into tb_orderdetails values(4000011,110095,2,1.23);
--select userid from tb_User where UserName='edsheeran'
-------------------------------
--create proc proc_album 
--@orderid int 
--as
--begin
--select * from tb_album where albumid=(
--	select albumid from tb_orderdetails where orderid =@orderid	
--	)
--end 
--go
--exec proc_album 4000011
------------------------------
----------------------------------
--create proc proc_artist
--@orderid int
--as
--begin
--select * from tb_artist where artistid = (
--select artistid from tb_album where albumid =(
--  select albumid from tb_orderdetails where orderid=@orderid
--  )
--)
--end
--go
--drop proc proc_artist
---------------------------------------
----==================================\
--create proc proc_genre 
--@orderid int
--as
--begin 
--select * from tb_genre where genreid =(
--	select genreid from tb_album where albumid = (
--		select albumid from tb_orderdetails where orderid =@orderid
--	)
--)
--end
--go
--use UMusic
--drop proc proc_genre
----\\\\\\\\\\\\\\\\\\\\\\\\\\
--create proc proc_listat
--@artistId int 
--as 
--begin 
--select * from tb_artist where localid=(
--	select localid from tb_artist where artistid = @artistId
--)and artistid!=@artistId
--end 
--go

--select * from tb_cartDetails

--select cartId from tb_cart where userId=20170101

--delete from tb_cartDetails where cartId=1
--////////////////////////////////////////////////
--create proc proc_mulTable
--as 
--begin
--select tb_album.albumName ,tb_artist.artistName,tb_album.leftNum,tb_cartDetails.quantity,tb_album.imagesUrl,tb_genre.genreName
--from tb_cartDetails,tb_album,tb_artist,tb_genre 
--where tb_cartDetails.albumId=tb_album.albumId and tb_album.artistId=tb_artist.artistId and tb_album.genreId=tb_genre.genreId 
--end 
--go
--exec proc_multable
--drop proc proc_multable
----//////////////////////////////////////////////////

--create view view_cartItem
--as
--select tb_album.albumName ,tb_artist.artistName,tb_album.leftNum,tb_cartDetails.quantity,tb_album.imagesUrl,tb_genre.genreName,tb_album.price,tb_album.albumid,tb_cartDetails.cartid
--from tb_cartDetails,tb_album,tb_artist,tb_genre 
--where tb_cartDetails.albumId=tb_album.albumId and tb_album.artistId=tb_artist.artistId and tb_album.genreId=tb_genre.genreId

--drop view view_cartItem
--///////////////////////////////////////////////////

--delete from tb_cartDetails

--create proc proc_userid
--@username varchar(50)
--as
--begin 
--select * from tb_cart where userid = (
--SELECT	userid from tb_User where UserName = @username
--)
--end 
--go
--drop proc proc_userid
--exec proc_userid 'edsheeran'
--insert into tb_cart values(20170101);

--use UMusic
--select * from tb_cartDetails
--delete from tb_cartDetails

--select * from tb_Orderdetails
--select * from tb_album
--select * from tb_cartdetails
--delete from tb_Orderdetails
--select * from tb_User

--///////////////

--create view view_OrderItem
--as
--select tb_album.albumid,tb_album.imagesUrl,tb_album.albumname,tb_artist.artistName,tb_genre.genreName,tb_Orderdetails.OrderID,tb_orderdetails.quantity,tb_orderdetails.unitprice,tb_Order.orderdate
--from tb_album,tb_artist,tb_genre,tb_Orderdetails,tb_Order
--where tb_orderdetails.albumid=tb_album.albumid and tb_album.genreid = tb_genre.genreid and tb_album.artistid=tb_artist.artistid and tb_order.orderid=tb_orderdetails.orderid
--drop view view_OrderItem
--select * from tb_local
--select * from tb_Orderdetails
--select * from tb_User
--select * from tb_collection
--select * from tb_cartdetails

--create view view_UserCenterOrder
--as 
--select tb_album.albumid,tb_album.imagesUrl,tb_album.albumname,tb_artist.artistName,tb_genre.genreName,tb_Orderdetails.OrderID,tb_orderdetails.quantity,tb_orderdetails.unitprice,tb_Order.orderdate,tb_User.userid,tb_Order.OrderStatus
--from tb_album,tb_artist,tb_genre,tb_Orderdetails,tb_Order,tb_User
--where tb_orderdetails.albumid=tb_album.albumid and tb_album.genreid = tb_genre.genreid and tb_album.artistid=tb_artist.artistid and tb_order.orderid=tb_orderdetails.orderid and tb_user.userid = tb_order.userid
--drop view view_UserCenterOrder
--create proc proc_calbum
--@userid int 
--as
--begin 
--select tb_album.albumname,tb_album.albumid,tb_album.albumid from tb_collection,tb_album where tb_collection.albumid = tb_album.albumid and  tb_collection.userid = @userid
--end 
--go
--exec proc_calbum 20170101
--drop proc proc_calbum
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--create view view_collection
--as
--select tb_album.albumname,tb_album.albumid,tb_album.albumid from tb_collection,tb_album where tb_collection.albumid = tb_album.albumid and userid = 20170101 

--select * from tb_Order , tb_orderdetails where tb_order.userid = 20170101 and tb_Order.OrderID = tb_orderdetails.orderid

--select * from tb_collection,tb_album where tb_collection.albumid = tb_album.albumid and  tb_collection.userid=20170101
use UMusic
create view view_collection
as
select tb_album.albumname , tb_album.albumid,tb_album.imagesurl ,tb_artist.artistid,tb_artist.artistname ,tb_collection.userid
from tb_album , tb_artist,tb_collection
where tb_collection.albumid = tb_album.albumid and tb_album.artistid = tb_artist.artistid

select * from tb_userdetails
insert into tb_userdetails values(20170101,'male','1994-2-20','ed','china');

select * from tb_user
delete  from tb_collection where albumid = 110015

insert into tb_advice values(20170101,'真是醉了，傻逼真多','2017-2-22')
select max(albumid) as maxid from tb_album 
select * from tb_local

select *from tb_genre
insert into tb_Admin values('ed','123456','2017-4-11');
select password as password from tb_admin where adminname='ed'
select * from tb_Userdetails
select * from tb_album where genreid = 210001 order by locationid
select * from tb_Advice
Select CONVERT(varchar(100), (select createdate from tb_advice), 111)
select SUM(leftnum)as 总量 ,locationid from tb_album  group by(locationid) 


select SUM(leftnum)as 总量 ,locationid  from tb_album group by(locationid) 
insert into tb_userDetails values(6,'20170102','','','','')
delete from tb_userDetails
drop table tb_userdetailsa
update tb_user set password=111111 where UserId=20170101

use UMusic

select * from tb_admin
