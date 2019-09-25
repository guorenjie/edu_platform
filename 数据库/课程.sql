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

 Date: 19/05/2019 15:22:06
*/


-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS "public"."course";
CREATE TABLE "public"."course" (
  "kcid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "kcbt" varchar(100) COLLATE "pg_catalog"."default",
  "kcnr" varchar(1000) COLLATE "pg_catalog"."default",
  "kmid" varchar(50) COLLATE "pg_catalog"."default",
  "kcimg" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."course"."kcid" IS '课程id';
COMMENT ON COLUMN "public"."course"."kmid" IS '科目id';
COMMENT ON COLUMN "public"."course"."kcimg" IS '课程图片';
COMMENT ON TABLE "public"."course" IS '课程表';

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO "public"."course" VALUES ('1', '小一数学', 'http://39.105.145.175/教学视频/小一数学.mp4', '29', 'freecourse/xysx.jpg');
INSERT INTO "public"."course" VALUES ('3', '小一语文', 'http://39.105.145.175/教学视频/小一语文.mp4', '28', 'freecourse/xyyw.jpg');
INSERT INTO "public"."course" VALUES ('4', '初一语文', 'http://39.105.145.175/教学视频/初一语文.mp4', '4', 'freecourse/cyyw.jpg');
INSERT INTO "public"."course" VALUES ('7', '小五语文', 'http://39.105.145.175/教学视频/小五语文.mp4', '1', 'freecourse/xwyw.jpg');
INSERT INTO "public"."course" VALUES ('5', '初一数学', 'http://39.105.145.175/教学视频/初一数学.mp4', '5', 'freecourse/cysx.jpg');
INSERT INTO "public"."course" VALUES ('8', '小二语文', 'http://39.105.145.175/教学视频/小二语文.mp4', '31', 'freecourse/xeyw.jpg');

-- ----------------------------
-- Primary Key structure for table course
-- ----------------------------
ALTER TABLE "public"."course" ADD CONSTRAINT "course_pkey" PRIMARY KEY ("kcid");
