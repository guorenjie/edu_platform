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

 Date: 19/05/2019 15:23:57
*/


-- ----------------------------
-- Table structure for var
-- ----------------------------
DROP TABLE IF EXISTS "public"."var";
CREATE TABLE "public"."var" (
  "vid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "vname" varchar(255) COLLATE "pg_catalog"."default",
  "vvalue" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."var"."vid" IS '变量id';
COMMENT ON COLUMN "public"."var"."vname" IS '变量名称';
COMMENT ON COLUMN "public"."var"."vvalue" IS '变量值';
COMMENT ON TABLE "public"."var" IS '系统变量表';

-- ----------------------------
-- Records of var
-- ----------------------------
INSERT INTO "public"."var" VALUES ('ad1', '首页轮播图片', 'home/adone.png');
INSERT INTO "public"."var" VALUES ('ad2', '首页轮播图片', 'home/adtwo.png');

-- ----------------------------
-- Primary Key structure for table var
-- ----------------------------
ALTER TABLE "public"."var" ADD CONSTRAINT "var_pkey" PRIMARY KEY ("vid");
