<!--首页 -->
<template>
  <div class="home-view">
    <!-- 轮播广告 -->
    <div class="ad">
      <el-carousel>
        <el-carousel-item v-for="(item,index) in ads" :key="index" :style="'background: #99a9bf url('+`http://39.105.145.175/static/img/${item.vvalue}`+') no-repeat;background-size:contain;background-size:100% 100%;'">
        </el-carousel-item>
      </el-carousel>
    </div>
    <!-- 链接块 -->
  <div style="margin: 44px 26px;">
    <el-row>
      <el-col class="blockcontent" @click.native="jump('/freecourse')">
        <img class="blockimg" src="@/assets/img/home/homeblockone.png">
        <div class="blocktitle">课程展示</div>
        <div class="blockcaption">随时随地想学就学</div>
      </el-col>
      <el-col style="width: 8%;height: 340px;"></el-col>
      <el-col class="blockcontent" @click.native="jump('/enrolconsult')">
        <img class="blockimg" src="@/assets/img/home/homeblocktwo.png">
        <div class="blocktitle">入学咨询</div>
        <div class="blockcaption">专家悉心为您答疑</div>
      </el-col>
      <el-col style="width: 8%;height: 340px;"></el-col>
      <el-col class="blockcontent" @click.native="jump('/assessgradesubjects')">
        <img class="blockimg" src="@/assets/img/home/homeblockthree.png">
        <div class="blocktitle">在线测评</div>
        <div class="blockcaption">快速帮您定制学习路线</div>
      </el-col>
    </el-row>
  </div>
  <!-- 精选课程 -->
  <div class="course">
    <div style="margin-top:41px;text-align: center;height: 59px;line-height: 49px;color: rgba(8, 150, 255, 1);font-size: 34px;">精选课程</div>
    <div style="height:59px;margin-top: -53px;float: right;" @click="jump('/freecourse')">
      <span style="margin-right: 55px;width: 89px;color: rgba(123, 120, 120, 1);font-size: 22px;cursor: default;">查看更多</span>
      <img src="@/assets/img/home/more.png" style="position: relative;top: 6px;right: 50px;">
    </div>
    <div class="courselist" style="margin:50px 25px 40px 25px;">
      <el-row>
        <el-col :span="8">
          <img  class="courseitem" v-if="subjects[0]" :src="subjects[0].kmimg | resourcesUrl" alt="资源不存在" @click="jump('/freecourse',{activeIndex:subjects[0].kmxx+'-'+subjects[0].kmlx})">
        </el-col>
        <el-col :span="8">
          <img class="courseitem" v-if="subjects[1]" :src="subjects[1].kmimg | resourcesUrl" alt="资源不存在" @click="jump('/freecourse',{activeIndex:subjects[1].kmxx+'-'+subjects[1].kmlx})">
        </el-col>
        <el-col :span="8">
          <img class="courseitem" v-if="subjects[2]" :src="subjects[2].kmimg | resourcesUrl" alt="资源不存在" @click="jump('/freecourse',{activeIndex:subjects[2].kmxx+'-'+subjects[2].kmlx})">
        </el-col>
      </el-row>
      <el-row style="margin-top:40px;">
        <el-col :span="8">
          <img class="courseitem" v-if="subjects[3]" :src="subjects[3].kmimg | resourcesUrl" alt="资源不存在" @click="jump('/freecourse',{activeIndex:subjects[3].kmxx+'-'+subjects[3].kmlx})">
        </el-col>
        <el-col :span="8">
          <img class="courseitem" v-if="subjects[4]" :src="subjects[4].kmimg | resourcesUrl" alt="资源不存在" @click="jump('/freecourse',{activeIndex:subjects[4].kmxx+'-'+subjects[4].kmlx})">
        </el-col>
        <el-col :span="8">
          <img class="courseitem" v-if="subjects[5]" :src="subjects[5].kmimg | resourcesUrl" alt="资源不存在" @click="jump('/freecourse',{activeIndex:subjects[5].kmxx+'-'+subjects[5].kmlx})">
        </el-col>
      </el-row>
    </div>
  </div>
  <!-- 底部 -->
    <el-row class="foot">
      <el-col :span="8">
        <el-row style="height:150px;">
          <el-col :span="4" style="margin-top: 48px;">
          <img src="@/assets/img/home/person.png">
        </el-col>
        <el-col :span="20" style="margin-top: 30px;text-align: left;">
          <div style="height: 50px;line-height: 44px;color: rgba(255, 255, 255, 1);font-size: 30px;">先听课 后交钱</div>
        <div style="height: 50px;line-height: 35px;color: rgba(255, 255, 255, 1);font-size: 24px;">课程免费试听，满意再付钱</div>
        </el-col>
        </el-row>
      </el-col>
      <el-col :span="8">
        <el-row style="height:150px;">
          <el-col :span="4" style="margin-top: 48px;">
          <img src="@/assets/img/home/person.png">
        </el-col>
        <el-col :span="20" style="margin-top: 30px;text-align: left;">
          <div style="height: 50px;line-height: 44px;color: rgba(255, 255, 255, 1);font-size: 30px;">不满意 换老师</div>
        <div style="height: 50px;line-height: 35px;color: rgba(255, 255, 255, 1);font-size: 24px;">100+优秀教师任您挑选</div>
        </el-col>
        </el-row>
      </el-col>
      <el-col :span="8">
        <el-row style="height:150px;">
          <el-col :span="4" style="margin-top: 48px;">
          <img src="@/assets/img/home/person.png">
        </el-col>
        <el-col :span="20" style="margin-top: 30px;text-align: left;">
          <div style="height: 50px;line-height: 44px;color: rgba(255, 255, 255, 1);font-size: 30px;">没效果 退余款</div>
        <div style="height: 50px;line-height: 35px;color: rgba(255, 255, 255, 1);font-size: 24px;">多年丰富教学经验 严格培训再上岗</div>
        </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>


<script>


export default {
  name: 'home-view',
  data() {
    return {
      ads: [],
      subjects: [],
    }
  },
  components: {
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', true);
    this.getAd()
    this.getSubject()
  },
  methods: {
    // 获取轮播图
    getAd() {
      this.$server.getAd().then((data) => {
        if (data.code === '0') {
          this.ads = JSON.parse(data.ad)
        } else {
          console.info(data.msg);
        }
      })
    },
    // 获取科目（精选课程）
    getSubject() {
      const paramObj = {
        ishomeshow: '1',
      }
      this.$server.getSubject(paramObj).then((data) => {
        if (data.code === '0') {
          this.subjects = JSON.parse(data.subject);
        } else {
          console.info(data.msg);
        }
      })
    },
    jump(routename, params) {
      const routeData = this.$router.resolve({
        name: '',
        path: routename,
        query: params,
        params: {},
      });
      window.open(routeData.href, '_blank');
    },
  },
}
</script>
<style>
  .blockcontent{
    width: 28%;
    height: 340px;
    line-height: 20px;
    text-align: center;
    border: 1px solid rgba(187, 187, 187, 1);
  }
  .blockimg{
    width:100%;
    height:206px;
  }
  .blocktitle{
    height: 59px;
    line-height: 41px;
    margin-top: 18px;
    color: rgba(16, 16, 16, 1);
    font-size: 28px;
  }
  .blockcaption{
    height: 52px;
    line-height: 32px;
    color: rgba(117, 113, 113, 1);
    font-size: 22px;
  }
  .course{
    line-height: 20px;
    background-color: rgba(240, 238, 238, 1);
    text-align: center;
    border: 1px solid rgba(187, 187, 187, 1);
  }
  .courseitem{
    width: 370px;
    height: 186px;
  }
  .foot{
    margin-top: 70px;
    height: 150px;
    line-height: 20px;
    background-color: rgba(8, 150, 255, 1);
    text-align: center;
    border: 1px solid rgba(187, 187, 187, 1);
  }
</style>
