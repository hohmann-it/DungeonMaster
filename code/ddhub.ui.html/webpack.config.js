const baseConfig = require('@eclipse-scout/cli/scripts/webpack-defaults');

module.exports = (env, args) => {
  args.resDirArray = ['src/main/resources/WebContent', 'node_modules/@eclipse-scout/core/res'];
  const config = baseConfig(env, args);

  config.entry = {
    'ddhub': './src/main/js/ddhub.js',
    'login': './src/main/js/login.js',
    'logout': './src/main/js/logout.js',
    'ddhub-theme': './src/main/js/ddhub-theme.less',
    'ddhub-theme-dark': './src/main/js/ddhub-theme-dark.less'
  };

  return config;
};
