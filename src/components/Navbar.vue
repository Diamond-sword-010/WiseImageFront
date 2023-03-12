<template>
  <div>
    <b-navbar type="dark" variant="dark">
      <b-navbar-nav>
        <b-nav-item disabled> <CurrWeather /></b-nav-item>
        <b-nav-item disabled> <CurrTime /></b-nav-item>
      </b-navbar-nav>
      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="navCenter">
          <div class="hero-foot">
            <nav class="tabs is-boxed">
              <div class="container">
                <b-nav-item v-for="route in routes" :key="route.name" tag="li">
                  <router-link
                    class="text size"
                    :to="route.path"
                    exact
                    active-class="is-active"
                  >
                    {{ route.name }}
                  </router-link>
                </b-nav-item>
              </div>
            </nav>
          </div>
        </b-navbar-nav>
      </b-collapse>
      <b-navbar-nav class="ml-auto">
        <b-nav-item right disabled>
          <system-info
            :date="date"
            :systemName="systemName"
            :isEmergency="false"
          >
          </system-info>
        </b-nav-item>
      </b-navbar-nav>
    </b-navbar>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import SystemInfo from "./SystemInfo.vue";
import CurrWeather from "../components/CurrWeather.vue";
import CurrTime from "../components/CurrTime.vue";
import router from "../router/index";

export default defineComponent({
  name: "Navbar",
  data() {
    return {
      date: Date.now(),
      systemName: "בזלת",
    };
  },
  components: {
    SystemInfo,
    CurrWeather,
    CurrTime,
  },

  computed: {
    routes() {
      return router.options.routes;
    },
  },
});
</script>

<style>
.navCenter {
  float: none;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.size {
  font-size: 20px;
}

.is-active {
  color: white !important;
}
.size {
  color: gray;
}
.size:hover {
   color: gray;

}
</style>
