<template>
  <div vclass="home">
    <Map
      :isInfoOpen="sensorInfo"
      :sensors="sensors"
      :troops="troops"
      :htmrs="htmrs"
      :events="events"
      @updatesTroops="updatesTroops"
      @updatesSensor="updatesSensor"
    />
    <sidebar-sensor
      :sensorInfoId="sensorInfo"
      @close="sensorInfo = -1"
      v-show="sensorInfo !== -1"
    />
    <sidebar-troop
      @close="troopInfo = -1"
      v-show="troopInfo !== -1"
      :troopInfoId="troopInfo"
    />

  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Map from "../components/Map.vue";
import api from "@/api";
import SidebarSensor from "@/components/SidebarSensor.vue";
import sidebarTroop from "../components/sidebarTroop.vue";
import MapFooter from "../components/MapFooter.vue";
import Swal from "sweetalert2";

export default defineComponent({
  name: "App",
  components: {
    Map,
    SidebarSensor,
    sidebarTroop,
    MapFooter,
  },
  data() {
    return {
      troops: [],
      sensors: [],
      htmrs: [],
      events: [],
      sensorInfo: -1,
      troopInfo: -1,
    };
  },
  async created() {
    setInterval(() => this.getSensors(), 60000);
    setInterval(() => this.getTroops(), 60000);
    setInterval(() => this.getEvents(), 60000);
  },
  async mounted() {
    this.getSensors();
    this.getTroops();
    this.getHtmrs();
    this.getEvents();
  },
  methods: {
    async getSensors() {
      try {
        this.sensors = (await api.sensors().getAllSensors()).data;
      } catch (err) {
        console.log("error");
      }
    },
    async getTroops() {
      try {
        this.troops = (await api.troops().getAllTroops()).data;
      } catch (err) {
        console.log(`${err} couldn't get the Troops.`);
      }
    },
    async getHtmrs() {
      try {
        this.htmrs = (await api.htmrs().getHtmrs()).data;
        console.log("f");
      } catch (err) {
        console.log(`${err} couldn't get the Htmrs.`);
      }
    },
    async getEvents() {
      try {
        this.events = (await api.events().getAllEvents()).data;
      } catch (err) {
        console.log(`${err} couldn't get the Events.`);
      }
    },

    updatesTroops(troopId: number) {
      this.sensorInfo = -1;
      this.troopInfo = troopId;
    },
    updatesSensor(sensorId: number) {
      this.troopInfo = -1;
      this.sensorInfo = sensorId;
    },
  },
});
</script>
<style scoped></style>
