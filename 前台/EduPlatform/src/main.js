import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import VueUeditorWrap from 'vue-ueditor-wrap'
import router from '@/routes'

import Vue from 'vue'
import VueVideoPlayer from 'vue-video-player'
import 'video.js/dist/video-js.css'
import 'video.js/dist/lang/zh-CN'
import 'vue-video-player/src/custom-theme.css'

import App from './App'
import { server } from './utils/http-service'
import * as filters from './filters';

Vue.use(VueVideoPlayer, /* {
  options: global default options,
  events: global videojs events
} */)
// 定义全局变量
Vue.prototype.$server = server;
Vue.use(ElementUI)
Vue.component('vue-ueditor-wrap', VueUeditorWrap)
// 阻止启动生产消息
Vue.config.productionTip = false
// 注册全局过滤器
Object.keys(filters).forEach(k => Vue.filter(k, filters[k]));
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
})
