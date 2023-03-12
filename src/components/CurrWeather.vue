<template>
  <div class="badge bg-secondary text-wrap textBox">
    <div class="text">
      {{ currWeather }}°
    </div>
</div>
</template>

<script>
import api from '../api.ts';

export default {
    name: "CurrTime",
    data () {
      return {
        currWeather: 25
      };
    },
    async created() {
      try{
        // this.currWeather = await api.weather().getCurrTemp();
      } catch (error) {
        console.log("get weather did not succeed");
      }
    }
  }
</script>

<style scoped>
.textBox{
  width: 6.8vh;
  height: 45px;
}

.text{
  color: white;
  font-size: x-large;
  margin-top: 15%;
  margin-left: 11%;
}
</style>