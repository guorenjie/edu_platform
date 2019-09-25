<!-- 发起提问 -->
<template>
    <div class="ask">
      <el-row>
        <el-col style="width: calc(100% - 60px);height: 60px;">
          <el-input
            placeholder="请输入问题标题"
            v-model="titletext"
            clearable
            style="width: calc(100% - 15px);">
          </el-input>
        </el-col>
        <el-col style="width:60px;">
          <el-tooltip class="item" effect="dark" :content="tiptext" placement="left-end">
            <div style="line-height:20px;color:#36BA59;">如何更好的提问</div>
          </el-tooltip>
        </el-col>
      </el-row>
      <vue-ueditor-wrap v-model="msg" :config="myConfig"></vue-ueditor-wrap>
      <div style="text-align:right;">
        <el-button type="danger" round style="font-size:16px;margin-top: 20px;" @click="ask">提交</el-button>
      </div>
    </div>
</template>

<script>
export default {
  name: 'ask',
  data() {
    return {
      titletext: '',
      tiptext: '您需要输入提问的“标题”和“具体内容”，点击提交，即可提问成功',
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
  methods: {
    // 发起提问
    ask() {
      if (this.titletext === '') {
        this.$message.warning('问题标题不能为空!')
        return
      }
      if (this.msg === '') {
        this.$message.warning('问题内容不能为空!')
        return
      }
      this.$emit('switch', this.titletext, this.msg);
    },
  },
  created() {
  },
}
</script>
<style scoped>
</style>
