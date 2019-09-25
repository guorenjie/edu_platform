<!--测评结果 -->
<template>
  <div class="assesresult" style="margin:0px 98px;">
    <div class="assesname">{{sjbt}}</div>
    <div class="assestitle">成绩单</div>
    <img src="@/assets/img/assesresult/score.png">
    <div class="yourscore">{{yourscore}}</div>
    <div class="answerrightcount">{{answerrightcount}}</div>
    <div class="evaluate">名师点评：基本概念掌握较好、但计算能力欠佳，还需加强计算能力的提高。</div>
  </div>
</template>
<script>
export default {
  name: 'assesresult-view',
  data() {
    return {
      sjbt: '',
      yourscore: '40',
      answerrightcount: '2',
    }
  },
  created() {
    this.$emit('header', false);
    this.$emit('footer', false);
    if (this.$route.query.sjbt) {
      this.sjbt = this.$route.query.sjbt;
    }
    if (this.$route.query.totalscore) {
      this.yourscore = this.$route.query.totalscore;
      this.answerrightcount = this.yourscore / 20;
    }
  },
  methods: {
  },
}
</script>
<style scoped>
  .assesname{
    margin-top: 45px;
    line-height: 52px;
    color: rgba(8, 150, 255, 1);
    font-size: 36px;
    text-align: center;
    font-family: Microsoft Yahei;
  }
  .assestitle{
    margin-top: 27px;
    margin-bottom: 70px;
    line-height: 44px;
    font-size: 30px;
    color: rgba(16, 16, 16, 1);
  }
  .yourscore{
    font-size: 45px;
    font-weight: bold;
    position: relative;
    top: -148px;
    left: 270px;
    width: 80px;
    background: #fff;
    text-align: right;
  }
  .answerrightcount{
    font-size: 45px;
    font-weight: bold;
    position: relative;
    top: -208px;
    left: 826px;
    width: 45px;
    background: #fff;
    text-align: right;
  }
  .evaluate{
    height: 104px;
    line-height: 52px;
    color: rgba(16, 16, 16, 1);
    font-size: 36px;
  }
</style>
