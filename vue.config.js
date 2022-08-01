function enableShadowCss(config) {
  const configs = [
    config.module.rule("vue").use("vue-loader"),
    config.module.rule("css").oneOf("vue-modules").use("vue-style-loader"),
    config.module.rule("css").oneOf("vue").use("vue-style-loader"),
    config.module.rule("css").oneOf("normal-modules").use("vue-style-loader"),
    config.module.rule("css").oneOf("normal").use("vue-style-loader"),
  ];
  configs.forEach((c) =>
    c.tap((options) => {
      options.shadowMode = true;
      return options;
    })
  );
}

const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: true,
  chainWebpack: (config) => {
    if (process.env.NODE_ENV === "development") {
      enableShadowCss(config);
    }
  },
});
