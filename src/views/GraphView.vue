<template>
  <div id="graphView">
    <b-container class="bv-example-row">
      <b-card-group columns>
        <b-card class="bigger">
          <p><bdi>כמות אירועים בחטמ"ר</bdi></p>
          <EventsInHtmrBar />
        </b-card>
        <b-card class="bigger">
          <p><bdi>סד"כ בחטמ"ר</bdi></p>
   <soliders-per-htmr/>
        </b-card>
        <b-card class="biggerCake">
          <p><bdi>כשירות סנסורים</bdi></p>
          <ActivityPie />
        </b-card>
        <b-card class="bigger">
          <p><bdi>פוטנציאל להתחממות (%)</bdi></p>
          <HtmrBar />
        </b-card>
      </b-card-group>
    </b-container>
  </div>
</template>
<script>
import { defineComponent } from "vue";
import SoldiersBar from "@/components/Graphs/SoldiersBar.vue";
import ActivityPie from "@/components/Graphs/ActivityPie.vue";
import HtmrBar from "@/components/Graphs/HtmrBar.vue";
import EventsInHtmrBar from "@/components/Graphs/EventsInHtmrBar.vue";
import SolidersPerHtmr from "@/components/Graphs/SolidersPerHtmr.vue";


export default defineComponent({
  name: "GraphView",
  components: {
    SoldiersBar,
    ActivityPie,
    HtmrBar,
    EventsInHtmrBar,
    SolidersPerHtmr,

  },
});
</script>

<style scoped>
#graphView {
  background-color: #f3ebff;
  padding-bottom: 13%;
  padding-top: 5%;
}
.pie {
  display: inline-block;
  width: 70%;
}

.bigger {
  height: 40vh;
  border-radius: 10%;
}

.biggerCake {
  height: 60vh;
  border-radius: 10%;
}

p {
  margin-top: 18%;
  font-size: 25px;
  color: black;
}

#securitySolidersAmounts {
  margin-left: 37%;
}

#securitySolidersAmounts{
  margin-left: 37%;
}
</style>
