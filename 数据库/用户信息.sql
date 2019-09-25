/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : PostgreSQL
 Source Server Version : 90400
 Source Host           : 39.105.145.175:5432
 Source Catalog        : edu
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90400
 File Encoding         : 65001

 Date: 19/05/2019 15:23:42
*/


-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."userinfo";
CREATE TABLE "public"."userinfo" (
  "user_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "password" varchar(50) COLLATE "pg_catalog"."default",
  "type" varchar(2) COLLATE "pg_catalog"."default",
  "userimg" varchar(500) COLLATE "pg_catalog"."default",
  "birth" date,
  "sex" int2
)
;
COMMENT ON COLUMN "public"."userinfo"."user_id" IS '账户';
COMMENT ON COLUMN "public"."userinfo"."username" IS '姓名';
COMMENT ON COLUMN "public"."userinfo"."password" IS '密码';
COMMENT ON COLUMN "public"."userinfo"."type" IS '用户类型 0=管理员 （预留）；1=老师； 2=客户';
COMMENT ON COLUMN "public"."userinfo"."userimg" IS '用户头像';
COMMENT ON COLUMN "public"."userinfo"."birth" IS '出生年月';
COMMENT ON COLUMN "public"."userinfo"."sex" IS '性别 0=未知 1=男 2=女';
COMMENT ON TABLE "public"."userinfo" IS '用户表';

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO "public"."userinfo" VALUES ('15735074530', '熊坚强', '123', '1', '/personinfo/15735074530/561bf483025c4115980c7ed7c56e7e5d.jpg', '1994-10-16', 1);
INSERT INTO "public"."userinfo" VALUES ('987654321', '大可爱123', 'yr518588', '1', '/personinfo/987654321/Screenshot_20190505-170752.jpg', '2000-12-15', 2);
INSERT INTO "public"."userinfo" VALUES ('123456789', '杨瑞', 'yr518588', '1', 'personinfo/headimg.png', '2019-04-30', 1);
INSERT INTO "public"."userinfo" VALUES ('13137373499', '123', 'yr518588', '2', 'resources/headimg.png', '2018-05-09', 1);
INSERT INTO "public"."userinfo" VALUES ('18537697878', 'yangli', 'yr518588', '2', 'resources/headimg.png', '2019-05-15', 1);
INSERT INTO "public"."userinfo" VALUES ('15708996861', '杨瑞', '123456', '2', 'personinfo/teacherimg.png', '1996-12-14', 2);

-- ----------------------------
-- Primary Key structure for table userinfo
-- ----------------------------
ALTER TABLE "public"."userinfo" ADD CONSTRAINT "userinfo_pkey" PRIMARY KEY ("user_id");
