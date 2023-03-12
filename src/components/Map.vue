<template>
  <div id="map">
    <LayersComposition
      class="layers"
      @sensorsClicked="sensorsClicked"
      @troopsClicked="troopsClicked"
      @eventsClickes="eventsClickes"
      @htmrsClicked="htmrsClicked"
    ></LayersComposition>
    <l-map class="map" :zoom="zoom" :center="center" style="z-index: 0">
      <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>

      <div v-if="showTroops">
        <l-marker
          v-for="troop in troops"
          :lat-lng="[troop.longitude, troop.latitude]"
          :key="troop.id"
          @click="updatesTroops(troop.id)"
        >
          <l-icon
            icon-url="https://static.vecteezy.com/system/resources/previews/001/198/807/original/shooting-soldier-png.png"
          />
        </l-marker>
      </div>

      <div v-if="showSensors">
        <l-marker
          v-for="sensor in sensors"
          :lat-lng="[sensor.longitude, sensor.latitude]"
          :key="sensor.id"
          @click="updatesSensor(sensor)"
        >
          <l-icon
            icon-url="https://cdn-icons-png.flaticon.com/512/124/124915.png"
          />
        </l-marker>
      </div>

      <l-polygon
        v-if="polygon.work"
        :lat-lngs="polygon.sensorPolygon"
        color="Blue"
      ></l-polygon>
      <l-polygon
        v-else
        :lat-lngs="polygon.sensorPolygon"
        color="Gray"
      ></l-polygon>

      <div v-if="showHtmrs">
        <l-polygon
          v-for="htmr in this.getOkPlaces"
          :lat-lngs="getLocations(htmr)"
          :key="htmr.name"
          color="green"
          fillColor="green"
        ></l-polygon>
        <l-polygon
          v-for="htmr in this.getMediumPlaces"
          :lat-lngs="getLocations(htmr)"
          :key="htmr.name"
          color="orange"
          fillColor="orange"
        ></l-polygon>
        <l-polygon
          v-for="htmr in this.getDengerousPlaces"
          :lat-lngs="getLocations(htmr)"
          :key="htmr.name"
          color="red"
          fillColor="red"
        ></l-polygon>
      </div>

      <l-icon
        icon-url="https://cdn-icons-png.flaticon.com/512/124/124915.png"
      />
      <div v-if="showEvents">
        <l-marker
          v-for="event in events"
          :lat-lng="[event.longitude, event.latitude]"
          :key="event.name"
        >
          <l-icon
            icon-url="https://freepngimg.com/save/142604-picture-explosion-free-clipart-hd/2000x1940"
          />
          <l-popup>{{ event.name }}</l-popup>
        </l-marker>
      </div>
    </l-map>
    <vue-snotify />
  </div>
</template>

<script>
import api from "@/api";
import markerIconPng from "leaflet/dist/images/marker-icon.png";
import LayersComposition from "@/components/Layers/LayersComposition.vue";

import {
  LMap,
  LTileLayer,
  LMarker,
  LPopup,
  LIcon,
  LPolygon,
} from "vue2-leaflet";
import asas from "../assets/logo.png";
import { Colors } from "chart.js";

export default {
  name: "Map",
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LPopup,
    LIcon,
    LPolygon,
    LayersComposition,
  },
  props: {
    sensors: {
      type: Array,
      requested: false,
    },
    troops: {
      type: Array,
      requested: false,
    },
    htmrs: {
      type: Array,
      requested: false,
    },
    events: {
      type: Array,
      requested: false,
    },
    isInfoOpen: {
      type: Number,
      requested: true,
    },
  },
  data() {
    return {
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a target="_blank" href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      zoom: 9,
      center: [32.058329, 35.210965],
      polygon: {
        sensorPolygon: [],
        work: true,
      },
      notWorkSensorpolygon: [],
      showSensors: true,
      showTroops: true,
      showEvents: true,
      ShowdeadAreas: true,
      showHtmrs: true,
    };
  },
  async created() {
    await this.notWorking();
  },
  sockets: {
    "new-event": function (event) {
      this.playSound(
        "http://soundbible.com/mp3/Air Plane Ding-SoundBible.com-496729130.mp3"
      );
      this.displayNotification();
      this.addEvent(event);
    },
  },
  methods: {
    async notWorking() {
      const notWorkedSensor = this.sensor.filter(
        (sen) => sen.isWorking == false
      );
    },
    async updatesSensor(sensor) {
      this.polygon.sensorPolygon = [];
      this.polygon.work = sensor.isWorking;

      try {
        const data = (await api.sensors().getSensorObservationArea(sensor.id))
          .data;

        data.forEach((pt) => {
          this.polygon.sensorPolygon.push([pt.longitude, pt.latitude]);
        });
      } catch (err) {
        console.log("error");
      }

      this.$emit("updatesSensor", sensor.id);
    },
    updatesTroops(troppId) {
      this.$emit("updatesTroops", troppId);
    },
    getLocations(htmr) {
      const locations = [];
      htmr.htmrLocations.forEach((location) => {
        locations.push([location.longtitude, location.latitude]);
      });
      return locations;
    },

    sensorsClicked() {
      this.showSensors = !this.showSensors;
    },

    troopsClicked() {
      this.showTroops = !this.showTroops;
    },
    htmrsClicked() {
      this.showHtmrs = !this.showHtmrs;
    },

    addEvent(event) {
      this.events.push(event);
    },

    playSound(sound) {
      if (sound) {
        var audio = new Audio(sound);
        audio.play();
      }
    },

    eventsClickes() {
      this.showEvents = !this.showEvents;
    },

    displayNotification() {
      this.$snotify.simple("אירוע חדש נוסף עכשיו");
    },
  },
  watch: {
    isInfoOpen: {
      handler() {
        if (this.isInfoOpen === -1) {
          this.polygon.sensorPolygon = [];
        }
      },
      immediate: true,
    },
  },
  computed: {
    getOkPlaces() {
      const filteredHtmr = this.htmrs.filter((htmr) => {
        return htmr.securityLevel <= 0.33;
      });
      return filteredHtmr;
    },
    getMediumPlaces() {
      const filteredHtmr = this.htmrs.filter((htmr) => {
        return htmr.securityLevel > 0.33 && htmr.securityLevel <= 0.66;
      });
      return filteredHtmr;
    },
    getDengerousPlaces() {
      const filteredHtmr = this.htmrs.filter((htmr) => {
        return htmr.securityLevel > 0.66;
      });
      return filteredHtmr;
    },
  },
};
</script>

<style scoped>
.map {
  height: 80vh;
}
.layers {
  z-index: 10;
  position: fixed;
  top: 12.5vh;
}
</style>
