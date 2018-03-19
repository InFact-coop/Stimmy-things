const path = require('path');

module.exports = [
  {
    entry: './src/js/index.js',
    output: {
      filename: 'bundle.js',
      path: path.resolve(__dirname, 'public')
    },
    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader: 'elm-webpack-loader',
          options: {
            debug: true,
            warn: true
          }
        }
      ]
    },
    devtool: 'eval',
    devServer: {
      overlay: true
    }
  },
  {
    entry: './tests/front-end/qunit.js',
    output: {
      filename: 'test-bundle.js',
      path: path.resolve(__dirname, 'tests', 'front-end')
    }
  }
];
