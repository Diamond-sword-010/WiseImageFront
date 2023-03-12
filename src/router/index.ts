import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import GraphView from '../views/GraphView.vue'
import RecommendationsView from '../views/recommendations.vue'

Vue.use(VueRouter)

const routes: Array<RouteConfig> = [
  {
    path: '/',
    name: 'תמונת מצב',
    component: HomeView
  },
  {
    path: '/graphs',
    name: 'ניתוחי מידע',
    component: GraphView
  },
  {
    path: '/recommendations',
    name: 'המלצות',
    component: RecommendationsView
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
