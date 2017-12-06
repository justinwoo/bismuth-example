// @flow
declare module "../output/Main" {
  declare module.exports: {
    add2: (a: number) => number,
    log: (a: string) => () => any
  };
}
