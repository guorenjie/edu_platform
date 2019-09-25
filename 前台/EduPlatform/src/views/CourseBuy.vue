<!--购买课程 -->
<template>
  <div class="coursebuy" style="margin: 20px 50px auto 50px;">
    <!-- 顶部线条 -->
      <div style="width: 100%;height: 1px;background:#C8C8C8;"/>
      <el-row style="margin-top:40px;height:440px;">
        <el-col :span="10" style="text-align: center;">
          <img class="coursebuyimg" src="@/assets/img/freecourse/customized.png">
          <span class="coursebuyprice">¥300</span>
        </el-col>
        <el-col :span="14" style="padding-right: 25px;">
          <img class="coursebuypen" src="@/assets/img/coursebuy/pen.png">
          <div class="coursebuytitle">购课须知</div>
          <div class="coursebuycontent">课程形式为28节视频课，课程在有效期內可以反复观看。</div>
          <div class="coursebuycontent">课程有效期至：2019年9月27日，请同学在有效期內观看。</div>
          <img class="coursebuypen" src="@/assets/img/coursebuy/pen.png">
          <div class="coursebuytitle">版权声明</div>
          <div class="coursebuycontent">本课程知识产权归蓝海舟教育所有，与本课程相关的所有视频、文字、图片等知识产权均归属于蓝海舟教育。</div>
        </el-col>
      </el-row>
      <div style="clear: both;text-align: center;">
        <button class="confirmbuy" @click="$router.push({path: '/courseplay' })">确认购买</button>
      </div>
  </div>
</template>
<script>
export default {
  name: 'coursebuy-view',
  data() {
    return {
    }
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
  },
  methods: {
    register() {
      if (this.autologin) {
        this.$router.push({ path: '/' })
      } else {
        this.$router.push({ path: '/login' })
      }
    },
  },
}
</script>
<style scoped>
  .coursebuyimg{
    margin-top: 12px;
    width:440px;
    height:440px;
  }
  .coursebuyprice{
    position: relative;
    bottom: 37px;
    left: -120px;
    background: #fff;
    width: 116px;
    height: 54px;
    line-height: 52px;
    color: rgba(255, 152, 0, 1);
    font-size: 36px;
    text-align: center;
    font-family: Roboto;
    border: 1px solid rgba(255, 255, 255, 1);
  }
  .coursebuypen{
    width: 40px;
    height: 40px;
    background-color: rgba(8, 150, 255, 1);
    float: left;
    margin-top: 5px;
  }
  .coursebuytitle{
    height: 51px;
    line-height: 49px;
    color: rgba(8, 150, 255, 1);
    font-size: 34px;
    font-weight: bold;
    margin-bottom: 30px;
  }
  .coursebuycontent{
    height: 80px;
    line-height: 35px;
    color: rgba(16, 16, 16, 1);
    font-size: 24px;
    font-weight: bold;
  }
  .confirmbuy{
    margin-top: 130px;
    width: 560px;
    height: 78px;
    border-radius: 4px;
    background-color: rgba(8, 150, 255, 1);
    color: rgba(255, 255, 255, 1);
    font-size: 28px;
    text-align: center;
    font-family: Microsoft Yahei;
    border: 1px solid rgba(187, 187, 187, 1);
  }
</style>
