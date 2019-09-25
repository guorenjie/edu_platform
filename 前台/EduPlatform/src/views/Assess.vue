<!--在线测评 -->
<template>
  <div class="testpaper" style="margin:0 100px;">
        <div class="testpapername">{{sjbt}}</div>
        <div v-if="tms[0]" class="testpapertips">本套试卷共10个题目，每次考试随机抽取5个题目进行考试，每题20分，共100分。考试时间5分钟。</div>
        <div class="testpaperdashed" ></div>
        <div class="testpapercontent" v-for="(item,index) in tms" :key="index">
          <div class="testpaperqusetion">
            <span style="vertical-align: middle;color:red;">*</span>
            <span>{{index+1}}.</span>
            <span v-html="item.tmwt" />
          </div>
          <div class="testpaperanswer">
            <el-radio-group v-model="answers[index]" style="width:100%;">
              <el-radio label="A"><span v-html="item.a" /></el-radio>
              <el-radio label="B"><span v-html="item.b" /></el-radio>
              <el-radio label="C"><span v-html="item.c" /></el-radio>
            </el-radio-group>
          </div>
        </div>
        <button v-if="tms[0]" class="testpapersubmit" @click="testpapersubmit">交卷</button>
  </div>
</template>
<script>
export default {
  name: 'asses-view',
  data() {
    return {
      sjid: '', // 试卷id
      sjbt: '', // 试卷标题
      tms: '', // 题目
      answers: ['', '', '', '', ''], // 回答的答案
    }
  },
  created() {
    this.$emit('header', false);
    this.$emit('footer', false);
    if (this.$route.query.sjid) {
      this.sjid = this.$route.query.sjid;
    }
    if (this.$route.query.sjbt) {
      this.sjbt = this.$route.query.sjbt;
    }
    this.getTopic()
  },
  methods: {
    getTopic() {
      const paramObj = {
        sjid: this.sjid,
      }
      this.$server.getTopic(paramObj).then((data) => {
        if (data.code === '0') {
          this.tms = JSON.parse(data.tm);
        } else {
          this.$message.info(data.msg);
        }
      })
    },
    testpapersubmit() {
      const hasnull = this.answers.indexOf('');
      if (hasnull !== -1) {
        this.$alert(`第${hasnull + 1}题尚未完成，请完成所有题目再进行交卷！`, '提示', {
          confirmButtonText: '确定',
        })
      } else {
        this.$confirm('确认交卷吗?', '提示', {
          confirmButtonText: '交卷',
          cancelButtonText: '再想想',
          type: 'info',
        }).then(() => {
          this.$message.success('交卷成功!');
          let score = 100; // 分数
          const erroranswes = [];// 回答错误的答案
          for (let i = 0; i < this.tms.length; i += 1) {
            if (this.tms[i].tmzqda !== this.answers[i]) {
              score -= 20;
              erroranswes.push({ index: i, value: this.answers[i] });
            }
          }
          this.$router.push({ path: '/assessresult', query: { sjbt: this.sjbt, totalscore: score } })
        }).catch(() => {
          this.$message.info('取消交卷')
        });
      }
    },
  },
}
</script>
<style scoped>
  .testpapername{
    margin-top: 45px;
    line-height: 52px;
    color: rgba(8, 150, 255, 1);
    font-size: 36px;
    text-align: center;
    font-family: Microsoft Yahei;
  }
  .testpapertips{
    margin-top: 45px;
    line-height: 52px;
    font-size: 24px;
    font-family: Microsoft Yahei;
  }
  .testpaperdashed{
    width: 100%;
    height: 1px;
    background-image: linear-gradient(to right, #ccc 0%, #ccc 50%, transparent 50%);
    background-size: 8px 1px;
    background-repeat: repeat-x;
    margin-top: 15px;
  }
  .testpapercontent{
    padding: 70px 0px 34px 0px;
    border-bottom: solid 1px #EFEFEF;
  }
  .testpaperqusetion{
    font-size: 24px;
    font-weight: bold;
    font-family: Microsoft Yahei;
  }
  .testpaperanswer{
    margin-top: 15px;
    font-size:24px;
  }
  .testpaperanswer>>>.el-radio {
    color: #000000;
    font-weight: 500;
    cursor: pointer;
    white-space: nowrap;
    outline: 0;
    line-height: 2;
    min-width: 30%;
}
  .testpaperanswer>>>.el-radio__input {
    white-space: nowrap;
    cursor: pointer;
    outline: 0;
    line-height: 1;
    vertical-align: middle;
    height: 24px;
}
.testpaperanswer>>>.el-radio__label {
    font-size: 14px;
    font-size: 24px;
    padding-left: 10px;
}
.testpapersubmit{
  display: block;
  margin: 50px auto 61px auto;
  width: 180px;
  height: 80px;
  line-height: 44px;
  border-radius: 18px;
  background-color: rgba(8, 150, 255, 1);
  color: rgba(255, 255, 255, 1);
  font-size: 30px;
}
</style>
