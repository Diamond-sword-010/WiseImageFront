<template>
  <div>
    <div class="card" :data-color="color" style="width: 18rem">
      <div class="card-body">
        <img src="@/assets/pin.png" />

        <h5 class="card-title">{{ title }}</h5>
        <p class="card-text description">{{ content }}</p>
      </div>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "RecommendationsCard",

  data() {
    return {};
  },
  props: {
    color: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    content: {
      type: String,
      required: true,
    },
  },
});
</script>

<style scoped>
/*======== COLORS ===========*/

.card[data-color="blue"] {
  background: #b8d8d8;
}
.card[data-color="blue"] .description {
  color: #506568;
}

.card[data-color="green"] {
  background: #d5e5a3;
}
.card[data-color="green"] .description {
  color: #60773d;
}
.card[data-color="green"] .category {
  color: #92ac56;
}

.card[data-color="yellow"] {
  background: #ffe28c;
}
.card[data-color="yellow"] .description {
  color: #b25825;
}
.card[data-color="yellow"] .category {
  color: #d88715;
}

.card[data-color="brown"] {
  background: #d6c1ab;
}
.card[data-color="brown"] .description {
  color: #75442e;
}
.card[data-color="brown"] .category {
  color: #a47e65;
}

.card[data-color="purple"] {
  background: #baa9ba;
}
.card[data-color="purple"] .description {
  color: #3a283d;
}
.card[data-color="purple"] .category {
  color: #5a283d;
}

.card[data-color="orange"] {
  background: #ff8f5e;
}
.card[data-color="orange"] .description {
  color: #772510;
}
.card[data-color="orange"] .category {
  color: #e95e37;
}

img {
  width: 4vw;
  /* margin-left: 42%;
    margin-top: 2%;
    margin-bottom: -15%;  */
}
</style>
