<template>
  <Pie v-if="loaded" :chart-options="chartOptions" :data="chartData" />
</template>

<script>
import { Pie } from "vue-chartjs";
import api from "../../api.ts";

import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  ArcElement,
  CategoryScale,
  BarElement,
  LinearScale,
} from "chart.js";
ChartJS.register(
  Title,
  Tooltip,
  Legend,
  ArcElement,
  CategoryScale,
  BarElement,
  LinearScale
);

export default {
  name: "PieChart",
  components: {
    Pie,
  },
  data() {
    return {
      loaded: false,
      chartData: {
        labels: ["תקין", "לא תקין"],
        datasets: [
          {
            backgroundColor: ["#2a9c05", "#DD1B16"],
            data: [],
          },
        ],
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false,
        tooltips: {
          enabled: false,
        },
        legend: {
          display: false,
        },
      },
    };
  },
  async created() {
    await this.addData();
    this.loaded = true;
  },
  methods: {
    async addData() {
      try {
        const workingAndNotWorkingAmounts = await api
          .sensors()
          .getWorkingAndNotWorkingAmounts();
        this.chartData.datasets[0].data.push(
          workingAndNotWorkingAmounts.workingAmount
        );
        this.chartData.datasets[0].data.push(
          workingAndNotWorkingAmounts.notWorkingAmout
        );
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
