all:
	# apply patches
	cd core/systems/game && git apply ../../../game-patches/*.patch
	cd core && git apply ../core-patches/*.patch
	cd app && git apply ../app-patches/*.patch
	# build superpowers
	cd core && npm run build
	cd app && npm run build
	# cleanup some files in core that cause a failure during npm run package
	rm -f core/node_modules/.bin/{JSONStream,acorn,brfs,browser-pack,atob,deps-sort,esparse,esgenerate,esvalidate,escodegen,jade,miller-rabin,semver,sha.js,strip-bom,umd,which,user-home,cleancss,gulp,insert-module-globals,quote-stream,stylus,uglifyjs,browserify,module-deps,watchify,tslint}
	# generate packages
	cd core && npm run package
	cd core && npm run package game
	cd app && npm run package

install:
	./install

.PHONY: all install
