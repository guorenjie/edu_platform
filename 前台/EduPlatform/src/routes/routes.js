

const routes = [
  // 404
  { path: '*', component: () => import('@/components/NotFound'), meta: { requiresAuth: false } },
  // 首页
  { path: '/', component: () => import('@/views/Home'), meta: { requiresAuth: false } },
  // 登录
  { path: '/login', component: () => import('@/views/Login'), meta: { requiresAuth: false } },
  // 注册
  { path: '/register', component: () => import('@/views/Register'), meta: { requiresAuth: false } },
  // 免费课程
  { path: '/freecourse', component: () => import('@/views/FreeCourse'), meta: { requiresAuth: false } },
  // 课程定制
  { path: '/customized', component: () => import('@/views/FreeCourse'), meta: { requiresAuth: false } },
  // 入学咨询
  { path: '/enrolconsult', component: () => import('@/views/EnrolConsult'), meta: { requiresAuth: false } },
  // 入学咨询答疑详细
  { path: '/enrolconsultdetail', component: () => import('@/views/EnrolConsultDetail'), meta: { requiresAuth: false } },
  // 在线测评年级科目
  { path: '/assessgradesubjects', component: () => import('@/views/AssessGradeSubjects'), meta: { requiresAuth: false } },
  // 在线测评
  { path: '/assess', component: () => import('@/views/Assess'), meta: { requiresAuth: false } },
  // 测评结果
  { path: '/assessresult', component: () => import('@/views/AssessResult'), meta: { requiresAuth: false } },
  // 购买课程
  { path: '/coursebuy', component: () => import('@/views/CourseBuy'), meta: { requiresAuth: false } },
  // 个人中心信息
  { path: '/personalcenterinfo', component: () => import('@/views/PersonalCenterInfo'), meta: { requiresAuth: false } },
  // 课程播放
  { path: '/courseplay', component: () => import('@/views/CoursePlay'), meta: { requiresAuth: false } },
  // ajax测试
  { path: '/ajaxtest', component: () => import('@/views/AjaxTest'), meta: { requiresAuth: false } },
]

export default routes
