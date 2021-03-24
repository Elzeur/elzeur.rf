URL=http://www.xn--e1adlwo0d.xn--p1ai
URL_STYLES=$(URL)/styles
URL_WEBLOGS=$(URL)/weblogs
URL_PROGRAMMING=$(URL)/programming
URL_POLITICS=$(URL)/politics
URL_FINANCE=$(URL)/finance
URL_COOKING=$(URL)/cooking
URL_GODVILLE=$(URL)/godville
URL_ABOUT=$(URL)/about

BIN_DIR=C:\Programming\WebSites\www.xn--e1adlwo0d.xn--p1ai
BIN_DIR_STYLES=$(BIN_DIR)\styles
BIN_DIR_WEBLOGS=$(BIN_DIR)\weblogs
BIN_DIR_PROGRAMMING=$(BIN_DIR)\programming
BIN_DIR_POLITICS=$(BIN_DIR)\politics
BIN_DIR_FINANCE=$(BIN_DIR)\finance
BIN_DIR_COOKING=$(BIN_DIR)\cooking
BIN_DIR_GODVILLE=$(BIN_DIR)\godville
BIN_DIR_ABOUT=$(BIN_DIR)\about

OBJ_DIR=obj
OBJ_DIR_STYLES=$(OBJ_DIR)\styles
OBJ_DIR_WEBLOGS=$(OBJ_DIR)\weblogs
OBJ_DIR_PROGRAMMING=$(OBJ_DIR)\programming
OBJ_DIR_POLITICS=$(OBJ_DIR)\politics
OBJ_DIR_FINANCE=$(OBJ_DIR)\finance
OBJ_DIR_COOKING=$(OBJ_DIR)\cooking
OBJ_DIR_GODVILLE=$(OBJ_DIR)\godville
OBJ_DIR_ABOUT=$(OBJ_DIR)\about

TMP_DIR=tmp

configure:
	mkdir $(BIN_DIR)
	mkdir $(BIN_DIR_STYLES)
	mkdir $(BIN_DIR_WEBLOGS)
	mkdir $(BIN_DIR_PROGRAMMING)
	mkdir $(BIN_DIR_POLITICS)
	mkdir $(BIN_DIR_FINANCE)
	mkdir $(BIN_DIR_COOKING)
	mkdir $(BIN_DIR_GODVILLE)
	mkdir $(BIN_DIR_ABOUT)
	mkdir $(OBJ_DIR)
	mkdir $(OBJ_DIR_STYLES)
	mkdir $(OBJ_DIR_WEBLOGS)
	mkdir $(OBJ_DIR_PROGRAMMING)
	mkdir $(OBJ_DIR_POLITICS)
	mkdir $(OBJ_DIR_FINANCE)
	mkdir $(OBJ_DIR_COOKING)
	mkdir $(OBJ_DIR_ABOUT)
	mkdir $(TMP_DIR)

BINARY_TARGETS: $(BIN_DIR)\robots.txt

TEXT_TARGETS: $(BIN_DIR)\rss.rss.gz $(BIN_DIR)\rss.rss $(BIN_DIR)\sitemap.xml.gz $(BIN_DIR)\sitemap.xml $(BIN_DIR_STYLES)\styles.css.gz $(BIN_DIR_STYLES)\styles.css

GENERATED_TARGETS: $(BIN_DIR)\default.htm.gz $(BIN_DIR)\default.htm


$(BIN_DIR)\robots.txt: robots.txt
	copy /B /Y robots.txt $(BIN_DIR)\robots.txt
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/robots.txt $(BIN_DIR)\robots.txt $(MIME_TEXT_PLAIN) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR_STYLES)\line.png: styles\line.png
	copy /B /Y styles\line.png $(BIN_DIR_STYLES)\line.png
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_STYLES)/line.png $(BIN_DIR_STYLES)\line.png $(MIME_IMAGE_PNG) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(BIN_DIR)\favicon.ico: favicon.ico
	copy /B /Y favicon.ico $(BIN_DIR)\favicon.ico
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/favicon.ico $(BIN_DIR)\favicon.ico $(MIME_IMAGE_ICON) $(CREDENTIALS) $(CONTENT_LANGUAGE)


$(BIN_DIR_STYLES)\styles.css: $(OBJ_DIR_STYLES)\styles.css.txt
	copy /Y $(OBJ_DIR_STYLES)\styles.css.txt $(BIN_DIR_STYLES)\styles.css
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_STYLES)/styles.css    $(BIN_DIR_STYLES)\styles.css    $(MIME_TEXT_CSS)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_STYLES)\styles.css.txt: styles\styles.css
	$(ONELINE_UTIL_PATH) /utf-8 styles\styles.css
	move /Y styles\styles.css.txt $(OBJ_DIR_STYLES)\styles.css.txt

$(BIN_DIR_STYLES)\styles.css.gz: $(OBJ_DIR_STYLES)\styles.css.utf-8wobom.txt
	copy /Y $(OBJ_DIR_STYLES)\styles.css.utf-8wobom.txt $(TMP_DIR)\styles.css
	creategzip.cmd $(TMP_DIR) styles.css.gz styles.css
	del $(TMP_DIR)\styles.css
	move /Y $(TMP_DIR)\styles.css.gz $(BIN_DIR_STYLES)\styles.css.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL_STYLES)/styles.css.gz $(BIN_DIR_STYLES)\styles.css.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR_STYLES)\styles.css.utf-8wobom.txt: styles\styles.css
	$(ONELINE_UTIL_PATH) /utf-8wobom styles\styles.css
	move /Y styles\styles.css.utf-8wobom.txt $(OBJ_DIR_STYLES)\styles.css.utf-8wobom.txt


$(BIN_DIR)\rss.rss: $(OBJ_DIR)\rss.rss.txt
	copy /Y $(OBJ_DIR)\rss.rss.txt $(BIN_DIR)\rss.rss
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/rss.rss    $(BIN_DIR)\rss.rss    $(MIME_APPLICATION_RSSXML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\rss.rss.txt: rss.rss
	$(ONELINE_UTIL_PATH) /utf-8 rss.rss
	move /Y rss.rss.txt $(OBJ_DIR)\rss.rss.txt

$(BIN_DIR)\rss.rss.gz: $(OBJ_DIR)\rss.rss.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\rss.rss.utf-8wobom.txt $(TMP_DIR)\rss.rss
	creategzip.cmd $(TMP_DIR) rss.rss.gz rss.rss
	del $(TMP_DIR)\rss.rss
	move /Y $(TMP_DIR)\rss.rss.gz $(BIN_DIR)\rss.rss.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/rss.rss.gz $(BIN_DIR)\rss.rss.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\rss.rss.utf-8wobom.txt: rss.rss
	$(ONELINE_UTIL_PATH) /utf-8wobom rss.rss
	move /Y rss.rss.utf-8wobom.txt $(OBJ_DIR)\rss.rss.utf-8wobom.txt


$(BIN_DIR)\sitemap.xml: $(OBJ_DIR)\sitemap.xml.txt
	copy /Y $(OBJ_DIR)\sitemap.xml.txt $(BIN_DIR)\sitemap.xml
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/sitemap.xml    $(BIN_DIR)\sitemap.xml    $(MIME_APPLICATION_XML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\sitemap.xml.txt: sitemap.xml
	$(ONELINE_UTIL_PATH) /utf-8 sitemap.xml
	move /Y sitemap.xml.txt $(OBJ_DIR)\sitemap.xml.txt

$(BIN_DIR)\sitemap.xml.gz: $(OBJ_DIR)\sitemap.xml.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\sitemap.xml.utf-8wobom.txt $(TMP_DIR)\sitemap.xml
	creategzip.cmd $(TMP_DIR) sitemap.xml.gz sitemap.xml
	del $(TMP_DIR)\sitemap.xml
	move /Y $(TMP_DIR)\sitemap.xml.gz $(BIN_DIR)\sitemap.xml.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/sitemap.xml.gz $(BIN_DIR)\sitemap.xml.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\sitemap.xml.utf-8wobom.txt: sitemap.xml
	$(ONELINE_UTIL_PATH) /utf-8wobom sitemap.xml
	move /Y sitemap.xml.utf-8wobom.txt $(OBJ_DIR)\sitemap.xml.utf-8wobom.txt


$(OBJ_DIR)\default.htm: default.options.yaml templates\main.htm default.metadata.yaml default.md
	$(PANDOC_UTIL_PATH) -d default.options.yaml
	move /Y default.htm $(OBJ_DIR)\default.htm

$(BIN_DIR)\default.htm: $(OBJ_DIR)\default.htm.txt
	copy /Y $(OBJ_DIR)\default.htm.txt $(BIN_DIR)\default.htm
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/default.htm    $(BIN_DIR)\default.htm    $(MIME_TEXT_HTML)         $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\default.htm.txt: $(OBJ_DIR)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8 $(OBJ_DIR)\default.htm

$(BIN_DIR)\default.htm.gz: $(OBJ_DIR)\default.htm.utf-8wobom.txt
	copy /Y $(OBJ_DIR)\default.htm.utf-8wobom.txt $(TMP_DIR)\default.htm
	creategzip.cmd $(TMP_DIR) default.htm.gz default.htm
	del $(TMP_DIR)\default.htm
	move /Y $(TMP_DIR)\default.htm.gz $(BIN_DIR)\default.htm.gz
	$(HTTPPUT_UTIL_PATH) $(IP_BIND_ADDRESS) $(URL)/default.htm.gz $(BIN_DIR)\default.htm.gz $(MIME_APPLICATION_GZIP) $(CREDENTIALS) $(CONTENT_LANGUAGE)

$(OBJ_DIR)\default.htm.utf-8wobom.txt: $(OBJ_DIR)\default.htm
	$(ONELINE_UTIL_PATH) /utf-8wobom $(OBJ_DIR)\default.htm


