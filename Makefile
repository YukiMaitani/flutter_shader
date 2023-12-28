APP_NAME = $(shell grep "^name:" pubspec.yaml | cut -d' ' -f2)
define SET_CASES
	$(eval SNAKE_CASE=$(n))
	$(eval CAMEL_CASE=$(shell echo $(SNAKE_CASE) | awk -F_ 'BEGIN{OFS="";} {for(i=1;i<=NF;i++) $$i=(i==1?tolower(substr($$i,1,1)):toupper(substr($$i,1,1))) tolower(substr($$i,2));}1'))
	$(eval UPPER_CAMEL_CASE=$(shell echo $(CAMEL_CASE) | awk '{print toupper(substr($$0,1,1)) substr($$0,2)}'))
	$(eval SNAKE_CASE_PAGE = $(SNAKE_CASE)_page)
	$(eval CAMEL_CASE_PAGE = $(CAMEL_CASE)Page)
	$(eval UPPER_CAMEL_CASE_PAGE = $(UPPER_CAMEL_CASE)Page)
endef

## template
TEMPLATE_MOON_PAGE_PATH = template/moon_page.dart
TEMPLATE_SHADER_PATH = template/shader.frag

## project
PUBSPEC_YAML_PATH = pubspec.yaml
PATH_UTIL_PATH = lib/util/path_util.dart
PAGES_DIR = lib/pages/
MOON_HOME_PATH = lib/pages/over_the_moon/over_the_moon_page.dart

cm:
	$(call SET_CASES)
	$(eval SHADER_PATH = shaders/over_the_moon/$(SNAKE_CASE).frag)
	$(eval PAGE_PATH = $(PAGES_DIR)over_the_moon/$(SNAKE_CASE_PAGE).dart)

	cp $(TEMPLATE_SHADER_PATH) $(SHADER_PATH)
	cp $(TEMPLATE_MOON_PAGE_PATH) $(PAGE_PATH)

	gsed -i "/# INSERT SHADER HERE/i \    - $(SHADER_PATH)" $(PUBSPEC_YAML_PATH)
	gsed -i "/\/\/ INSERT IMPORT MOON HERE/i \import '../pages/over_the_moon/$(SNAKE_CASE_PAGE).dart';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ INSERT PAGE HERE/i \    case $(CAMEL_CASE_PAGE):\n      return const $(UPPER_CAMEL_CASE_PAGE)();" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ INSERT PAGE NAME HERE/i \const String $(CAMEL_CASE_PAGE) = '$(UPPER_CAMEL_CASE)';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ INSERT TILE HERE/i \        _buildListTile($(CAMEL_CASE_PAGE))," $(MOON_HOME_PATH)

	gsed -i 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/templateTpl/$(CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/template_tpl/$(SNAKE_CASE)/g' $(PAGE_PATH)



