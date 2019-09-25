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

 Date: 19/05/2019 15:22:39
*/


-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS "public"."subject";
CREATE TABLE "public"."subject" (
  "kmid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "kmmc" varchar(255) COLLATE "pg_catalog"."default",
  "kmimg" varchar(255) COLLATE "pg_catalog"."default",
  "ishomeshow" varchar(2) COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "kmnj" varchar(255) COLLATE "pg_catalog"."default",
  "kmxx" varchar(255) COLLATE "pg_catalog"."default",
  "kmlx" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."subject"."kmid" IS '科目id';
COMMENT ON COLUMN "public"."subject"."kmmc" IS '科目名称';
COMMENT ON COLUMN "public"."subject"."kmimg" IS '科目图片';
COMMENT ON COLUMN "public"."subject"."ishomeshow" IS '是否在首页显示 0=不显示 1=显示';
COMMENT ON COLUMN "public"."subject"."kmnj" IS '科目年级';
COMMENT ON COLUMN "public"."subject"."kmxx" IS '科目学校';
COMMENT ON COLUMN "public"."subject"."kmlx" IS '科目类型';
COMMENT ON TABLE "public"."subject" IS '科目表';

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO "public"."subject" VALUES ('1', '小五语文', 'home/xwyw.png', '1', '5', '1', '1');
INSERT INTO "public"."subject" VALUES ('2', '小五数学', 'home/xwsx.png', '0', '5', '1', '2');
INSERT INTO "public"."subject" VALUES ('3', '小五英语', 'home/xwyy.png', '0', '5', '1', '3');
INSERT INTO "public"."subject" VALUES ('4', '初一语文', 'home/cyyw.png', '0', '1', '2', '1');
INSERT INTO "public"."subject" VALUES ('5', '初一数学', 'home/cysx.png', '0', '1', '2', '2');
INSERT INTO "public"."subject" VALUES ('6', '初一英语', 'home/cyyy.png', '0', '1', '2', '3');
INSERT INTO "public"."subject" VALUES ('7', '初一物理', 'home/cywl.png', '0', '1', '2', '4');
INSERT INTO "public"."subject" VALUES ('8', '初二语文', 'home/ceyw.png', '0', '2', '2', '1');
INSERT INTO "public"."subject" VALUES ('9', '初二数学', 'home/cesx.png', '0', '2', '2', '2');
INSERT INTO "public"."subject" VALUES ('10', '初二英语', 'home/ceyy.png', '1', '2', '2', '3');
INSERT INTO "public"."subject" VALUES ('11', '初二物理', 'home/cewl.png', '0', '2', '2', '4');
INSERT INTO "public"."subject" VALUES ('12', '初三语文', 'home/csyw.png', '0', '3', '2', '1');
INSERT INTO "public"."subject" VALUES ('13', '初三数学', 'home/cssx.png', '0', '3', '2', '2');
INSERT INTO "public"."subject" VALUES ('14', '初三英语', 'home/csyy.png', '0', '3', '2', '3');
INSERT INTO "public"."subject" VALUES ('15', '初三物理', 'home/cswl.png', '0', '3', '2', '4');
INSERT INTO "public"."subject" VALUES ('16', '高一语文', 'home/gyyw.png', '1', '1', '3', '1');
INSERT INTO "public"."subject" VALUES ('17', '高一数学', 'home/gysx.png', '1', '1', '3', '2');
INSERT INTO "public"."subject" VALUES ('18', '高一英语', 'home/gyyy.png', '0', '1', '3', '3');
INSERT INTO "public"."subject" VALUES ('19', '高一物理', 'home/gywl.png', '0', '1', '3', '4');
INSERT INTO "public"."subject" VALUES ('20', '高二语文', 'home/geyw.png', '0', '2', '3', '1');
INSERT INTO "public"."subject" VALUES ('21', '高二数学', 'home/gesx.png', '0', '2', '3', '2');
INSERT INTO "public"."subject" VALUES ('22', '高二英语', 'home/geyy.png', '0', '2', '3', '3');
INSERT INTO "public"."subject" VALUES ('23', '高二物理', 'home/gewl.png', '0', '2', '3', '4');
INSERT INTO "public"."subject" VALUES ('24', '高三语文', 'home/gsyw.png', '0', '3', '3', '1');
INSERT INTO "public"."subject" VALUES ('25', '高三数学', 'home/gssx.png', '1', '3', '3', '2');
INSERT INTO "public"."subject" VALUES ('26', '高三英语', 'home/gsyy.png', '1', '3', '3', '3');
INSERT INTO "public"."subject" VALUES ('27', '高三物理', 'home/gswl.png', '0', '3', '3', '4');
INSERT INTO "public"."subject" VALUES ('28', '小一语文', 'home/xyyw.png', '0', '1', '1', '1');
INSERT INTO "public"."subject" VALUES ('29', '小一数学', 'home/xysx.png', '0', '1', '1', '2');
INSERT INTO "public"."subject" VALUES ('30', '小三英语', 'home/xsyy.png', '0', '3', '1', '3');
INSERT INTO "public"."subject" VALUES ('31', '小二语文', 'home/xeyw.png', '0', '2', '1', '1');
INSERT INTO "public"."subject" VALUES ('32', '小四语文', 'home/xsyw.png', '0', '4', '1', '1');

-- ----------------------------
-- Primary Key structure for table subject
-- ----------------------------
ALTER TABLE "public"."subject" ADD CONSTRAINT "subject_pkey" PRIMARY KEY ("kmid");
