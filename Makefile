DEST=./build
JADE=./node_modules/.bin/jade
STYLUS=./node_modules/.bin/stylus
STATIC=./node_modules/.bin/static
PORT=3000

all: css jade images

before:
	@ mkdir -p $(DEST)

clean:
	@ rm -rf $(DEST)

css: before
	@ cp node_modules/purecss/build/pure-min.css $(DEST)/index.css
	@ $(STYLUS) -c -p src/index.styl >> $(DEST)/index.css

jade: before
	@ $(JADE) src/*.jade --out $(DEST)

images: before
	@ rm -rf $(DEST)/images
	@ cp -r src/images $(DEST)/images

serve:
	@$(STATIC) -p $(PORT) $(DEST)

.PHONY: before css jade images serve
