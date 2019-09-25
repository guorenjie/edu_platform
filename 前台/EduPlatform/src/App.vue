<template>
  <div id="app">
    <app-header v-if="header_show" :active="active"></app-header>
    <router-view v-on:header="header" v-on:footer="footer"></router-view>
    <app-footer v-if="footer_show"></app-footer>
  </div>
</template>


<script>
import Header from './components/common/header'
import Footer from './components/common/footer'

export default {
  name: 'App',
  data() {
    return {
      header_show: true,
      active: '',
      footer_show: true,
    }
  },
  components: {
    'app-header': Header,
    'app-footer': Footer,
  },
  methods: {
    // 是否显示头部
    header(bool, active) {
      this.header_show = bool;
      if (typeof (active) === 'undefined') {
        this.active = '1';
      }
      if (typeof (active) === 'number') {
        this.active = active.toString();
      }
      if (typeof (active) === 'string') {
        this.active = active;
      }
    },
    // 是否显示底部
    footer(bool) {
      this.footer_show = bool;
    },
  },
}
</script>
