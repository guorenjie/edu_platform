import Vue from 'vue'
import VueRouter from 'vue-router'

import routes from './routes'

Vue.use(VueRouter)

const router = new VueRouter({
  base: '/eduplatform/', // 打包项目根目录
  // 转到一个新的页面时，定位到最顶端
  // eslint-disable-next-line no-unused-vars
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    }
    return { x: 0, y: 0 }
  },
  routes,
})

// 路由守卫
router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) { // 这里meta字段的名称要与route里面保持一致，判断当前路由是否需要登录验证
    const userinfo = localStorage.getItem('usg')
    if (userinfo === 'underfined' || userinfo === null) { // 自定义判断条件，判断是否登录，如果未登录，跳转登陆页面
      next({ path: '/login' })
    } else {
      next() // 已登录，直接访问
    }
  } else {
    // 不需要登录验证，直接访问
    next()
  }
})

export default router
