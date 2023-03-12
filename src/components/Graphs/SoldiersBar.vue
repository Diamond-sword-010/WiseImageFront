<template>
    <Bar v-if="loaded"
    :options="chartOptions"
    :data="chartData"
  />
</template>
<script>
import { defineComponent } from 'vue';
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
import api from '@/api';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default defineComponent({
  name: 'SoldiersBar',

  components: { Bar },
  
  data() {
    return {
        loaded: false,
        chartData: {
            labels: [],
            datasets: [{ 
                data: [],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor:'rgb(75, 192, 192)',
                borderWidth: 1
            }]   
        },

        chartOptions: {
        responsive: true,
        plugins: {
          title: {
            isplay: true,
            text: "כמות חיילים לפי יחידה",
          },

          legend: {
            display: false
          },
        },
      }
    }
  },

  async created() {
    this.loaded = false

    try {
      const typesData = await api.troops().getTypesAmounts();
      this.chartData.labels = typesData.map((type) => type.type)
      this.chartData.datasets[0].data = typesData.map((type) => type.amount)
      this.loaded = true
    } catch (e) {
      console.error(e)
    }
  }
})
</script>
<style scoped>

</style>