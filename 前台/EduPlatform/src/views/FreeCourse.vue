<!--免费课程 -->
<template>
  <div>
      <!-- 顶部线条 -->
      <div style="width: 100%;height: 1px;background:#C8C8C8;margin-top: 20px;"></div>
        <div class="grade" :style="gradestyle">
          <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
          <el-submenu index="1">
            <template slot="title">小学</template>
            <el-menu-item index="1-1" class="grade-content">语文</el-menu-item>
            <el-menu-item index="1-2" class="grade-content">数学</el-menu-item>
            <el-menu-item index="1-3" class="grade-content">英语</el-menu-item>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title">初中</template>
            <el-menu-item index="2-1" class="grade-content">语文</el-menu-item>
            <el-menu-item index="2-2" class="grade-content">数学</el-menu-item>
            <el-menu-item index="2-3" class="grade-content">英语</el-menu-item>
            <el-menu-item index="2-4" class="grade-content">物理</el-menu-item>
          </el-submenu>
          <el-submenu index="3">
            <template slot="title">高中</template>
            <el-menu-item index="3-1" class="grade-content">语文</el-menu-item>
            <el-menu-item index="3-2" class="grade-content">数学</el-menu-item>
            <el-menu-item index="3-3" class="grade-content">英语</el-menu-item>
            <el-menu-item index="3-4" class="grade-content">物理</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>
      <!-- 课程列表 -->
      <div style="margin: 44px 26px;">
        <el-row>
          <div v-if="courses">
            <el-col :span="8" class="coursecontent" v-for="(item,index) in courses" :key="index" @click.native="jump('/courseplay',{kcid:item.kcid})">
              <img class="courseimg" :src="item.kcimg | resourcesUrl" alt="资源不存在">
            </el-col>
          </div>
          <div v-else style="height: 340px;line-height: 340px;font-size: 30px;text-align: center;">
            课程不存在!
          </div>
        </el-row>
      </div>
  </div>
</template>
<script>
export default {
  name: 'freecourse-view',
  data() {
    return {
      activeIndex: '1-1',
      gradestyle: '',
      type: '0', // ''=所有课程 1=我的课程
      courses: '',
    }
  },
  watch: {
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', true);
    this.gradestyle = `margin-left:${window.innerWidth - 560}px;`;
    if (this.$route.query.activeIndex) {
      this.activeIndex = this.$route.query.activeIndex;
    } else {
      this.activeIndex = '1-1';
    }
    if (this.$route.query.type) {
      this.type = this.$route.query.type;
    } else {
      this.type = '0';
    }
    this.getCourses()
  },
  methods: {
    getCourses() {
      const kmxxlx = this.activeIndex.split('-');
      const paramObj = {
        kmxx: kmxxlx[0],
        kmlx: kmxxlx[1],
        type: '0',
      }
      this.$server.getCourses(paramObj).then((data) => {
        if (data.code === '0') {
          this.courses = JSON.parse(data.course)
        } else {
          console.info(data.msg);
          this.courses = ''
        }
      })
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      this.activeIndex = key;
      this.getCourses(this.activeIndex);
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
<style scoped>
  .grade{
    height:52px;
    padding: 30px 0px 0px 0px;
  }
  .grade-content{
    text-align: center;
    height: 100px !important;
    line-height: 100px !important;
    color: rgba(16, 16, 16, 1);
    font-size: 30px;
  }
  /*去掉el-menu组件下边框*/
  .grade>>>.el-menu.el-menu--horizontal {
    border-bottom: none !important;
    margin-top: 15px;
  }
  .grade>>>.el-submenu__title{
    width: 176px;
    text-align: center;
    line-height: 44px;
    color: rgba(16, 16, 16, 1);
    font-size: 30px;
  }
  .coursecontent{
    height: 340px;
    margin-top: 50px;
    line-height: 20px;
    text-align: center;
  }
  .courseimg{
    height:100%;
    border: 1px solid rgba(187, 187, 187, 1);
  }
</style>
