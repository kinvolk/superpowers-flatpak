all:
	cd core && npm run build
	cd app && git apply ../*.patch && npm run build

install:
	./install

.PHONY: all install
