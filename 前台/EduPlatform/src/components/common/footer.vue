<template>
    <div class="myfooter">
      <el-row>
        <el-col class="footleft" style="width:20%;font-weight: bold;text-align: left;">
          <div>蓝海舟教育</div>
        </el-col>
        <el-col style="width:20%;">
          <div class="foottitle">推荐链接</div>
          <div class="footcontent">教育咨询</div>
          <div class="footcontent">国外教育</div>
          <div class="footcontent">高考新政</div>
          <div class="footcontent">国外动态</div>
        </el-col>
        <el-col style="width:20%;">
           <div class="foottitle">新手指南</div>
          <div class="footcontent">如何定制课程</div>
          <div class="footcontent">如何报名</div>
          <div class="footcontent">常见问题</div>
        </el-col>
        <el-col style="width:20%;">
          <div class="foottitle">资源共享</div>
          <div class="footcontent">教育咨询</div>
          <div class="footcontent">国外教育</div>
          <div class="footcontent">高考新政</div>
          <div class="footcontent">国外动态</div>
        </el-col>
        <el-col style="width:16%;">
          <div class="footright1">客服电话</div>
          <div class="footright2">010-10108886</div>
        </el-col>
      </el-row>
    </div>
</template>

<script>
export default {
  name: 'app-footer',
  data() {
    return {
    }
  },
}
</script>
<style scoped>
  .myfooter{
    height: 385px;
    line-height: 44px;
    background-color: rgba(240, 238, 238, 1);
    text-align: center;
    border: 1px solid rgba(187, 187, 187, 1);
  }
  .footleft{
    margin-left: 36px;
    margin-top: 106px;
    height: 59px;
    line-height: 49px;
    color: rgba(8, 150, 255, 1);
    font-size: 34px;
    font-family: Roboto;
  }
  .footright1{
    margin-top: 127px;
    height: 49px;
    line-height: 44px;
    color: rgba(72, 70, 70, 1);
    font-size: 30px;
    text-align: center;
    font-family: Roboto;
  }
  .footright2{
    margin-bottom: 32px;
    height: 49px;
    line-height: 44px;
    color: rgba(72, 70, 70, 1);
    font-size: 30px;
    text-align: center;
    font-family: Roboto;
  }
  .foottitle{
    margin-top: 46px;
    margin-bottom: 18px;
    height: 49px;
    line-height: 44px;
    color: rgba(72, 70, 70, 1);
    font-size: 30px;
    text-align: center;
    font-family: Roboto;
  }
  .footcontent{
    padding: 6px 0px;
    height: 44px;
    line-height: 35px;
    color: rgba(145, 142, 142, 1);
    font-size: 24px;
    text-align: center;
    font-family: Roboto;
  }
</style>
