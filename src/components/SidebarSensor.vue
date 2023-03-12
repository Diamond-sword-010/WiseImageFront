<template>
  <div id="SideBarSensor">
    <div class="container">
      <b-col class="w-25 position-absolute side-bar">
        <b-col class="buttonExit">
          <b-button pill variant="outline-secondary" @click="close">X</b-button>
        </b-col>
        <h1 id="title">סטטוס סנסור</h1>
        <div class="right">
          <p> סוג סנסור: {{ this.selectedSensor.name }}</p>
          <p>
            ( {{ this.selectedSensor.longitude }} ,
            {{ this.selectedSensor.latitude }} ) :מיקום
          </p>
          <p> כשירות: {{ this.isWorking }}</p>
          <p>שטח תצפית: {{ this.selectedSensor.observationAreaName }} </p>
        </div>
      </b-col>
    </div>
  </div>
</template>

<script>
import api from "@/api";

export default {
  name: "SideBarSensor",
  data() {
    return {
      selectedSensor: {},
    };
  },
  props: {
    sensorInfoId: {
      type: Number,
      required: true,
    },
  },
  watch: {
    sensorInfoId: "getSensor",
  },
  methods: {
    close() {
      console.log(this.sensorInfoId);
      console.log(this.selectedSensor);
      this.$emit("close");
    },
    async getSensor() {
      try {
        this.selectedSensor = (
          await api.sensors().getSensorById(this.sensorInfoId)
        ).data;

      } catch (err) {
        console.log("error");
      }
    },
  },
  computed: {
    isWorking() {
      if (this.selectedSensor.isWorking) {
        return "תקין";
      } else {
        return "לא תקין";
      }
    }

  }
};
</script>

<style scoped>
.side-bar {
  right: 1.5vw;
  top: 50%;
  padding-top: 2vh;
  transform: translate(0, -75%);
  height: 48%;
  margin-right: 1.5vh;
  border-radius: 3vh;
  background: #1f1f1f;
  color: aliceblue;
  box-shadow: 2px 6px 4px 6px #b17cfc;
}
.right {
  text-align: right;
  margin-right: 2vw;
}
.buttonExit {
  text-align: right;
  margin-right: 5%;
}
#title {
  text-align: center;
}
</style>
