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

 Date: 19/05/2019 15:22:53
*/


-- ----------------------------
-- Table structure for testpaper
-- ----------------------------
DROP TABLE IF EXISTS "public"."testpaper";
CREATE TABLE "public"."testpaper" (
  "sjid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sjbt" varchar(255) COLLATE "pg_catalog"."default",
  "sjdj" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."testpaper"."sjid" IS '试卷id';
COMMENT ON COLUMN "public"."testpaper"."sjbt" IS '试卷标题';
COMMENT ON COLUMN "public"."testpaper"."sjdj" IS '试卷等级 1=小学，2=初中，3=高中';
COMMENT ON TABLE "public"."testpaper" IS '试卷表';

-- ----------------------------
-- Records of testpaper
-- ----------------------------
INSERT INTO "public"."testpaper" VALUES ('14', '高三英语', '3');
INSERT INTO "public"."testpaper" VALUES ('10', '高一语文', '3');
INSERT INTO "public"."testpaper" VALUES ('9', '初三物理', '2');
INSERT INTO "public"."testpaper" VALUES ('5', '初二英语', '2');
INSERT INTO "public"."testpaper" VALUES ('4', '初一语文', '2');
INSERT INTO "public"."testpaper" VALUES ('2', '小一数学', '1');
INSERT INTO "public"."testpaper" VALUES ('1', '小一语文', '1');
INSERT INTO "public"."testpaper" VALUES ('3', '小五语文', '1');

-- ----------------------------
-- Primary Key structure for table testpaper
-- ----------------------------
ALTER TABLE "public"."testpaper" ADD CONSTRAINT "testpaper_pkey" PRIMARY KEY ("sjid");
