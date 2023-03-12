<template dir="rtl">
  <div class="text-light">
    <h4 class="font-weight-bold">
      <bdi>מערכת {{ systemName }} | {{ systemStatus }}</bdi>
    </h4>
    <h6>{{ formattedDate }}</h6>
  </div>
</template>

<script lang="ts">
import moment from "moment";
import { defineComponent } from "vue";

export default defineComponent({
  name: "SystemInfo",

  props: {
    date: {
      type: Number,
      required: true,
    },

    systemName: {
      type: String,
      required: true,
    },

    isEmergency: {
      type: Boolean,
      required: true,
    },
  },

  computed: {
    formattedDate(): String {
      return moment(new Date(this.date).toString())
        .locale("he")
        .format("dddd, D [ב]MMMM YYYY");
    },

    systemStatus(): String {
      if (this.isEmergency) {
        return "חירום";
      }

      return "שגרה";
    },
  },
});
</script>

<style>
h6 {
  margin-left: 35%;
}
</style>
