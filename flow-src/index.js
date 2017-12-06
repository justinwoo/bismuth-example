// @flow
const Main = require('../output/Main');

import * as GeneratedTypes from './GeneratedTypes';

const main: {
  add2: GeneratedTypes.add2,
  log: GeneratedTypes.log
} = Main

const num = main.add2(12);
main.log(num.toString())();

// correctly errors:
// main.add2('sdf');
