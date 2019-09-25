<!--登陆 -->
<template>
  <div :style="currentheight">
      <div class="login-view">
      <div style="margin:0 82px;">
        <div class="login-title">账号登陆</div>
        <input class="login-content" type="text" style="margin-top: 40px;text-indent:20px;" v-model="username" placeholder=" +86  请输入手机号"/>
        <input class="login-content" type="password" style="margin-top: 28px;text-indent:20px;" v-model="password" placeholder=" 请输入密码"/>
        <button class="login" @click="login">{{buttontext}}</button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'login-view',
  data() {
    return {
      currentheight: '',
      username: '',
      password: '',
      buttontext: '登陆',
    }
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
    this.currentheight = `height:${window.innerHeight - 73}px;background-color: rgba(238, 238, 238, 1);`;
    document.onkeydown = () => {
      const key = window.event.keyCode;
      if (key === 13) {
        this.login()
      }
    }
  },
  methods: {
    login() {
      if (!this.username || !this.password) {
        this.$message.warning('账号密码不能为空')
        return
      }
      this.buttontext = '正在登陆中'
      const paramObj = {
        user_id: this.username,
        password: this.password,
      }
      this.$server.login(paramObj).then((data) => {
        if (data.code === '0') {
          this.$message.success(data.msg);
          const userobj = { fullname: (JSON.parse(data.user))[0].username, username: this.username, password: this.password, type: (JSON.parse(data.user))[0].type };
          localStorage.setItem('usg', JSON.stringify(userobj));
          this.$router.push({ path: '/' })
        } else {
          this.buttontext = '登陆'
          this.$message.warning(data.msg)
        }
      })
    },
  },
}
</script>
<style scoped>
  .login-view{
    position: fixed;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
    margin: auto;
    width: 705px;
    height: 600px;
    line-height: 20px;
    text-align: center;
    border: 1px solid rgba(187, 187, 187, 1);
    background-color: #ffffff;
  }
  .login-title{
    margin-top: 17px;
    width: 137px;
    height: 53px;
    line-height: 49px;
    color: rgba(15, 14, 14, 1);
    font-size: 34px;
    text-align: center;
    font-family: Roboto;
  }
  .login-content{
    left: 422px;
    width: 100%;
    height: 71px;
    color: rgba(136, 136, 136, 1);
    font-size: 28px;
    text-align: left;
    font-family: Roboto;
    border: 1px solid rgba(15, 14, 14, 1);
  }
  .login{
    margin-top: 54px;
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
