HTML_PAGE = page.html
BUNDLED = bundle.js

OUTDIR = output
JS_OUTDIR = $(OUTDIR)/js
PAGE_PATH = $(OUTDIR)/$(HTML_PAGE)

PYRET_OUTPUT = compiled/

ANCHOR_COMPILER = "../pyret-lang/build/phaseA/pyret.jarr"
ANCHOR_RUNTIME = "../pyret-lang/build/runtime"

SERVER = http://localhost:$(PORT)
PORT = 8080

BROWSER = firefox

MAIN = src/main.arr
OUT_MAIN = compiled/project/src/main.arr.js

run: build
	$(BROWSER) $(SERVER)/$(HTML_PAGE)

.PHONY: server
server:
	http-server $(OUTDIR)

build: setup pyret
	browserify "$(OUT_MAIN)" -o $(JS_OUTDIR)/$(BUNDLED)

pyret:
	node $(ANCHOR_COMPILER) --type-check true --builtin-js-dir $(ANCHOR_RUNTIME)  --build-runnable $(MAIN)

setup:
	mkdir -p $(OUTDIR)
	cp $(HTML_PAGE) $(OUTDIR)/$(HTMLPAGE)

.PHONY: clean
clean:
	rm -r $(OUTDIR)
	rm -r $(PYRET_OUTPUT)
