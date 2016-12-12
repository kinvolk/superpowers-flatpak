all:
	cd core && npm run build
	cd app && git apply ../0001-Add-data-path-parameter.patch && npm run build

install:
	./install

.PHONY: all install
