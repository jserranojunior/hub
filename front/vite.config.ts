import vue from "@vitejs/plugin-vue";
/* import envCompatible from 'vite-plugin-env-compatible'
 */
/* import ElementPlus from "unplugin-element-plus/vite"; */
/*   import zhCn from 'element-plus/dist/locale/pt-br.mjs'
 */
export default ({ command }) => {
  if (command === "serve") {
    return {
      plugins: [
        vue(),
        /*         envCompatible(),
         */
      ],
      resolve: {
        alias: [{ find: "@", replacement: "/src" }],
      },
      server: {
        host: true,
        port: 3000,
        hmr: { clientPort: 80 },
      },
    };
  } else if (command === "build") {
    return {
      plugins: [
        vue(),
        /*         envCompatible(),
         */
      ],
      resolve: {
        alias: [{ find: "@", replacement: "/src" }],
      },
      server: {
        host: "0.0.0.0",
        port: 5000,
        https: true,
        hmr: { host: "https://sefro.alvitre.com.br", port: 443 },
      },
      build: {
        target: "esnext",
        chunkSizeWarningLimit: 2000,
      },
    };
  } else if (command === "testbuild") {
    return {
      plugins: [
        vue(),
        /*         envCompatible(),
         */
      ],
      resolve: {
        alias: [{ find: "@", replacement: "/src" }],
      },
      server: {
        host: "0.0.0.0",
        port: 5000,
        https: true,
        hmr: { host: "http://frontsefro.localhost", port: 443 },
      },
      build: {
        target: "esnext",
        chunkSizeWarningLimit: 2000,
      },
    };
  }
};
