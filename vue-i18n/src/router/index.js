import Vue from 'vue'
import VueRouter from 'vue-router'
import { Trans } from '@/plugins/Translation'

function load(component) {
  // '@' is aliased to src/components
  return () => import(`@/views/${component}.vue`)
}

Vue.use(VueRouter)

const routes = [{
    path: '/:locale',
    component: {
      template: "<router-view></router-view>"
    },
    beforeEnter: Trans.routeMiddleware,
    children: [{
        path: '',
        name: 'Home',
        component: load('Home')
      },
      {
        path: 'about',
        name: 'About',
        component: load('About')
      }
    ]
  },
  {
    path: '*',
    redirect() {
      return Trans.defaultLocale;
    }
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
