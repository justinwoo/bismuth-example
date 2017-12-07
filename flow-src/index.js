// @flow
import * as Main from '../output/Main';

function validateAndLog(s: string) {
  const result: Main.ValidationResult = Main.validateInput(s);

  switch (result.type) {
    case "errors":
      return Main.log(`got errors from ${s}: ${JSON.stringify(result.value)}`)();
    case "success":
      return Main.log(`success: ${result.value}`)();
  }
}


const num = Main.add2(12);
Main.log(num.toString())();
validateAndLog("I did it.");
validateAndLog("I did it");
validateAndLog("");
validateAndLog("did");

// output:
// > node dist/index.js
//
// 14
// success: I did it.
// got errors from I did it: ["didn't end with '.'"]
// got errors from : ["didn't start with 'I'","didn't contain 'did'","didn't end with '.'"]
// got errors from did: ["didn't start with 'I'","didn't end with '.'"]

// correctly errors:
// Main.add2('sdf');
// Main.log(123)();
// Main.validateInput(123);
