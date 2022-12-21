const baseConfig = require('@eclipse-scout/cli/scripts/webpack-defaults');

module.exports = (env, args) => {
  args.resDirArray = ['src/main/resources/WebContent', 'node_modules/@eclipse-scout/core/res'];
  const config = baseConfig(env, args);

  config.entry = {
    'dungeonmaster': './src/main/js/dungeonmaster.js',
    'login': './src/main/js/login.js',
    'logout': './src/main/js/logout.js',
    'dungeonmaster-theme': './src/main/js/dungeonmaster-theme.less',
    'dungeonmaster-theme-dark': './src/main/js/dungeonmaster-theme-dark.less'
  };

  return config;
};
