// @flow
declare module "../output/Main" {
  declare type ValidationResult =
    | { type: "errors", value: string[] }
    | { type: "success", value: string };

  declare module.exports: {
    add2: (a: number) => number,
    log: (a: string) => () => any,
    validateInput: (
      a: string
    ) =>
      | { type: "errors", value: string[] }
      | { type: "success", value: string }
  };
}
