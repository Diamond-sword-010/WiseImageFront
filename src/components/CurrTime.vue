<template>
    <div class="badge bg-secondary text-wrap textBox">
    <div class="text">
        {{ time }}
    </div>
  </div>
  </template>
  
  <script>  
  export default {
    name: "CurrTime",
      data() {
        return {
            time: "25",
            interval: 0
        }
      },
     mounted() {
        this.updateClock();
         this.interval = setInterval(this.updateClock, 1000);
      },
      methods: {
        updateClock() {
         this.time = new Date().toLocaleTimeString([],
         { hour: '2-digit', minute: "2-digit", hour12: false });
        }
      }
    }
  </script>
  
  <style scoped>
 .textBox{
  width: 10vh;
  height: 45px;
}

.text{
  color: white;
  font-size: x-large;
  margin-top: 10%;
  margin-left: 3%;
}
  </style>