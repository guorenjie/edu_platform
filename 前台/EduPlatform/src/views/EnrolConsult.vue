<!--入学咨询 -->
<template>
  <div class="enrolconsult">
    <!-- 标题栏 -->
    <div class="titleblock" style="height: 53px;">
      <span class="enroltitle">入学咨询</span>
      <button class="question" @click="openAsk">发布提问</button>
      <el-dialog title="我要提问" :visible.sync="dialogFormVisible" :close-on-click-modal="false" :close-on-press-escape="false"><ask @switch= 'addQuestion'/></el-dialog>
    </div>
    <!-- 咨询列表 -->
    <div class="consultlist" v-for="(item,index) in questions" :key="index">
      <div class="consultcontent">
        <div style="height:255px;background: #fff;position: relative;top: 8px;margin:0px 8px;border-radius:20px" @click="jump('/enrolconsultdetail',{wtid:item.wtid,type:'0'})">
          <img v-if="item.hfname&&item.hfname!==''" src="@/assets/img/enrolconsult/answer.png">
          <img v-else src="@/assets/img/enrolconsult/question.png">
          <img :src="item.twimg | resourcesUrl" style="position: relative;top: 33px;border-radius: 35px;height:69px;">
          <div style="margin: -33px 53px auto 195px;height: 180px;line-height: 20px;color: rgba(16, 16, 16, 1);font-size: 14px;border: 1px solid rgba(187, 187, 187, 1);">
            <div class="text" style="margin:40px 270px auto 26px;height:82px;line-height: 41px;color: rgba(16, 16, 16, 1);font-size: 28px;text-align: left;">{{item.wtbt}}</div>
            <div style="margin-right:37px;text-align: right;padding-right: 37px;height: 41px;line-height: 41px;color: rgba(16, 16, 16, 1);font-size: 28px;">{{item.twsj.substring(0, 10)}}</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 联系我们 -->
    <div class="contactus">
      <img src="@/assets/img/enrolconsult/contactus.png">
    </div>
  </div>
</template>
<script>
import Ask from '@/components/common/ask'

export default {
  name: 'enrolconsult-view',
  data() {
    return {
      username: '', // 当前登录人
      dialogFormVisible: false,
      questions: '',
    }
  },
  components: {
    ask: Ask,
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
    this.consultcontent = `width:${window.innerWidth - 220}px;`;
    const userinfo = localStorage.getItem('usg')
    if (userinfo !== 'underfined' && userinfo !== null) {
      this.username = JSON.parse(userinfo).username;
    }
    this.getCourseQuestion()
  },
  methods: {
    getCourseQuestion() {
      const paramObj = {
        kcid: '',
        type: '0', // 1=课程问题，0=入学问题
        wtid: '',
      }
      this.$server.getQuestion(paramObj).then((data) => {
        if (data.code === '0') {
          this.questions = JSON.parse(data.question)
        } else {
          console.info(data.msg);
          this.questions = ''
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
    openAsk() {
      if (this.username === '') {
        this.$message.warning('请先登陆再发起提问');
      } else {
        this.dialogFormVisible = true
      }
    },
    addQuestion(title, msg) {
      const paramObj = {
        kcid: '',
        type: '0', // 1=课程问题，0=入学问题
        title,
        msg,
        twr: this.username,
      }
      this.$server.addQuestion(paramObj).then((data) => {
        if (data.code === '0') {
          this.dialogFormVisible = false
          this.$message.success(data.msg);
          this.getCourseQuestion()
        } else {
          this.$message.warning(data.msg);
        }
      })
    },
  },
}
</script>
<style scoped>
  .enrolconsult{
    margin-left:34px;
  }
  .titleblock{
    margin-left: 10px;
    line-height: 44px;
    font-size: 30px;
  }
  .titleblock>>>.enroltitle{
    width: 121px;
    color: rgba(16, 16, 16, 1);
  }
  .titleblock>>>.question{
    margin-left:72px;
    width: 170px;
    height: 53px;
    border-radius: 18px;
    background-color: rgba(8, 150, 255, 1);
    color: rgba(255, 255, 255, 1);
    font-size: 30px;
  }
  .contactus{
    position: fixed;
    top: 35%;
    right: 37px;
  }
  .consultcontent{
    margin: 29px 0px 58px 0px;
    height: 275px;
    background-image: linear-gradient(to right , #F3F5F7, #F3F5F7);
    cursor:default;
  }
  .text{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient: vertical;
  }
  /* 此处有bug，在弹出框中使用ueditor，工具栏高度变大 */
  .titleblock>>>.edui-editor-toolbarboxouter .edui-default{
    height:32px !important;
  }
</style>
