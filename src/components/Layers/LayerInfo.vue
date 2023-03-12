<template>
    <b-container class="layer-info">
        <b-row class="py-2">
          <b-col>
            <img :src="imageUrl" class="image"/>
          </b-col>
        </b-row>
        <b-row>
          <b-col>
            {{ title }}
          </b-col>
        </b-row>
    </b-container>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'LayerInfo',
  
  data() {
    return {
      isHidden: false
    }
  },

  props: {
    title: {
        type: String,
        required: true
    },

    imageUrl: {
        type: String,
        required: true
    },
  }
})
</script>

<style>
  .image {
    height: 3.5em
  }

  .card {
    width: auto;
  }

  .layer-info { 
    cursor: pointer; 

  }
  
</style>