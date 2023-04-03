<template>
  <div>
    <div class="context">
      <div class="flex items-center justify-center my-4">
        <div class="px-auto my-auto ">
          <div class="card w-96 shadow-xl mt-12 ">
            <div class="card-body bg-base-300">
              <h2 class="card-title">Login</h2>
              <span v-if="auth && auth.auth">
                <div v-if="auth.auth.erro"
                  class="my-1 block text-sm text-gray-300 text-center bg-yellow-800 border border-yellow-900 h-8 items-center p-2 rounded-lg"
                  role="alert">{{ auth.auth.erro }}</div>
                <div v-if="auth.checkStateToken()"
                  class="my-1 block text-sm text-gray-300 text-center bg-green-800 border border-green-900 h-8 items-center p-2 rounded-sm"
                  role="alert">Logado com sucesso!</div>
              </span>

              <form class="form-control">
                <label class="block">
                  <input id="email" v-model="auth.fields.email" type="email"
                    class="input input-sm w-full max-w-xs input-bordered" placeholder="Email" />
                </label>
                <label class="block mt-2">
                  <input id="password" v-model="auth.fields.password" type="password"
                    class="input input-sm w-full max-w-xs input-bordered" placeholder="Senha" autocomplete="on" />
                </label>
              </form>
              <div class="mt-2 border-t"></div>
              <div class="flex justify-between items-center mt-4">
                <div class="w-1/2">
                  <label class>
                    <span class="text-gray-100 text-sm">Esqueci a senha</span>
                  </label>
                </div>
                <div class="w-1/2">
                  <button class="w-full py-2 px-4  rounded-md btn btn-sm btn-primary" @click="logar()">LOGAR</button>
                </div>
              </div>

              <div class="">
                <div class="social-auth-links text-center my-3">

                  <!-- <div class="flex justify-between">
                <div class="w-1/2 text-left">
                  <a
                    href="#"
                    class="w-full bg-blue-800 hover:bg-blue-700 text-white font-bold py-1 px-2 m-1 rounded"
                  >
                    <i class="fab fa-facebook"></i>Facebook
                  </a>
                </div>
                <div class="w-1/2 text-right">
                  <a
                    href="#"
                    class="w-full bg-orange-800 hover:bg-orange-700 text-white font-bold py-1 px-2 m-1 rounded"
                  >
                    <i class="fab fa-google-plus"></i>Google+
                  </a>
                </div>
              </div> -->
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
    <LogoToPages></LogoToPages>

  </div>
</template>
<script setup lang="ts">
import useStore from "../../helpers/stores/store"
import { onMounted, inject, reactive } from "vue";
import LogoToPages from "../../components/logoToPages.vue";

let {auth, router, acl} = useStore()

  function redirectPageTo(url:string){ 
    router.push({ path: url })              
  }
  function logar(){
    auth.Login().then(async (res:boolean)=>{
         if(res){
          await acl.getUserAcl().then(() => {
          acl.generateRoutesEnableWithUserAcls();
        }).then(()=>{
          redirectPageTo("/financeiro")
        });
         }
      })
  }
  onMounted(() => {
    document.addEventListener('keyup', function (event) {
      if (event.key == "Enter") {
        logar();
      }
    });
  })


</script>