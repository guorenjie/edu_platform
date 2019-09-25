<!--注册 -->
<template>
  <div :style="currentheight">
    <div class="register-view">
      <div style="margin:0 82px;">
        <div class="register-title">账号登陆</div>
        <input class="register-content" type="text" style="margin-top: 29px;text-indent:20px;" v-model="fullname" placeholder=" 请输入姓名"/>
        <input class="register-content" type="text" style="margin-top: 20px;text-indent:20px;" v-model="username" placeholder=" +86  请输入手机号"/>
        <input class="register-content" type="password" style="margin-top: 28px;text-indent:20px;" v-model="password" placeholder=" 请输入密码"/>
        <!-- <el-checkbox v-model="autologin" style="margin-top: 10px;" border size="medium">自动登录</el-checkbox> -->
        <el-switch style="margin-top: 17px;"
          v-model="autologin"
          active-text="自动登录"
          active-color="#0896FF"
          inactive-color="#EEEEEE">
        </el-switch>
        <button class="register" @click="register">{{buttontext}}</button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'register-view',
  data() {
    return {
      currentheight: '',
      fullname: '',
      username: '',
      password: '',
      autologin: true,
      buttontext: '注册',
    }
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
    this.currentheight = `height:${window.innerHeight - 73}px;background-color: rgba(238, 238, 238, 1);`;
    document.onkeydown = () => {
      const key = window.event.keyCode;
      if (key === 13) {
        this.register()
      }
    }
  },
  methods: {
    register() {
      if (!this.fullname || !this.username || !this.password) {
        this.$message.warning('账号密码不能为空')
        return
      }
      this.buttontext = '正在注册中'
      const paramObj = {
        username: this.fullname,
        user_id: this.username,
        password: this.password,
      }
      this.$server.register(paramObj).then((data) => {
        if (data.code === '0') {
          this.$message.success(data.msg);
          if (this.autologin) {
            const userobj = { fullname: this.fullname, username: this.username, password: this.password, type: '2' };
            localStorage.setItem('usg', JSON.stringify(userobj));
            this.$router.push({ path: '/' })
          } else {
            this.$router.push({ path: '/login' })
          }
        } else {
          this.buttontext = '注册'
          this.$message.warning(data.msg)
        }
      })
    },
  },
}
</script>
<style scoped>
  .register-view{
    position: fixed;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
    margin: auto;
    width: 705px;
    height: 600px;
    line-height: 20px;
    border: 1px solid rgba(187, 187, 187, 1);
    background-color: #ffffff;
  }
  .register-title{
    margin-top: 17px;
    width: 137px;
    height: 53px;
    line-height: 49px;
    color: rgba(15, 14, 14, 1);
    font-size: 34px;
    text-align: center;
    font-family: Roboto;
  }
  .register-content{
    left: 422px;
    width: 100%;
    height: 71px;
    color: rgba(136, 136, 136, 1);
    font-size: 28px;
    text-align: left;
    font-family: Roboto;
    border: 1px solid rgba(15, 14, 14, 1);
  }
  .register{
    margin-top: 17px;
    width: 100%;
    height: 81px;
    border-radius: 4px;
    background-color: rgba(8, 150, 255, 1);
    color: rgba(255, 255, 255, 1);
    font-size: 28px;
    text-align: center;
    font-family: Microsoft Yahei;
    border: 1px solid rgba(187, 187, 187, 1);
  }
</style>
