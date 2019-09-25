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

 Date: 19/05/2019 15:23:27
*/


-- ----------------------------
-- Table structure for usercourse
-- ----------------------------
DROP TABLE IF EXISTS "public"."usercourse";
CREATE TABLE "public"."usercourse" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "kcid" varchar(50) COLLATE "pg_catalog"."default",
  "userid" varchar(50) COLLATE "pg_catalog"."default",
  "createtime" timestamp(0)
)
;
COMMENT ON TABLE "public"."usercourse" IS '用户课程表';

-- ----------------------------
-- Records of usercourse
-- ----------------------------
INSERT INTO "public"."usercourse" VALUES ('32a5793a-e67a-4e47-85b3-3328faf2f8b0', '3', '15735074530', '2019-05-04 17:18:32');
INSERT INTO "public"."usercourse" VALUES ('1ecb07f7-b4ba-43c9-8335-98b50a90ada2', '7', '15735074530', '2019-05-04 17:18:36');
INSERT INTO "public"."usercourse" VALUES ('b9d55ac4-4c57-4bea-9269-c66806107035', '8', '15735074530', '2019-05-04 17:18:40');
INSERT INTO "public"."usercourse" VALUES ('37e9ea02-a679-4246-b77e-7c01ce6f004a', '3', '987654321', '2019-05-04 17:28:43');
INSERT INTO "public"."usercourse" VALUES ('427b6ff3-53e1-4705-8ae0-95a233ddaef6', '7', '987654321', '2019-05-04 17:29:16');
INSERT INTO "public"."usercourse" VALUES ('cd39fc9d-e60e-42ae-b713-b082152f7bb5', '5', '15735074530', '2019-05-05 02:27:39');
INSERT INTO "public"."usercourse" VALUES ('4ca86529-f864-4706-976b-4873517f9fad', '8', '987654321', '2019-05-05 14:23:35');
INSERT INTO "public"."usercourse" VALUES ('8b418ca4-36ac-4580-aa3b-8e777a2d9897', '3', '', '2019-05-07 01:10:37');
INSERT INTO "public"."usercourse" VALUES ('7514f4d4-5eaf-4097-9fd5-52e1dca2228c', '4', '', '2019-05-07 12:35:18');
INSERT INTO "public"."usercourse" VALUES ('47c085b1-d8e5-423c-930b-1c2ec886f474', '3', '13137373499', '2019-05-07 12:36:51');
INSERT INTO "public"."usercourse" VALUES ('ad14c62b-55a3-4305-adc5-685f32a5f1eb', '5', '', '2019-05-07 12:47:40');
INSERT INTO "public"."usercourse" VALUES ('6271ba2a-93f1-4540-be0b-69e5652c8013', '3', '18537697878', '2019-05-07 16:33:31');
