<template>
  <div id="recommendationsView">
    <div class="container">
      <div class="row">
        <div
          class="col mt-4 d-flex justify-content-center"
          v-for="(recommendation, index) in recommendations"
        >
          <RecommendationsCard
            :key="index"
            :color="recommendation.color"
            :content="recommendation.content"
            :title="recommendation.title"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent } from "vue";
import RecommendationsCard from "@/components/RecommendationCard.vue";
import api from "@/api";

export default defineComponent({
  name: "RecommendationsView",
  components: {
    RecommendationsCard,
  },
  data() {
    return {
      recommendations: [],
    };
  },
  async created() {
    this.recommendations = (await api.recommend().getAllRecommends()).data;

    try {
      const a = await (
        await api.recommend().getRecommendationsToMoveSolidersBetweenHtmrs()
      ).data.forEach((recommend) => {
        this.recommendations.push(recommend);
      });
    } catch (error) {
      console.log(error);
    }
    const hotAreaRecs = (await api.recommend().getHotAreacommends()).data;
    hotAreaRecs.forEach((reccomend) => this.recommendations.push(reccomend));
  },
  sockets: {
    "new-event": function (event) {
      this.addTroopsEvent(event);
    },
    "new-event-emergency-hospitals": function (emergencyHospitals) {
      this.addHospitalEvent(emergencyHospitals);
    },

  },
  methods: {
    async addTroopsEvent(event) {
      const troops = (await api.troops().getAllTroops()).data;

      let closestTroop = {};
      let min = 10000;
      troops.forEach((troop) => {
        const distance = Math.sqrt(
          Math.pow(troop.latitude - event.latitude, 2) +
            Math.pow(troop.longitude - event.longitude, 2)
        );

        if (distance < min) {
          closestTroop = troop;
          min = distance;
        }
      });

      this.recommendations.push({
        title: "recommendad troops for event",
        content: `there is new event in location ${event.longitude}, ${event.latitude} the closest troops is in ${closestTroop.longitude}, ${closestTroop.latitude}`,
        color: "orange",
        isRemoveAble: true,
      });
    },
    addHospitalEvent(emergencyHospitals) {
      this.recommendations.push({
        title: `recommended hospitals for event ${emergencyHospitals.eventName}`,
        content: `you can send ${this.hospitalEventContent(emergencyHospitals)}`,
        color: "blue",
      });
    },

    hospitalEventContent(emergencyHospitals) {
      let content = "";
      emergencyHospitals.hospitals.forEach((hospital) => {
        content += `\n${hospital.availableAmount} to ${hospital.name}` 
      });

      return content;
    }


  },
});
</script>

<style scoped>
#recommendationsView {
  background-color: #f3ebff;
  padding-top: 1%;
  padding-bottom: 40%;
}
</style>
