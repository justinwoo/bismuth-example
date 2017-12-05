# bismuth-example

An example usage of [PureScript-Bismuth](https://github.com/justinwoo/purescript-bismuth) but without any fancy setups. There are many ways in which you could do anything like

* Use PureScript DCE output (if you really care)
* Use [purs-loader](https://github.com/ethul/purs-loader)
* or whatever

This lazy setup will work with webpack watch and psc-ide will instantly rebuild you outputs and let webpack pick up the changes though, so you might find this lazy setup for dev / more optimized build for prod might be suitable for you. This is Webpack after all though, and sky's the limit on whatever the hell you choose to do.
