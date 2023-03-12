<template>
  <Bar v-if="loaded"
    :options="chartOptions"
    :data="chartData"
  />
</template>

<script>
import api from "../../api.ts";
import { defineComponent } from 'vue';
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

export default {
  name: "PieChart",
  components: {
    Bar,
  },
  async created() {
    await this.addData();
    this.loaded = true;
  },

  data() {
    return {
      chartData: {
            labels: [],
            datasets: [{ 
                data: [],
                backgroundColor:  ['rgb(75, 192, 192)'], 
                borderColor:'rgb(75, 192, 192)',
                borderWidth: 1
            }]   
        },
      loaded: false,
        chartOptions: {
        responsive: true,
        plugins: {
          title: {
            isplay: true,
            text: "כמות חיילים ",
          },

          legend: {
            display: false
          },
        },
      }
    };
  },
  methods: {
    async addData() {
      try {
        const htmrSecurityLevelAmounts = await api
          .htmrs()
          .getHtmrSecurityLevelAmounts();
          
        this.chartData.datasets[0].data.push(
          htmrSecurityLevelAmounts.noRiskAmount
        );
        this.chartData.datasets[0].data.push(
          htmrSecurityLevelAmounts.regularRiskAmount
        );
        this.chartData.datasets[0].data.push(
          htmrSecurityLevelAmounts.highRiskAmount
        );
      } catch (error) {
        console.log(error);
      }
    },
  },
  async created() {
    this.loaded = false
    try {
      const typesData = (await api.htmrs().getHtmrs()).data;
    //   const colors = typesData.map((type) => {
    //     if (type.securityLevel < 0.33) {
    //       return ("green"); 
    //     } else if (type.securityLevel > 0.66) {
    //       return ("red"); 
    //   } else {
    //     return ("orange");
    //   }
    // });


    // this.chartData.backgroundColor = colors; 

      this.chartData.labels = typesData.map((type) =>  type.name);
      this.chartData.datasets[0].data = typesData.map((type) => type.securityLevel * 100)
    
      this.loaded = true
    } catch (e) {
      console.error(e)
    }
  }
};
</script>
