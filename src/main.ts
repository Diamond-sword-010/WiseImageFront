import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import VueSweetalert2 from "vue-sweetalert2";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import VueSocketIO from "vue-socket.io";
import SocketIO from "socket.io-client";
import Snotify from 'vue-snotify';
import 'vue-snotify/styles/material.css'; // or dark.css or simple.css

Vue.use(Snotify);
Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
Vue.use(VueSweetalert2);
/* Establish Connection */
const socketConnection = SocketIO("http://localhost:3001");
Vue.use(new VueSocketIO({ connection: socketConnection }));

Vue.config.productionTip = false;
new Vue({ router, store, render: (h) => h(App) }).$mount("#app");
