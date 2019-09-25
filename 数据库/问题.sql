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

 Date: 19/05/2019 15:22:25
*/


-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS "public"."question";
CREATE TABLE "public"."question" (
  "wtid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT nextval('add_question_id'::regclass),
  "wtbt" varchar(100) COLLATE "pg_catalog"."default",
  "wtnr" text COLLATE "pg_catalog"."default",
  "twsj" timestamp(0),
  "hfnr" text COLLATE "pg_catalog"."default",
  "hfsj" timestamp(0),
  "wtlx" varchar(2) COLLATE "pg_catalog"."default",
  "kcid" varchar(50) COLLATE "pg_catalog"."default",
  "twr" varchar(50) COLLATE "pg_catalog"."default",
  "hfr" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."question"."wtid" IS '问题id';
COMMENT ON COLUMN "public"."question"."wtbt" IS '问题标题';
COMMENT ON COLUMN "public"."question"."wtnr" IS '问题内容';
COMMENT ON COLUMN "public"."question"."twsj" IS '提问时间';
COMMENT ON COLUMN "public"."question"."hfnr" IS '回复内容';
COMMENT ON COLUMN "public"."question"."hfsj" IS '回复时间';
COMMENT ON COLUMN "public"."question"."wtlx" IS '问题类型 0=入学咨询 1=课程咨询';
COMMENT ON COLUMN "public"."question"."kcid" IS '课程id';
COMMENT ON COLUMN "public"."question"."twr" IS '提问人';
COMMENT ON COLUMN "public"."question"."hfr" IS '回复人';
COMMENT ON TABLE "public"."question" IS '问题表';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO "public"."question" VALUES ('2', '老师可不可以再详细讲一下合并同类项？', '<p>
    <span style="color: rgb(16, 16, 16); font-family: &quot;Microsoft YaHei&quot;; font-size: 28px; background-color: rgb(255, 255, 255);">老师可不可以再详细的讲解一下合并同类项？</span>
</p>', '2019-04-02 22:06:21', '<h3 class="title-text" style="margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;">
    合并同类项法则
</h3>
<p>
    （一）合并同类项后，所得项的系数是合并前各同类项的系数之和，且字母连同它的指数不变。字母不变，<a target="_blank" href="https://baike.baidu.com/item/%E7%B3%BB%E6%95%B0" style="color: rgb(19, 110, 194); text-decoration-line: none;">系数</a>相加减。
</p>
<p>
    （二）同类项的系数相加，所得的结果作为系数，字母和字母的<a target="_blank" href="https://baike.baidu.com/item/%E6%8C%87%E6%95%B0" style="color: rgb(19, 110, 194); text-decoration-line: none;">指数</a>不变。
</p>
<p>
    <a style="color: rgb(19, 110, 194); position: absolute; top: -50px;" name="1_3"></a><a style="color: rgb(19, 110, 194); position: absolute; top: -50px;" name="sub313935_1_3"></a><a style="color: rgb(19, 110, 194); position: absolute; top: -50px;" name="补充说明"></a><a style="color: rgb(19, 110, 194); position: absolute; top: -50px;" name="1-3"></a>
</p>
<h3 class="title-text" style="margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;">
    补充说明
</h3>
<p>
    1、如果两个单项式，它们所含的字母相同，并且各字母的指数也分别相同，那么就称这两个单项式为<a target="_blank" href="https://baike.baidu.com/item/%E5%90%8C%E7%B1%BB%E9%A1%B9" style="color: rgb(19, 110, 194); text-decoration-line: none;">同类项</a>。如<img align="absmiddle" alt="" title="" height="13" width="24" src="https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D24/sign=3bda8cdc47ed2e73f8e981288601bab9/ac345982b2b7d0a2015467c5c6ef76094a369acc.jpg" style="border: 0px;"/>&nbsp;与<img align="absmiddle" alt="" title="" height="13" width="35" src="https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D35/sign=9d3cd4e3ab1ea8d38e227201960a1862/dbb44aed2e738bd41ddad169ac8b87d6267ff9eb.jpg" style="border: 0px;"/>&nbsp;，<img align="absmiddle" alt="" title="" height="16" width="30" src="https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D30/sign=b0903d080133874498c5297c500fe049/b2de9c82d158ccbf2a35d66214d8bc3eb03541d8.jpg" style="border: 0px;"/>&nbsp;与<img align="absmiddle" alt="" title="" height="16" width="30" src="https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D30/sign=b0903d080133874498c5297c500fe049/b2de9c82d158ccbf2a35d66214d8bc3eb03541d8.jpg" style="border: 0px;"/>&nbsp;都是同类项。特别地，所有的<a target="_blank" href="https://baike.baidu.com/item/%E5%B8%B8%E6%95%B0" style="color: rgb(19, 110, 194); text-decoration-line: none;">常数</a>项也都是同类项。
</p>
<p>
    2、把多项式中的同类项合并成一项，叫做同类项的合并（或合并同类项）。同类项的合并应遵照法则进行：把同类项的<a target="_blank" href="https://baike.baidu.com/item/%E7%B3%BB%E6%95%B0" style="color: rgb(19, 110, 194); text-decoration-line: none;">系数</a>相加，所得结果作为系数，字母和字母的<a target="_blank" href="https://baike.baidu.com/item/%E6%8C%87%E6%95%B0" style="color: rgb(19, 110, 194); text-decoration-line: none;">指数</a>不变。
</p>
<p>
    3、合并同类项的理论依据。它所依据的就是大家早已熟知了的<a target="_blank" href="https://baike.baidu.com/item/%E4%B9%98%E6%B3%95%E5%88%86%E9%85%8D%E5%BE%8B" style="color: rgb(19, 110, 194); text-decoration-line: none;">乘法分配律</a>，<img align="absmiddle" alt="" title="" height="18" width="119" src="https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D119/sign=0b9ceef1a4014c081d3b2ca4337a025b/7acb0a46f21fbe0989dba04c66600c338644ade5.jpg" style="border: 0px;"/>&nbsp;。
</p>', '2019-04-09 22:07:05', '1', '5', '15735074530', '15708996861');
INSERT INTO "public"."question" VALUES ('4', '请问我女儿正在上初二，数学比较差，有推荐的课程吗？', '<p>
    <span style="color: rgb(16, 16, 16); font-family: &quot;Microsoft YaHei&quot;; font-size: 28px; background-color: rgb(255, 255, 255);">请问我女儿正在上初二，数学比较差，有推荐的课程吗？</span>
</p>', '2019-04-02 22:06:21', '', NULL, '0', NULL, '15735074530', '');
INSERT INTO "public"."question" VALUES ('1', '请问我女儿正在上初二，数学比较差，有推荐的课程吗？', '<p>
    <span style="color: rgb(16, 16, 16); font-family: &quot;Microsoft YaHei&quot;; font-size: 28px; background-color: rgb(255, 255, 255);">请问我女儿正在上初二，数学比较差，有推荐的课程吗？</span>
</p>', '2019-04-02 22:06:21', '<p>
    <span style="color: rgb(16, 16, 16); font-family: &quot;Microsoft YaHei&quot;; font-size: 28px;">您好，我们有数学精品课推荐给您</span>
</p>', '2019-04-09 22:07:05', '0', NULL, '15735074530', '15708996861');
INSERT INTO "public"."question" VALUES ('7', '老师可不可以详细讲一下抛物线？', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px;">下面的图是什么意思？<br/></p><p><a class="exp-image-wraper" href="http://jingyan.baidu.com/album/af9f5a2d7f0d6443140a4527.html?picindex=2" log="type:20150831,pos:enter_step" target="_self" style="text-decoration-line: none; color: rgb(45, 100, 179); position: relative; display: block; float: left;"><img class="exp-image-default" alt="初中数学知识点的全面总结" src="http://35.201.165.105:8000/storage/image/20190501/1556668217197888.jpg" style="border: 0px; display: block; max-width: 500px; overflow: hidden; font-family: &quot;Microsoft Yahei&quot;, 微软雅黑, arial, 宋体, sans-serif; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"/></a></p><p><br/></p>', '2019-05-01 07:55:37', '<p>我也看不懂</p>', '2019-05-01 10:38:19', '1', '5', '15735074530', '15735074530');
INSERT INTO "public"."question" VALUES ('9', '小学语文疑问', '<p>春眠不觉晓，下一句是什么？</p>', '2019-05-01 10:41:39', NULL, NULL, '1', '3', '15708996861', NULL);
INSERT INTO "public"."question" VALUES ('10', '请问我儿子正在上高三，有什么推荐的课程吗？', '<p>请问我儿子正在上高三，有什么推荐的课程吗？</p>', '2019-05-01 11:02:37', '<p>推荐三年高考，两年模拟</p>', '2019-05-01 11:07:13', '0', '', '15708996861', '15735074530');
INSERT INTO "public"."question" VALUES ('8', '测试提问', '<p>测试提问</p>', '2019-05-01 08:06:04', NULL, NULL, '1', '5', '15735074530', NULL);
INSERT INTO "public"."question" VALUES ('11', '数学', '<p>初一数学基础不好，选什么课<br/></p>', '2019-05-03 22:48:12', '<p>张开一老师的初一数学</p>', '2019-05-05 17:10:35', '0', '', '15735074530', '987654321');
INSERT INTO "public"."question" VALUES ('3', '老师可不可以再详细讲一下控制变量法？', '<p>
    <span style="color: rgb(16, 16, 16); font-family: &quot;Microsoft YaHei&quot;; font-size: 28px; background-color: rgb(255, 255, 255);">老师可不可以再详细的讲解一下合并同类项？</span>
</p>', '2019-04-02 22:06:21', '<p><span style="text-decoration: underline;"><strong>测试修改回复</strong></span></p>', '2019-05-01 10:37:17', '1', '5', '15735074530', '15735074530');
INSERT INTO "public"."question" VALUES ('12', '13345', '<p>afdhedtj</p>', '2019-05-07 16:32:33', NULL, NULL, '0', '', '18537697878', NULL);

-- ----------------------------
-- Primary Key structure for table question
-- ----------------------------
ALTER TABLE "public"."question" ADD CONSTRAINT "question_pkey" PRIMARY KEY ("wtid");
