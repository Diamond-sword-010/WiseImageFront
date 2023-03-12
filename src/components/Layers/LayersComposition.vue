<template>
  <div class="composition">
    <b-container>
      <b-row>
        <b-col cols="1">
          <b-button
            variant="light"
            @click="showBox = !showBox"
            class="button float-left"
          >
            סינון
          </b-button>
        </b-col>
        <b-col cols="11">
          <b-card no-body v-if="showBox" class="text-center">
            <b-row v-for="(layer, index) in layers" :key="index">
              <LayerInfo
                :class="{ hidden: layer.isHidden }"
                v-on:click.native="click(layer)"
                :title="layer.title"
                :imageUrl="layer.imageUrl"
              />
            </b-row>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import LayerInfo from "@/components/Layers/LayerInfo.vue";
import Polygons from "@/assets/LayerImages/Polygons.png";
import Troops from "@/assets/LayerImages/Troops.png";
import Cameras from "@/assets/LayerImages/Cameras.png";
import Event from "@/assets/LayerImages/Event.png";

export default defineComponent({
  name: "LayerComposition",

  data() {
    return {
      layers: [
        {
          name: "htmrs",
          title: 'חטמ"רים',
          imageUrl: Polygons,
          isHidden: false,
        },
        { name: "troops", title: "כוחות", imageUrl: Troops, isHidden: false },
        {
          name: "sensors",
          title: "סנסורים",
          imageUrl: Cameras,
          isHidden: false,
        },
        { name: "events", title: "אירועים", imageUrl: Event, isHidden: false },
        // {
        //   name: "deadAreas",
        //   title: "שטחים מתים",
        //   imageUrl: Event,
        //   isHidden: false,
        // },
      ],

      showBox: false,
    };
  },

  components: {
    LayerInfo,
  },

  methods: {
    click(layer: any) {
      layer.isHidden = !layer.isHidden;

      if (layer.title === "סנסורים") {
        this.$emit("sensorsClicked");
      } else if (layer.title === "כוחות") {
        this.$emit("troopsClicked");
      } else if (layer.title === 'חטמ"רים') {
        this.$emit("htmrsClicked");
      } else if ((layer.title = "אירועים")) {
        this.$emit("eventsClickes");
      } // else if ((layer.title = "שטחים מתים")) {
      //   this.$emit("deadAreasClickes");
      // }
    },
  },
});
</script>

<style>
.composition {
  top: 10vh;
  left: 5vw;
}

.button {
  height: 5vh;
}

.hidden {
  -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
  filter: grayscale(100%);
}
</style>
