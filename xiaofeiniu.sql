SET NAMES UTF8;
DROP DATABASE IF EXISTS xfn;
CREATE DATABASE xfn CHARSET=UTF8;
USE xfn;

-- 管理
CREATE TABLE xfn_admin(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    aname VARCHAR(32) UNIQUE,
    apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES(NULL,'admin',PASSWORD('123456'));
INSERT INTO xfn_admin VALUES(NULL,'boss',PASSWORD('999999'));

-- 品牌
CREATE TABLE xfn_settings(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    appName VARCHAR(32),
    apiUrl VARCHAR(64),
    adminUrl VARCHAR(64),
    appUrl VARCHAR(64),
    icp VARCHAR(64),
    copyright VARCHAR(128)
);
INSERT INTO xfn_settings VALUES(NULL,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709号-3','Copyright © 北京达内金桥科技有限公司版权所有');

-- 桌台
CREATE TABLE xfn_table(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(64),
    type VARCHAR(16),
    status INT
);
INSERT INTO xfn_table VALUES(NULL,'福满堂','2-4人桌',1);
INSERT INTO xfn_table VALUES(NULL,'金镶玉','6-8人桌',2);
INSERT INTO xfn_table VALUES(NULL,'寿齐天','6-8人桌',3);
INSERT INTO xfn_table VALUES(NULL,'全家福','8-12人桌',4);

-- 预定信息
CREATE TABLE xfn_reservation(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    contactName VARCHAR(64),
    phone VARCHAR(16),
    contactTime BIGINT,
    dinnerTime BIGINT
);
INSERT INTO xfn_reservation VALUES(NULL,'张三','12311111111','1548404830420','1448410400000');
INSERT INTO xfn_reservation VALUES(NULL,'李四','12322222222','1548414830420','1448411400000');
INSERT INTO xfn_reservation VALUES(NULL,'王五','12333333333','1548424830420','1448412400000');

-- 类别
CREATE TABLE xfn_category(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(32)
);
INSERT INTO xfn_category VALUES
(NULL,'肉类'),
(NULL,'丸滑类'),
(NULL,'海鲜河鲜'),
(NULL,'蔬菜豆制品'),
(NULL,'菌菇类');

-- 菜品
CREATE TABLE xfn_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    imgUrl VARCHAR(128),
    price DECIMAL(6,2),
    detail VARCHAR(128),
    category INT,
    FOREIGN KEY(category) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUES
(100000,'草鱼片','CE7I9470.jpg',35,'活鱼现切',1),
(null,'草鱼片','CE7I9470.jpg',105,'活鱼现切活鱼现切',1);


-- 订单
CREATE TABLE xfn_order(
   oid INT PRIMARY KEY AUTO_INCREMENT,
   startTime BIGINT,
   endTime BIGINT,
   customerCount INT,
   tableId INT,
   FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_order VALUES
(1,1548104810420,1548405810420,3,1);

-- 订单详情
CREATE TABLE xfn_order_detail(
   did INT PRIMARY KEY AUTO_INCREMENT,
   dishId INT,  
--    键参考菜品.did
   dishCount INT,
   customerName VARCHAR(64),
   orderId INT,
   FOREIGN KEY(dishId) REFERENCES xfn_dish(did),
   FOREIGN KEY(orderId) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUES
(NULL,100000,1,'张三',1);