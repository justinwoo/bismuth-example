# bismuth-example

An example usage of [PureScript-Bismuth](https://github.com/justinwoo/purescript-bismuth) but without any fancy setups. There are many ways in which you could do anything like

* Use PureScript DCE output (if you really care)
* Use [purs-loader](https://github.com/ethul/purs-loader)
* or whatever

This setup uses Parcel to instantly rebuild on any changes in the Flow sources and the output directory, which will be rebuilt by psc-ide whenever you change files in PureScript using an editor plugin that uses psc-ide. On my machine, changes performed by psc-ide take 120ms to be rebuild by Parcel.

See [this branch](https://github.com/justinwoo/bismuth-example/tree/webpack) for the webpack version.
