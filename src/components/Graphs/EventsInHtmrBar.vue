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
  name: 'EventsInHtmrBar',

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
            text: 'כמות אירועים לפי חטמ"ר',
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
      const data = await api.htmrs().getEventsAmountInHtmrs();
      this.chartData.labels = data.map((htmr) => htmr.name);
      this.chartData.datasets[0].data = data.map((htmr) => htmr.eventsAmount);
      this.loaded = true;
    } catch (e) {
      console.error(e)
    }
  }
})
</script>