CREATE DATABASE library;
USE library;
CREATE TABLE book
(-- 书籍表
  book_id         VARCHAR(20)   NOT NULL,
  isbn            VARCHAR(20)   NOT NULL,
  book_classnum   VARCHAR(10)   NOT NULL,
  book_name       VARCHAR(50)   NOT NULL,
  book_author     VARCHAR(12)   NOT NULL,
  book_translator VARCHAR(12)   NULL,
  book_editionnum VARCHAR(10)   NOT NULL,
  book_publicdate datetime      NOT NULL,
  book_publisher  VARCHAR(20)   NOT NULL,
  book_pages      INT           NOT NULL,
  book_price      NUMERIC(9, 2) NOT NULL,
  book_keyword    VARCHAR(20)   NULL,
  book_volumeid   VARCHAR(20)   NULL,
  book_volumename VARCHAR(20)   NULL,
  book_entrytime  datetime      NOT NULL,
  book_status     TINYINT       NOT NULL,
  book_collection INT           NOT NULL,
  CONSTRAINT book_pk PRIMARY KEY (book_id)
)default charset = utf8;
insert into book values('1234','123','2','冰与火之歌','未知'，'未知','第一版',
2011-1-1,'基线出版社',202,100.5,'史诗','第一卷','不',2015-1-1,1,5);


CREATE TABLE ranking
(-- 用于排名的图书借阅信息表
  isbn            VARCHAR(20)   NOT NULL,
  remain          TINYINT       NOT NULL,
  lastweek_bor    INT DEFAULT 0 NOT NULL,
  thisweek_bor    INT DEFAULT 0 NOT NULL,
  lastweek_search INT DEFAULT 0 NOT NULL,
  thisweek_search INT DEFAULT 0 NOT NULL,
  CONSTRAINT ranking_pk PRIMARY KEY (isbn)
);
CREATE TABLE bookcomment
(-- 书评信息表
  com_id      INT auto_increment,
  user_id     VARCHAR(20) NOT NULL,
  isbn        VARCHAR(20) NOT NULL,
  com_time    datetime    NOT NULL,
  com_content text        NOT NULL,
  CONSTRAINT bookcomment_pk PRIMARY KEY (com_id)
);
CREATE TABLE respond
(-- 书评评价信息表
  res_id      INT auto_increment,
  user_id     VARCHAR(20) NOT NULL,
  com_id      INT         NOT NULL,
  res_time    datetime    NOT NULL,
  res_content text        NOT NULL,
  CONSTRAINT respond_pk PRIMARY KEY (res_id)
);
CREATE TABLE users
(-- 读者信息表
  user_id       VARCHAR(20)              NOT NULL,
  user_password VARCHAR(20)              NOT NULL,
  user_name     VARCHAR(10)              NOT NULL,
  user_balance  NUMERIC(9, 2) DEFAULT 0  NOT NULL,
  user_borrow   TINYINT       DEFAULT 10 NOT NULL,
  user_order    TINYINT       DEFAULT 10 NOT NULL,
  user_borrowed TINYINT       DEFAULT 0  NOT NULL,
  user_ordered  TINYINT       DEFAULT 0  NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);
CREATE TABLE borrow
(-- 读者借阅表
  bor_id         INT auto_increment,
  book_id        VARCHAR(20) NOT NULL,
  user_id        VARCHAR(20) NOT NULL,
  bor_borrowtime datetime    NOT NULL,
  bor_returntime datetime    NOT NULL,
  CONSTRAINT borrow_pk PRIMARY KEY (bor_id)
);
CREATE TABLE orders
(-- 预约信息表
  order_id     INT auto_increment,
  user_id      VARCHAR(20) NOT NULL,
  isbn         VARCHAR(20) NOT NULL,
  order_status TINYINT     NOT NULL,
  CONSTRAINT orders_pk PRIMARY KEY (order_id)
);
CREATE TABLE recommend
(-- 荐购表
  recom_id        INT auto_increment,
  user_id         VARCHAR(20) NOT NULL,
  recom_name      VARCHAR(20) NOT NULL,
  recom_author    VARCHAR(20) NULL,
  recom_publisher VARCHAR(20) NULL,
  recom_time      datetime    NOT NULL,
  CONSTRAINT recommend_pk PRIMARY KEY (recom_id)
);
CREATE TABLE donation
(-- 捐赠表
  dona_id        INT auto_increment,
  user_id        VARCHAR(20) NOT NULL,
  dona_name      VARCHAR(20) NOT NULL,
  dona_author    VARCHAR(20) NULL,
  dona_publisher VARCHAR(20) NULL,
  dona_describe  text        NULL,
  dona_time      datetime    NOT NULL,
  CONSTRAINT donation_pk PRIMARY KEY (dona_id)
);
CREATE TABLE recharge
(-- 充值记录表
  rech_id     INT auto_increment,
  user_id     VARCHAR(20)   NOT NULL,
  rech_amount NUMERIC(9, 2) NOT NULL,
  rech_time   datetime      NOT NULL,
  CONSTRAINT recharge_pk PRIMARY KEY (rech_id)
);
CREATE TABLE expenses
(-- 消费记录表
  exp_id     INT auto_increment,
  user_id    VARCHAR(20)   NOT NULL,
  exp_amount NUMERIC(9, 2) NOT NULL,
  exp_time   datetime      NOT NULL,
  isbn       VARCHAR(20)   NOT NULL,
  CONSTRAINT expenses_pk PRIMARY KEY (exp_id)
);
CREATE TABLE employee
(-- 员工表
  emp_id           VARCHAR(13)             NOT NULL,
  emp_password     VARCHAR(20)             NOT NULL,
  emp_name         VARCHAR(10)             NOT NULL,
  emp_phone        VARCHAR(15)             NULL,
  emp_email        VARCHAR(20)             NULL,
  emp_balance      NUMERIC(9, 2) DEFAULT 0 NOT NULL,
  emp_lastestlogin datetime                NOT NULL,
  CONSTRAINT employee_pk PRIMARY KEY (emp_id)
);
CREATE TABLE purchase
(-- 订购表
  pur_id        INT auto_increment,
  isbn          VARCHAR(20)   NOT NULL,
  pur_num       INT           NOT NULL,
  pur_unitprice NUMERIC(9, 2) NOT NULL,
  pur_time      datetime      NOT NULL,
  pur_buyer     VARCHAR(10)   NOT NULL,
  pur_status    TINYINT       NOT NULL,
  CONSTRAINT purchase_pk PRIMARY KEY (pur_id)
);
CREATE TABLE admin
(-- 管理员表
  admin_id           VARCHAR(13) NOT NULL,
  admin_password     VARCHAR(20) NOT NULL,
  admin_name         VARCHAR(10) NOT NULL,
  admin_phone        VARCHAR(15) NULL,
  admin_email        VARCHAR(20) NULL,
  admin_lastestlogin datetime    NOT NULL,
  CONSTRAINT admin_pk PRIMARY KEY (admin_id)
);
