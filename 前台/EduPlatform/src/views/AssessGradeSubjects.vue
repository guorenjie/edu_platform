<!--在线测评年级科目 -->
<template>
  <div class="gradesubject" style="margin:0 16px;">
    <div class="choosetestpaper">请选择您想测试的试卷</div>
    <div v-if="xxpapers" style="margin-top:60px;padding-bottom: 40px;">
      <div style="width: 69px;height: 51px;line-height: 49px;color: rgba(15, 14, 14, 1);font-size: 34px;font-weight:bold">小学</div>
      <el-row style="margin:28px 0px;cursor: default;">
        <el-col :span="6" v-for="(item,index) in xxpapers" :key="index" class="paperitem" @click.native="jump('/assess',{sjid:item.sjid,sjbt:item.sjbt})">{{item.sjbt}}</el-col>
      </el-row>
    </div>
    <div v-if="xxpapers" style="width: 100%;height: 3px;background:#C8C8C8;"/>
    <div v-if="czpapers" style="margin-top:60px;padding-bottom: 40px;">
      <div style="width: 69px;height: 51px;line-height: 49px;color: rgba(15, 14, 14, 1);font-size: 34px;font-weight:bold">初中</div>
      <el-row style="margin:28px 0px;cursor: default;">
        <el-col :span="6"  v-for="(item,index) in czpapers" :key="index" class="paperitem" @click.native="jump('/assess',{sjid:item.sjid,sjbt:item.sjbt})">{{item.sjbt}}</el-col>
      </el-row>
    </div>
    <div v-if="czpapers" style="width: 100%;height: 3px;background:#C8C8C8;"/>
    <div v-if="gzpapers" style="margin-top:60px;padding-bottom: 40px;">
      <div style="width: 69px;height: 51px;line-height: 49px;color: rgba(15, 14, 14, 1);font-size: 34px;font-weight:bold">高中</div>
      <el-row style="margin:28px 0px;cursor: default;">
        <el-col :span="6"  v-for="(item,index) in gzpapers" :key="index" class="paperitem" @click.native="jump('/assess',{sjid:item.sjid,sjbt:item.sjbt})">{{item.sjbt}}</el-col>
      </el-row>
    </div>
  </div>
</template>
<script>
export default {
  name: 'gradesubject-view',
  data() {
    return {
      xxpapers: [],
      czpapers: [],
      gzpapers: [],
    }
  },
  created() {
    this.$emit('header', true);
    this.$emit('footer', false);
    this.getSubject()
  },
  methods: {
    // 获取年级科目
    getSubject() {
      const paramObj = {
        sjid: '',
      }
      this.$server.getPaper(paramObj).then((data) => {
        if (data.code === '0') {
          const papers = JSON.parse(data.paper);
          for (let i = 0; i < papers.length; i += 1) {
            if (papers[i].sjdj && papers[i].sjdj === '1') {
              this.xxpapers.push(papers[i]);
            }
            if (papers[i].sjdj && papers[i].sjdj === '2') {
              this.czpapers.push(papers[i]);
            }
            if (papers[i].sjdj && papers[i].sjdj === '3') {
              this.gzpapers.push(papers[i]);
            }
          }
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
<style scoped>
  .choosetestpaper{
    margin-top: 45px;
    line-height: 52px;
    color: rgba(8, 150, 255, 1);
    font-size: 36px;
    text-align: center;
    font-family: Microsoft Yahei;
  }
  .paperitem{
    height: 100px;
    line-height: 100px;
    color: rgba(15, 14, 14, 1);
    font-size: 32px;
  }
</style>
