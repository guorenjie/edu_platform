<!--在线测评 -->
<template>
  <div>
    <div @click="getMsg">测试ajax，点击获取后台数据</div>
    <div>getmsg:{{getmsg}}</div>
    <div>postmsg:{{postmsg}}</div>
  </div>
</template>
<script>
export default {
  name: 'ajaxtest-view',
  data() {
    return {
      getmsg: '',
      postmsg: '',
    }
  },
  created() {
  },
  methods: {
    getMsg() {
      const paramObj = {
        uid: '15708996861',
      }
      this.$server.gettest(paramObj).then((data) => {
        this.getmsg = data;
      })
      this.$server.posttest(paramObj).then((data) => {
        this.postmsg = data;
      })
    },
  },
}
</script>
<style scoped>
</style>
