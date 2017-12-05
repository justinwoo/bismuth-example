// @flow
const Main = require('../output/Main');

import * as GeneratedTypes from './GeneratedTypes';

const main: {
  add2: GeneratedTypes.add2
} = Main

declare module '../output/Main' {
  declare var add2: GeneratedTypes.add2
}

const num = main.add2(12);
console.log('number: ', num);

// correctly errors:
// main.add2('sdf');
