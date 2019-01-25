SET NAMES UTF8;
DROP DATABASE IF EXISTS xfn;
CREATE DATABASE xfn CHARSET=UTF8;
USE xfn;
CREATE TABLE xfn_admin(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    aname VARCHAR(32) UNIQUE,
    apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES(NULL,'admin','123456');
INSERT INTO xfn_admin VALUES(NULL,'boss','999999');

CREATE TABLE xfn_settings(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    appName VARCHAR(32),
    apiUrl VARCHAR(64),
    adminUrl VARCHAR(64),
    appUrl VARCHAR(64),
    icp VARCHAR(64),
    copyright VARCHAR(128)
);
CREATE TABLE xfn_table(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(64),
    type VARCHAR(16),
    status INT
);
CREATE TABLE xfn_reservation(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    contactName VARCHAR(64),
    phone VARCHAR(16),
    contactTime BIGINT,
    dinnerTime BIGINT
);
CREATE TABLE xfn_category(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(32)
);
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
-- 订单
CREATE TABLE xfn_order(
   oid INT PRIMARY KEY AUTO_INCREMENT,
   startTime BIGINT,
   endTime BIGINT,
   customerCount INT,
   tableld INT,
   FOREIGN KEY(tableld) REFERENCES xfn_table(tid)
);
-- 订单详情
CREATE TABLE xfn_order_detail(
   did INT PRIMARY KEY AUTO_INCREMENT,
   dishld INT,
--    键参考菜品.did
   dishCount INT,
   customerName VARCHAR(64),
   orderld INT,
   FOREIGN KEY(dishld) REFERENCES xfn_dish(did),
   FOREIGN KEY(orderld) REFERENCES xfn_order(oid)
);