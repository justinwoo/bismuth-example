var path = require("path");

// this is a really lazy setup
// if you want fancy, maybe try https://github.com/ethul/purs-loader
// or use purs optimized builds in some way

module.exports = {
  entry: ["./flow-src/index.js"],
  output: {
    path: __dirname + "/dist",
    filename: "index.js"
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: "babel-loader",
        query: {
          presets: ["react-native"]
        },
        exclude: /node_modules/
      }
    ]
  }
};
