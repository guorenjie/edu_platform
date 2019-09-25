<template>
    <div class="app-header" style="height:71px;">
      <el-row>
          <el-col :span="6">
            <img src="@/assets/img/common/logo.png" alt="图片不存在" style="margin-left: 9px;width: 70px;height: 54px;">
          </el-col>
           <el-col :span="13" class="mytop">
            <el-menu :default-active="activeIndex" class="el-menu-demo el-col" mode="horizontal" @select="handleSelect" active-text-color="#409eff">
              <el-menu-item index="1" style="text-align:left;width:13%;padding-left:7px;">首页</el-menu-item>
              <!-- <el-menu-item index="2" style="text-align:left;width:18%;padding-left:0px;">课程定制</el-menu-item> -->
              <el-menu-item index="3" style="text-align:left;width:22%;padding-left:0px;">中高考新政</el-menu-item>
              <el-menu-item index="4" style="text-align:left;width:23%;padding-left:7px;">国内外动态</el-menu-item>
              <el-menu-item index="5" style="text-align:left;width:18%;padding-left:14px;">关于我们</el-menu-item>
            </el-menu>
           </el-col>
           <el-col v-if="fullname===''" :span="5" style="font-size: 18px;height: 60px;line-height: 55px;">
             <button class="topbutton" style="background-color: rgba(8, 150, 255, 1);width:158px;position: absolute;top: 10px;right: 123px;" @click="$router.push({path: '/login' })">学员登陆</button>
             <button class="topbutton" style="background-color: rgba(187, 187, 187, 1);width:113px;position: absolute;top: 10px;right: 0px;" @click="$router.push({path: '/register' })">注册</button>
           </el-col>
           <el-col v-if="fullname!==''" :span="5" style="font-size: 18px;height: 60px;line-height: 55px;">
             <button class="topbutton" style="background-color: rgba(8, 150, 255, 1);width:150px;position: absolute;top: 10px;right: 158px;" @click="$router.push({path: '/personalcenterinfo' })">{{fullname}}</button>
             <button class="topbutton" style="background-color: rgba(187, 187, 187, 1);width:150px;position: absolute;top: 10px;right: 0px;" @click="logout">退出登陆</button>
           </el-col>
      </el-row>
    </div>
</template>

<script>
export default {
  name: 'app-header',
  props: {
    active: String,
  },
  data() {
    return {
      fullname: '',
      activeIndex: this.active,
    }
  },
  watch: {
    $route: 'init', // 监听路由改变刷新用户名

  },
  methods: {
    init() {
      this.activeIndex = this.active;
      const userinfo = localStorage.getItem('usg')
      if (userinfo !== 'underfined' && userinfo !== null) {
        this.fullname = JSON.parse(userinfo).fullname;
      }
    },
    // 切换tab
    handleSelect(key, keyPath) {
      console.info(key, keyPath);
      if (key === '1') {
        this.$router.push({ path: '/' })
      }
      if (key === '2') {
        this.$router.push({ path: '/freecourse' })
      }
      if (key === '3') {
        window.open('http://gaokao.eol.cn/zhengce/', '_blank')
      }
      if (key === '4') {
        window.open('http://www.most.gov.cn/gnwkjdt/index.htm', '_blank')
      }
      this.activeIndex = '1';
    },
    // 退出登录
    logout() {
      localStorage.clear()
      this.fullname = ''
      this.$router.push({ path: '/login' })
    },
  },
  created() {
    this.init() // 刷新用户名
  },
}
</script>
<style scoped>
  .mytop>>>.el-menu-item {
    width: 20%;
    text-align: center;
    color: #303133;
    padding: 0 20px;
    cursor: pointer;
    -webkit-transition: border-color .3s,background-color .3s,color .3s;
    transition: border-color .3s,background-color .3s,color .3s;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    border-bottom: none;
    color: rgba(16, 16, 16, 1);
    font-size: 30px;
    font-family: Roboto;
}
.mytop>>>.el-menu.el-menu--horizontal {
    border-bottom: none;
}
.topbutton{
  height: 43px;
  line-height: 39px;
  border-radius: 10px;
  background-color: rgba(187, 187, 187, 1);
  color: rgba(255, 255, 255, 1);
  font-size: 30px;
  text-align: center;
  font-family: Roboto;
  border: 1px solid rgba(187, 187, 187, 1);
}
</style>
