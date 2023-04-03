const routes = [
  {
    path: "/",
    component: () => import("../pages/IndexPage.vue"),
  },
  {
    path: "/login",
    component: () => import("../pages/LoginPage.vue"),
  },
  {
    path: "/cadastro",
    component: () => import("../pages/RegisterPage.vue"),
  },
  {
    path: "/financeiro",
    component: () => import("../pages/Financeiro.vue"),
  },
  {
    path: "/:catchAll(.*)*",
    component: () => import("../pages/ErrorNotFound.vue"),
  },
];

export default routes;
