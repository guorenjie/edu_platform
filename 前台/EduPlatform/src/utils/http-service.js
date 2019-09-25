/* eslint-disable */
import axios from 'axios';
import qs from 'Qs'

axios.defaults.timeout = 5000;
// 修改服务器ip需要修改ajax连接/img过滤器/上传头像地址
axios.defaults.baseURL ='http://39.105.145.175/edu'; //填写域名
// axios.defaults.baseURL ='http://127.0.0.1:8080/edu'; //填写域名

//http request 拦截器
axios.interceptors.request.use(  config => {
    config.headers = {      
        'Content-Type':'application/x-www-form-urlencoded'
    }    
    return config;
  },
  error => {    return Promise.reject(err);
  }
);

//响应拦截器即异常处理
axios.interceptors.response.use(response => {    
    return response
}, err => {    
    if (err && err.response) {      
        switch (err.response.status) {        
            case 400:
                console.log('错误请求')          
                break;        
            case 401:            
                console.log('未授权，请重新登录')          
                break;        
            case 403:          
                console.log('拒绝访问')          
                break;        
            case 404:          
                console.log('请求错误,未找到该资源')          
                break;        
            case 405:          
                console.log('请求方法未允许')          
                break;        
            case 408:          
                console.log('请求超时')          
                break;        
            case 500:          
                console.log('服务器端出错')          
                break;        
            case 501:          
                console.log('网络未实现')          
                break;        
            case 502:          
                console.log('网络错误')          
                break;        
            case 503:          
                console.log('服务不可用')          
                break;        
            case 504:          
                console.log('网络超时')          
                break;        
            case 505:          
                console.log('http版本不支持该请求')
                break;        
            default:          
                console.log(`连接错误${err.response.status}`)
      }
    } else {      
        console.log('连接到服务器失败')
    }    
    return Promise.resolve(err.response)
})

/**
 * 封装get方法
 * @param url
 * @param data
 * @returns {Promise}
 */
export function get(url,params={}){  return new Promise((resolve,reject) => {
    axios.get(url,{      params:params
    })
    .then(response => {
      resolve(response.data);
    })
    .catch(err => {
      reject(err)
    })
  })
}

/**
 * 封装post请求
 * @param url
 * @param data
 * @returns {Promise}
 */
 export function post(url,data = {}){   return new Promise((resolve,reject) => {
     axios.post(url,qs.stringify(data))
          .then(response => {
            resolve(response.data);
          },err => {
            reject(err)
          })
   })
 } 
 
 /**
 * 封装patch请求
 * @param url
 * @param data
 * @returns {Promise}
 */
export function patch(url,data = {}){  return new Promise((resolve,reject) => {
    axios.patch(url,data)
         .then(response => {
           resolve(response.data);
         },err => {
           reject(err)
         })
  })
} 

/**
 * 封装put请求
 * @param url
 * @param data
 * @returns {Promise}
 */
export function put(url,data = {}){  return new Promise((resolve,reject) => {
    axios.put(url,data)
         .then(response => {
           resolve(response.data);
         },err => {
           reject(err)
         })
  })
}

/**
* 测试接口
* test
* 参数：paramObj/null
* 方式：get/post/patch/put
*/
export const server = {    
    gettest: function(paramObj){        
        return get('edu/getTest',paramObj);
    },
    posttest: function(paramObj){        
      return post('edu/postTest',paramObj);
    },
    /**
     * 用户注册
     * @param paramObj
     * const paramObj = {
        username: this.fullname,姓名
        user_id: this.username,账号
        password: this.password,密码
      }
     */
    register: function(paramObj){        
      return post('edu/register',paramObj);
    },
    /**
     * 用户登陆
     * @param paramObj
     * const paramObj = {
        user_id: this.username,账号
        password: this.password,密码
      } 
     */
    login: function(paramObj){        
        return post('edu/login',paramObj);
    },
    /**
     * 首页轮播图
     * @param paramObj 
     * const paramObj = {
      }
     */
    getAd: function(paramObj){        
      return post('edu/getAd',paramObj);
  },
    /**
     * 精选课程
     * @param paramObj 
     * const paramObj = {
        ishomeshow: '1',是否首页显示
      }
     */
    getSubject: function(paramObj){        
      return post('edu/getSubject',paramObj);
  },
  /**
     * 获取课程列表
     * const paramObj = {
        kmxx: kmxxlx[0], 课程学校 小学/初中/高中
        kmlx: kmxxlx[1], 课程类型 语文/数学/英语/物理
        type: 0=默认所有，1=我的课程
      }
     */
    getCourses: function(paramObj){        
      return post('edu/getCourses',paramObj);
  },
  /**
     * 获取课程信息
     * const paramObj = {
        kcid,
      }
     */
    getCourseInfo: function(paramObj){        
      return post('edu/getCourseInfo',paramObj);
  },
  /**
     * 获取问题
     * const paramObj = {
        kcid: this.kcid,
        type: '1',  1=课程问题，0=入学问题
        wtid: ''
      }
     */
    getQuestion: function(paramObj){        
      return post('edu/getQuestion',paramObj);
  },
  /**
     * 课程发起问题
     * const paramObj = {
        kcid: this.kcid, 课程id
        type: '1', // 1=课程问题，0=入学问题
        title, 问题标题
        msg, 问题内容
        twr, 提问人
      }
     */
    addQuestion: function(paramObj){        
      return post('edu/addQuestion',paramObj);
  },
  /**
     * 回复问题
     * const paramObj = {
        wtid: this.wtid, 问题id
        hfr: this.username, 回复人id
        hfnr: this.msg, 回复内容
      }
     */
    updateQuestion: function(paramObj){        
      return post('edu/updateQuestion',paramObj);
  },
  /**
     * 获取试卷
     * const paramObj = {
        sjid: this.sjid, 试卷id
      }
     */
    getPaper: function(paramObj){        
      return post('edu/getPaper',paramObj);
  },
  /**
     * 获取题目
     * const paramObj = {
        sjid: this.sjid, 试卷id
      }
     */
    getTopic: function(paramObj){        
      return post('edu/getTopic',paramObj);
  },
  /**
     * 获取用户信息
     * const paramObj = {
        userid: this.userid, 用户id
      }
     */
    getUserInfo: function(paramObj){        
      return post('edu/getUserInfo',paramObj);
  },
  /**
     * 编辑用户信息
     * const paramObj = {
        userid: this.userid,
        userimg: this.userimgedit,
        username: this.fullnameedit,
        sex: this.sexedit,
        birth: this.birthedit,
      }
     */
    setUserInfo: function(paramObj){        
      return post('edu/setUserInfo',paramObj);
  },
  /**
     * 获取我的课程
     * const paramObj = {
        userid: this.userid,
        type: '0',   0=所有 1=最后收藏的2个
      }
     */
    getMyCourses: function(paramObj){        
      return post('edu/getMyCourses',paramObj);
  },
  /**
     * 播放课程时将课程添加到我的课程（如果此人已经有这个课程就不重复添加了）
     * const paramObj = {
        kcid: '',
        userid: this.userid,
      }
     */
    addMyCourse: function(paramObj){        
      return post('edu/addMyCourse',paramObj);
  },
}