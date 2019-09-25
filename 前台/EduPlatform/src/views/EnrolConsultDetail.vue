<!--入学咨询答疑详细 -->
<template>
  <div class="enrolconsultdetail">
    <div class="enrolconsultdetailtitle">{{twbt}}</div>
    <div style="width: 100%;height: 1px;background:#C8C8C8;margin-top: 20px;"></div>
    <div class="question">
      <div class="questioner">{{twr}}</div>
      <div class="questiontime">{{twsj}}</div>
      <img class="headimg" :src="twimg | resourcesUrl" style="border-radius:50px;height: 97px;position: relative;top: -120px;left: 35px;">
      <div class="questiontext" v-html="wtnr"></div>
    </div>
    <div style="width: 100%;height: 1px;background:#C8C8C8;margin-top: 20px;"></div>
    <div class="question" v-if="hfr!==''">
      <div class="questioner">{{hfr}}</div>
      <div class="questiontime">{{hfsj}}</div>
      <img class="headimg" :src="hfimg | resourcesUrl" style="border-radius:50px;height: 97px;position: relative;top: -120px;left: 35px;">
      <div class="questiontext" v-html="hfnr"></div>
    </div>
    <div v-if="usertype==='1'" class="editor" style="margin: 10px;">
      <vue-ueditor-wrap v-model="msg" :config="myConfig"></vue-ueditor-wrap>
      <div style="text-align:right;">
        <el-button type="danger" round style="font-size:16px;margin: 20px 0px;" @click="submit">提交</el-button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'enrolconsultdetail-view',
  data() {
    return {
      username: '', // 当前登录人
      usertype: '', // 1=老师，2=客户
      wtid: '',
      type: '', // 1=课程问题，0=入学问题
      question: '',
      twbt: '',
      twr: '',
      twsj: '',
      twimg: '',
      wtnr: '',
      hfr: '',
      hfsj: '',
      hfimg: '',
      hfnr: '',
      msg: '',
      myConfig: {
      // 编辑器不自动被内容撑高
        autoHeightEnabled: false,
        // 初始容器高度
        initialFrameHeight: 240,
        // 初始容器宽度
        initialFrameWidth: '100%',
        toolbars: [[
          'bold', // 加粗
          'italic', // 斜体
          'underline', // 下划线
          'link', // 超链接
          'unlink', // 取消链接
          'insertorderedlist', // 有序列表
          'insertunorderedlist', // 无序列表
          'blockquote', // 引用
          'undo', // 撤销
          'redo', // 重做
          'insertframe', // 插入Iframe
          'source', // 源代码
        ]],
      },
    }
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
    if (this.$route.query.wtid) {
      this.wtid = this.$route.query.wtid;
    }
    if (this.$route.query.type) {
      this.type = this.$route.query.type;
    }
    document.onkeydown = () => {
      const key = window.event.keyCode;
      if (key === 13) {
        this.submit()
      }
    }
    const userinfo = localStorage.getItem('usg')
    if (userinfo !== 'underfined' && userinfo !== null) {
      this.username = JSON.parse(userinfo).username;
      this.usertype = JSON.parse(userinfo).type;
    }
    this.getQuestionDetail()
  },
  methods: {
    getQuestionDetail() {
      const paramObj = {
        kcid: '',
        wtid: this.wtid,
        type: this.type,
      }
      this.$server.getQuestion(paramObj).then((data) => {
        if (data.code === '0') {
          this.question = JSON.parse(data.question)[0]
          this.twbt = this.question.wtbt
          this.twr = this.question.twname
          this.twsj = this.question.twsj
          this.twimg = this.question.twimg
          this.wtnr = this.question.wtnr
          if (this.question.hfnr) {
            this.hfr = this.question.hfname
            this.hfsj = this.question.hfsj
            this.hfimg = this.question.hfimg
            this.hfnr = this.question.hfnr
          }
        } else {
          console.info(data.msg);
        }
      })
    },
    submit() {
      if (this.msg === '') {
        this.$message.warning('回复内容不能为空!')
        return
      }
      const paramObj = {
        wtid: this.wtid,
        hfr: this.username,
        hfnr: this.msg,
      }
      this.$server.updateQuestion(paramObj).then((data) => {
        if (data.code === '0') {
          this.$message.success(data.msg);
          this.getQuestionDetail()
        } else {
          this.$message.warning(data.msg);
        }
      })
    },
  },
}
</script>
<style scoped>
  .enrolconsultdetailtitle{
    margin-left: 35px;
    margin-top: 66px;
    height: 53px;
    line-height: 41px;
    color: rgba(16, 16, 16, 1);
    font-size: 28px;
    font-family: Microsoft Yahei;
  }
  .questioner{
    margin: 27px 0px 0px 164px;
    height: 63px;
    line-height: 41px;
    color: rgba(16, 16, 16, 1);
    font-size: 28px;
  }
  .questiontime{
    margin: 0px 0px 0px 164px;
    height: 53px;
    line-height: 29px;
    color: rgba(16, 16, 16, 1);
    font-size: 20px;
  }
  .questiontext{
    margin: -97px 58px 70px 58px;
  }
  .questiontext>>>p{
    display: -webkit-box;
  }
</style>
