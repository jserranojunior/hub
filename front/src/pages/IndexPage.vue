<template>
  <div class="bg-sefro-gradiente" > 
  <efectCircles>
  <template #body>
    <div class="centered ">
      <div class="flex justify-center">
      <div class="w-full mx-4 md:mx-0 md:w-1/2">
      <img src="../assets/logo.png" class="mx-auto"/>
      </div>
      </div>
    </div>
     </template> 
    </efectCircles>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import efectCircles from "../components/efectCircles.vue"

const msg = ref(`Bem vindo ao futuro!`);
</script >