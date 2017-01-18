all:
	cd core && git apply ../core-patches/*.patch && npm run build
	cd app && git apply ../app-patches/*.patch && npm run build

install:
	./install

.PHONY: all install
