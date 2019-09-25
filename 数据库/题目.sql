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

 Date: 19/05/2019 15:23:10
*/


-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS "public"."topic";
CREATE TABLE "public"."topic" (
  "tmid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "tmwt" text COLLATE "pg_catalog"."default",
  "tmzqda" varchar(10) COLLATE "pg_catalog"."default",
  "sjid" varchar(50) COLLATE "pg_catalog"."default",
  "a" varchar(500) COLLATE "pg_catalog"."default",
  "b" varchar(500) COLLATE "pg_catalog"."default",
  "c" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."topic"."tmid" IS '题目id';
COMMENT ON COLUMN "public"."topic"."tmwt" IS '题目问题';
COMMENT ON COLUMN "public"."topic"."tmzqda" IS '题目答案';
COMMENT ON COLUMN "public"."topic"."sjid" IS '试卷id';
COMMENT ON TABLE "public"."topic" IS '试卷题目表';

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO "public"."topic" VALUES ('12', '<span>    下列字母的排列顺序错误的一组是</span>', 'B', '1', 'A、 ABCDEF', 'B、JMMKLG', 'C、OPQRST');
INSERT INTO "public"."topic" VALUES ('25', '<span>    下列句中成语使用不当的一项是：（ ）</span>', 'B', '4', 'A.文化、科技、卫生“三下乡”活动给农村带来许多新技术、新信息,让农民们获益匪浅', 'B.家用电器降价刺激了老百姓的消费欲望,原来趋于滞销的彩电,现在一下子成了炙手可热的商品', 'C.谎言让他感到惴惴不安,终于,他鼓足勇气,走到了老师面前');
INSERT INTO "public"."topic" VALUES ('26', '<span>    下列成语运用哪项正确（）</span>', 'A', '4', 'A、冬天老年人要增加营养,也要适当运动,在户外锻炼时一定要适可而止,以步行为宜,时间最好选在傍晚,还要注意保暖,防止着凉', 'B、时间真如行云流水,申奥成功的情景仿佛就在昨天,转眼间,举世瞩目的北京奥运会距离我们已经不到一百天了', 'C. 有段时间,沪深股市指数波动非常大,有时一天上涨几百点,有时一天下跌几百点,涨跌幅度之大令人叹为观止');
INSERT INTO "public"."topic" VALUES ('21', '<span>    按要求朗读，重音标示错误的一组是</span>', 'C', '3', 'A、今年我上五年级。（不是明年）', 'B、吴昊喜欢踢足球。（不讨厌踢足球）', 'C、南京是江苏省的省会（其它的城市不是）');
INSERT INTO "public"."topic" VALUES ('22', '<span>    “释”这个字用部首查字法应查部首</span>', 'A', '3', 'A、采', 'B、米', 'C、又');
INSERT INTO "public"."topic" VALUES ('7', '<span>    下列大小形式互换完全正确的是</span>', 'B', '1', 'A、T t Wu', 'B、Y y N n', 'C、G g L I');
INSERT INTO "public"."topic" VALUES ('8', '<span>    下面字形和读音都正确的一组是</span>', 'B', '1', 'A、倾(qīng)盆大雨', 'B、磨（mî）房', 'C、一担（dàn）');
INSERT INTO "public"."topic" VALUES ('19', '<span>    下列词的字形错误的一组是</span>', 'A', '3', 'A、桥梁', 'B、漂流', 'C、资态');
INSERT INTO "public"."topic" VALUES ('9', '<span>    读音节，注意声调，选出调号有错误的一组</span>', 'C', '1', 'A、水平如镜shuǐ píng rú jìng', 'B、桃李争妍táo lǐ zhēng yán', 'C、开卷有益kāi juǎn yǒu yì');
INSERT INTO "public"."topic" VALUES ('10', '<span>    “壮”这个字如果用音序查字法来查的话，应查</span>', 'A', '1', 'A、Z', 'B、zh', 'C、zuàng');
INSERT INTO "public"."topic" VALUES ('23', '<span>    “塞”在字典中有如下解释：①塞子；②边关，塞外；③重要的地方； ④把窟窿堵住。在“军事要塞”这个词中它应选</span>', 'B', '3', 'A、①', 'B、②', 'C、③');
INSERT INTO "public"."topic" VALUES ('20', '<span>    下列字形正确的一组是</span>', 'B', '3', 'A、锻练', 'B、一丝不苟', 'C、遵敬');
INSERT INTO "public"."topic" VALUES ('15', '<span>    98-6 =（）</span>', 'C', '2', 'A、90', 'B、80', 'C、92');
INSERT INTO "public"."topic" VALUES ('18', '<span>    31+7=（）</span>', 'C', '2', 'A、35', 'B、317', 'C、38');
INSERT INTO "public"."topic" VALUES ('14', '<span>    84-9 =（）</span>', 'C', '2', 'A、89', 'B、73', 'C、75');
INSERT INTO "public"."topic" VALUES ('13', '<span>    40+7 =（）</span>', 'A', '2', 'A、47', 'B、45', 'C、33');
INSERT INTO "public"."topic" VALUES ('16', '<span>    80-9=（）</</span>', 'B', '2', 'A、89', 'B、71', 'C、67');
INSERT INTO "public"."topic" VALUES ('59', '<span>    下列四种现象中属于扩散现象的是（）</span>', 'C', '9', 'A．我国北方地区频发的“沙尘暴天气”', 'B．春天柳絮漫天飞舞', 'C．端午节，粽叶飘香');
INSERT INTO "public"."topic" VALUES ('58', '<span>    水和酒精混合后的体积小于原来体积之和，这是由于（）</span>', 'A', '9', 'A．水和酒精分子之间有空隙', 'B．酒精挥发了一部分', 'C．酒精分子热运动');
INSERT INTO "public"."topic" VALUES ('57', '<span>    下列事例中，通过热传递改变物体内能的是（）</span>', 'C', '9', 'A．钻木取火', 'B．双手互搓发热', 'C．晒太阳取暖');
INSERT INTO "public"."topic" VALUES ('27', '<span>   下列各句中,加粗的成语使用恰当的一项是（ ）</span>', 'A', '4', 'A.创造的过程不是消极的袖手旁观,而是有想像力的有计划的探索', 'B.某些部门稍一放松,那些制假造假的地下工厂又如雨后春笋一般兴旺起来', 'C.我们班的语文科代表学写散文一举便成功,他已在校刊上发表了好几篇散文,真是妙手偶得啊!');
INSERT INTO "public"."topic" VALUES ('56', '<span>    两铁块相互接触时无热传递，说明它们具有相同的（）</span>', 'C', '9', 'A．内能', 'B．热量', 'C．温度');
INSERT INTO "public"."topic" VALUES ('55', '<span>    下列说法正确的是（）</span>', 'B', '9', 'A．物体放出热量，温度一定降低', 'B．热传递中，热量从高温物体传给低温物体', 'C．热传递中，热量从低温物体传给高温物体');
INSERT INTO "public"."topic" VALUES ('28', '<span>   下列句中成语使用错误的一项是</span>', 'B', '4', 'A.今年十一黄金周期间,清秀旖旎的西湖风光令国内外游人流连忘返', 'B.为了在科技比赛中体现创新精神,许多同学处心积虑,设计了各种造型的航空模型', 'C.为了纪念安徒生诞辰200周年,国家邮政局发行了一套令人赏心悦目的《安徒生童话》邮票');
INSERT INTO "public"."topic" VALUES ('29', '<span>    下列各句中成语使用不恰当的一项目是：（ ）</span>', 'C', '4', 'A.诸如此类的句子,委实不胜枚举', 'B.这是一篇雅俗共赏的上乘之作', 'C.如果学习方法运用恰当,就会收到事倍功半的效果');
INSERT INTO "public"."topic" VALUES ('31', '<span>    What ______the women _______over there?</span>', 'B', '5', 'A is , do', 'B are ,doing', 'C is , doing');
INSERT INTO "public"."topic" VALUES ('35', '<span>    Are you playing basketball? --______</span>', 'A', '5', 'A Yes, I am', 'B No, you are', 'C Yes, I do');
INSERT INTO "public"."topic" VALUES ('34', '<span>    I want _______the room. Could you please _____me?</span>', 'C', '5', 'A to clean; to help', 'B cleaning; helping', 'C to clean;');
INSERT INTO "public"."topic" VALUES ('32', '<span>    Bill doesn’t like cooking _____cleaning.</span>', 'B', '5', 'A and', 'B or', 'C but');
INSERT INTO "public"."topic" VALUES ('33', '<span>    --_______does your mother do? --She is a doctor.</span>', 'C', '5', 'A How', 'B Who', 'C What');
INSERT INTO "public"."topic" VALUES ('62', '<span>    下列各句中，加点的词语使用恰当的一句是（ ）</span>', 'B', '10', 'A、著名的雄辩家，在辩论时常常无所不用其极，或巧妙设喻，或巧设圈套，逻辑严谨，酣畅犀利，让对方无从辩驳。', 'B、同是儒家学说的代表人物，如果说，孔子给人的感觉是仁者的谆谆教诲，那么孟子给人的感觉就是口若悬河，机智而雄辩。', 'C、易中天讲三国时，不时串用“CEO”“民营企业”等现代词汇，这些词汇的串用让他把枯燥的学术讲得生龙活虎，引人入胜。');
INSERT INTO "public"."topic" VALUES ('65', '<span>    选出下列加点字注音全对的一项（ ）</span>', 'C', '10', 'A．吮吸(shǔn) 涎皮（yán） 敕造（chì） 百无聊赖(lài)', 'B．讪讪(shàn) 庠序（xiáng） 俨然(yǎn) 少不更事(jīng)', 'C．折本（shé） 干瘪（biě) 谬种(miù) 沸反盈天(fèi)');
INSERT INTO "public"."topic" VALUES ('61', '<span>    选出没有语病的一项（ ）</span>', 'C', '10', 'A．凭借NBA的一部宣传片，姚明完成了从单纯的“体育明星”转变到“体育、娱乐明星”。', 'B．山东大学积极采取措施，培养新入校的大学生，力争在较短时间内解决史学界后继乏人的状况。', 'C．有尽之言能传无穷之意，诀窍就在“言”是经过精选的，有典型性，能代表或暗示出许多其他的东西。');
INSERT INTO "public"."topic" VALUES ('63', '<span>    依次填入下列各句横线处的词语，最恰当的一组是（ ）<br/>①他的功绩仿佛早就为时间所______，他也从不向别人说起自己光荣的过去。<br/>②微生物“偷渡”到太空并在空间繁殖，目前已成为载人航天领域中一个_____解决的严重问题。<br/>③一座占地面积相当于600个足球场，融商务贸易、金融会展等功能于一体的地下城刚刚______专家论证，预计6月初破土动工。
</span>', 'C', '10', 'A.  淹没 亟待 经过', 'B.   湮没 急需 通过', 'C.  湮没 亟待 通过');
INSERT INTO "public"."topic" VALUES ('64', '<span>    下列各组词语中，有错别字的一组是（ ）</span>', 'B', '10', 'A．寒暄 执着 踌躇 众说纷纭', 'B． 慰藉 隽永 朦胧 眼花瞭乱', 'C．鞭笞 赋予 萦绕 出神入化');

-- ----------------------------
-- Primary Key structure for table topic
-- ----------------------------
ALTER TABLE "public"."topic" ADD CONSTRAINT "topic_pkey" PRIMARY KEY ("tmid");
