<template>
  <div class="container">
    <b-col class="w-25 position-absolute side-bar">
      <b-col class="buttonExit">
        <b-button pill variant="outline-secondary" @click="close">X</b-button>
      </b-col>
      <h1 id="title">פרטי הכוח</h1>
      <br />
      <div class="right">
        <p>מיקום : {{ this.troopsLocation }}</p>
        <p>סוג הכוח: {{ troopChose.type }}</p>
        <p>חטמ"ר: {{ troopChose.base }}</p>
        <p>סד"כ: {{ troopChose.amount }}</p>
        <p>מפקד הכוח: {{ troopChose.commander }} </p>
        <p>טלפון אדום: {{ troopChose.phone }}</p>
      </div>
    </b-col>
  </div>
</template>

<script>
import api from "@/api";

export default {
  
  name: "SideBarTroops",
  data() {
    return {
      troopChose : {},
    }
  },
  props: {
    troopInfoId: {
      type: Number,
      required: true,
    },
  },
   watch: {
    troopInfoId: "getTroop",
  },
  computed: {
    troopsLocation() {
      if(this.troopInfoId !== -1) {
      return `(${this.troopChose.longitude}, ${this.troopChose.latitude})`
      }
    }
  },
  methods:{
    async getTroop() {
      try {
         this.troopChose = (await api.troops().getTroopById(this.troopInfoId)).data;
         console.log(this.troopChose);
      } catch (err) {
        console.log("error");
      }
    },
    close() {
      this.$emit("close");
    },
  },
 
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
  box-shadow: 2px 6px 4px 6px #b17cfc
;
}
.buttonExit{
  text-align: right;
  margin-right: 5%;
}
.right {
  text-align: right;
  margin-right: 2vw;
}
#title {
  text-align: center;
}
</style>
