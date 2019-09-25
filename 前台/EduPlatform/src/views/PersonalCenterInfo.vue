<!--个人中心信息 -->
<template>
  <div class="personinfo" style="margin:20px 10px;">
    <el-row>
      <el-col style="width: 270px;">
        <div :style="{background:'url('+require('../assets/img/personinfo/person.png')+')'}" class="myheadimg">
        </div>
        <el-upload
          class="avatar-uploader"
          action="http://39.105.145.175/edu/edu/uploadImg"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
          :data="{ userid:userid}">
          <img :src="userimg | resourcesUrl" style="border-radius:50px;height: 97px;position: relative;top: -170px;left: 80px;">
        </el-upload>
        <div class="myfullname">{{fullname}}</div>
        <el-menu :default-active="activeindex" class="el-menu-vertical-demo personmenu" @select="handleSelect" active-text-color="#409eff" :style="currentheight">
          <el-menu-item index="1" style="text-align: center;">
            <span slot="title" class="persontitle">课程中心</span>
          </el-menu-item>
          <el-menu-item index="2" style="text-align: center;">
            <span slot="title" class="persontitle">个人中心</span>
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col style="width: calc(100% - 488px);margin: 0px 94px;">
        <div v-if="activeindex==='1'">
          <div class="myinfotitle">我的课程</div>
          <el-menu :default-active="activecoursetype" class="el-menu-vertical-demo personmenu" mode="horizontal" @select="handleSelectCourseType" active-text-color="#ffd04b" style="margin-top: -20px;">
            <el-menu-item index="3" style="text-align: center;">
              <span slot="title" class="persontitle">全部课程</span>
            </el-menu-item>
          </el-menu>
          <button class="scanmore" @click="scanmore">查看更多</button>
          <div style="margin: 44px 26px;">
        <el-row>
          <div v-if="courses">
            <el-col :span="12" class="mycoursecontent" v-for="(item,index) in courses" :key="index" @click.native="jump('/courseplay',{kcid:item.kcid})">
              <img class="mycourseimg" :src="item.kcimg | resourcesUrl" alt="资源不存在">
            </el-col>
          </div>
          <div v-else style="height: 340px;line-height: 340px;font-size: 30px;text-align: center;">
            课程不存在!
          </div>
        </el-row>
      </div>
        </div>
        <div v-if="activeindex==='2'&&mode==='0'">
          <div class="myinfotitle">个人中心
            <el-button type="text" @click="mode='1';fullnameedit=fullname;sexedit=sex;birthedit=birth;" style="position: relative;top: -50px;left: 180px;font-size: 20px;font-weight: bold;">编辑</el-button>
          </div>
          <div class="myinfocontent">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：{{fullname}}</div>
          <div class="myinfocontent">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
            <span v-if="sex===0">未知</span>
            <span v-if="sex===1">男</span>
            <span v-if="sex===2">女</span>
            </div>
          <div class="myinfocontent">出生年月：{{birth}}</div>
        </div>
        <div v-if="activeindex==='2'&&mode==='1'">
          <div class="myinfotitle">个人中心
            <el-button type="text" @click="mode='0'" style="position: relative;top: -50px;left: 180px;font-size: 20px;font-weight: bold;">取消</el-button>
            <el-button type="text" @click="setUserInfo" style="position: relative;top: -50px;left: 190px;font-size: 20px;font-weight: bold;">保存</el-button>
          </div>
          <div class="myinfocontent">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：
            <el-input v-model="fullnameedit" placeholder="请输入昵称" style="width: 220px;"/>
            </div>
          <div class="myinfocontent">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
            <el-radio-group v-model="sexedit">
            <el-radio :label="0">未知</el-radio>
            <el-radio :label="1">男</el-radio>
            <el-radio :label="2">女</el-radio>
          </el-radio-group>
          </div>
          <div class="myinfocontent">出生年月：
            <el-date-picker
              v-model="birthedit"
              type="date"
              placeholder="选择出生年月"
              value-format="yyyy-MM-dd">
            </el-date-picker>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  name: 'person-view',
  data() {
    return {
      mode: '0', // 模式 0=查看，1=编辑
      userinfo: '', // 浏览器中保存的用户信息
      userid: '', // 用户id
      userimg: '', // 用户头像
      fullname: '', // 用户昵称
      sex: 0, // 用户性别
      birth: '', // 用户出生年月
      userimgedit: '', // 编辑头像
      fullnameedit: '', // 编辑昵称
      sexedit: 0, // 编辑性别
      birthedit: '', // 编辑出生年月
      activeindex: '2', // 1=我的课程，2=个人中心
      activecoursetype: '3', // 课程类型，1=收费，2=免费，3=全部
      type: '1', //  0=我的所有课程 1=后2个课程
      courses: '', // 课程json数组
      currentheight: '',
    }
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
    this.currentheight = `height:${window.innerHeight - 343}px;border-right: solid 1px #CCCCCC;margin-top: -135px;`;
    const userinfo = localStorage.getItem('usg')
    if (userinfo !== 'underfined' && userinfo !== null) {
      this.userinfo = JSON.parse(userinfo)
      this.fullname = this.userinfo.fullname;
      this.userid = this.userinfo.username;
    }
    this.getUserInfo()
    this.getMyCourses()
  },
  methods: {
    getUserInfo() {
      const paramObj = {
        userid: this.userid,
      }
      this.$server.getUserInfo(paramObj).then((data) => {
        if (data.code === '0') {
          const user = JSON.parse(data.user)[0]
          this.userimg = user.userimg
          this.fullname = user.username
          this.sex = user.sex
          this.birth = user.birth
        } else {
          console.info(data.msg);
        }
      })
    },
    setUserInfo() {
      console.info(this.birthedit)
      const paramObj = {
        userid: this.userid,
        userimg: this.userimgedit,
        username: this.fullnameedit,
        sex: this.sexedit,
        birth: this.birthedit,
      }
      this.$server.setUserInfo(paramObj).then((data) => {
        if (data.code === '0') {
          this.userinfo.fullname = this.fullnameedit;
          localStorage.setItem('usg', JSON.stringify(this.userinfo))
          this.$router.go(0)
        } else {
          console.info(data.msg);
        }
      })
      this.mode = '0'
    },
    getMyCourses() {
      const paramObj = {
        userid: this.userid,
        type: this.type,
      }
      this.$server.getMyCourses(paramObj).then((data) => {
        if (data.code === '0') {
          this.courses = JSON.parse(data.course)
        } else {
          console.info(data.msg);
          this.courses = ''
        }
      })
    },
    // eslint-disable-next-line no-unused-vars
    handleAvatarSuccess(res, file) {
      this.userimgedit = res;
      this.setUserInfo()
      console.info(res);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      this.activeindex = key;
      this.type = '1'
      this.getMyCourses()
    },
    handleSelectCourseType(key, keyPath) {
      console.log(key, keyPath);
      this.activecoursetype = key;
    },
    scanmore() {
      this.type = '0'
      this.getMyCourses()
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
  .myheadimg{
    height: 200px;
    width: 100%;
    background-size: 100%!important;
  }
  .persontitle{
    width: 121px;
    height: 53px;
    line-height: 44px;
    font-size: 30px;
    font-family: Microsoft Yahei;
  }
  .myfullname{
    text-align: center;
    font-size: 20px;
    color: #4C535D;
    position: relative;
    top: -160px;
    background: #fff;
  }
  .personmenu>>>.el-menu-item, .el-submenu__title {
    height: 94px;
    line-height: 94px;
    position: relative;
    box-sizing: border-box;
    white-space: nowrap;
    list-style: none;
  }
  .myinfotitle{
    margin-bottom: 70px;
    width: 145px;
    height: 53px;
    line-height: 52px;
    color: rgba(16, 16, 16, 1);
    font-size: 36px;
    font-weight: bold;
  }
  .myinfocontent{
    margin: 15px 0px;
    height: 53px;
    line-height: 44px;
    color: rgba(16, 16, 16, 1);
  }
  .scanmore{
    display: block;
    margin: 31px 0px 43px auto;
    width: 158px;
    height: 43px;
    line-height: 41px;
    border-radius: 10px;
    background-color: rgba(255, 152, 0, 1);
    color: rgba(255, 255, 255, 1);
    font-size: 30px;
    text-align: center;
    font-family: Roboto;
    border: 1px solid rgba(187, 187, 187, 1);
  }
  .mycoursecontent{
    height: 340px;
    margin-top: 50px;
    line-height: 20px;
    text-align: center;
  }
  .mycourseimg{
    height:100%;
    border: 1px solid rgba(187, 187, 187, 1);
  }
</style>
