<template>
  <div id="app">
    <Navbar> </Navbar>
    <router-view />
    <map-footer id="mapFooter" />
  </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import Navbar from "@/components/Navbar.vue";
import MapFooter from "@/components/MapFooter.vue";

export default defineComponent({
  components: {
    Navbar,
    MapFooter,
  },
  sockets: {
    connect: () => {
      console.log("connected");
    },
  },
});
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}

#mapFooter {
  position: fixed;
  bottom: 0;
  width: 100vw;
}
</style>
