// @flow
const Main = require('../output/Main');

const num = Main.add2(12);
Main.log(num.toString())();

// correctly errors:
// Main.add2('sdf');
// Main.log(123)();
