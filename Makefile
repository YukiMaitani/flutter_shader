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
TEMPLATE_NEST_PAGE_PATH = template/nest_page.dart
TEMPLATE_SHADER_PAGE_PATH = template/shader_page.dart
TEMPLATE_SHADER_PATH = template/shader.frag

## project
PUBSPEC_YAML_PATH = pubspec.yaml
PATH_UTIL_PATH = lib/util/path_util.dart
PAGES_DIR = lib/pages/
SHADER_HOME_PATH = lib/pages/home_page.dart

c:
	$(call SET_CASES)
	$(eval SHADER_PATH = shaders/$(SNAKE_CASE).frag)
	$(eval PAGE_PATH = $(PAGES_DIR)$(SNAKE_CASE_PAGE).dart)
	$(eval KEYWORD = SHADER)

	cp $(TEMPLATE_SHADER_PATH) $(SHADER_PATH)
	cp $(TEMPLATE_SHADER_PAGE_PATH) $(PAGE_PATH)

	gsed -i "/# $(KEYWORD)/i \    - $(SHADER_PATH)" $(PUBSPEC_YAML_PATH)
	gsed -i "/\/\/ IMPORT $(KEYWORD)/i \import '../pages/$(SNAKE_CASE_PAGE).dart';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ PAGE $(KEYWORD)/i \    case $(CAMEL_CASE_PAGE):\n      return const $(UPPER_CAMEL_CASE_PAGE)();" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ NAME $(KEYWORD)/i \const String $(CAMEL_CASE_PAGE) = '$(UPPER_CAMEL_CASE)';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ TILE/i \        _buildListTile($(CAMEL_CASE_PAGE))," $(SHADER_HOME_PATH)

	gsed -i 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/templateTpl/$(CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/template_tpl/$(SNAKE_CASE)/g' $(PAGE_PATH)

cm:
	$(call SET_CASES)
	$(eval DIR_SNAKE_CASE = over_the_moon)
	$(eval DIR_CAMEL_CASE = overTheMoon)
	$(eval SHADER_PATH = shaders/$(DIR_SNAKE_CASE)/$(SNAKE_CASE).frag)
	$(eval PAGE_PATH = $(PAGES_DIR)$(DIR_SNAKE_CASE)/$(SNAKE_CASE_PAGE).dart)
	$(eval KEYWORD = MOON)

	cp $(TEMPLATE_SHADER_PATH) $(SHADER_PATH)
	cp $(TEMPLATE_NEST_PAGE_PATH) $(PAGE_PATH)

	gsed -i "/# $(KEYWORD)/i \    - $(SHADER_PATH)" $(PUBSPEC_YAML_PATH)
	gsed -i "/\/\/ IMPORT $(KEYWORD)/i \import '../pages/$(DIR_SNAKE_CASE)/$(SNAKE_CASE_PAGE).dart';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ PAGE $(KEYWORD)/i \    case $(CAMEL_CASE_PAGE):\n      return const $(UPPER_CAMEL_CASE_PAGE)();" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ NAME $(KEYWORD)/i \const String $(CAMEL_CASE_PAGE) = '$(UPPER_CAMEL_CASE)';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ TILE/i \        _buildListTile($(CAMEL_CASE_PAGE))," $(PAGES_DIR)$(DIR_SNAKE_CASE)/$(DIR_SNAKE_CASE)_page.dart

	gsed -i 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/templateTpl/$(CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/template_tpl/$(SNAKE_CASE)/g' $(PAGE_PATH)
	gsed -i 's/\/\/ DIR/$(DIR_CAMEL_CASE)Dir/g' $(PAGE_PATH)

cs:
	$(call SET_CASES)
	$(eval DIR_SNAKE_CASE = pixel_spirit_deck)
	$(eval DIR_CAMEL_CASE = pixelSpiritDeck)
	$(eval SHADER_PATH = shaders/$(DIR_SNAKE_CASE)/$(SNAKE_CASE).frag)
	$(eval PAGE_PATH = $(PAGES_DIR)$(DIR_SNAKE_CASE)/$(SNAKE_CASE_PAGE).dart)
	$(eval KEYWORD = SPIRIT)

	cp $(TEMPLATE_SHADER_PATH) $(SHADER_PATH)
	cp $(TEMPLATE_NEST_PAGE_PATH) $(PAGE_PATH)

	gsed -i "/# $(KEYWORD)/i \    - $(SHADER_PATH)" $(PUBSPEC_YAML_PATH)
	gsed -i "/\/\/ IMPORT $(KEYWORD)/i \import '../pages/$(DIR_SNAKE_CASE)/$(SNAKE_CASE_PAGE).dart';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ PAGE $(KEYWORD)/i \    case $(CAMEL_CASE_PAGE):\n      return const $(UPPER_CAMEL_CASE_PAGE)();" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ NAME $(KEYWORD)/i \const String $(CAMEL_CASE_PAGE) = '$(UPPER_CAMEL_CASE)';" $(PATH_UTIL_PATH)
	gsed -i "/\/\/ TILE/i \        _buildListTile($(CAMEL_CASE_PAGE))," $(PAGES_DIR)$(DIR_SNAKE_CASE)/$(DIR_SNAKE_CASE)_page.dart

	gsed -i 's/TemplateTpl/$(UPPER_CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/templateTpl/$(CAMEL_CASE)/g' $(PAGE_PATH)
	gsed -i 's/template_tpl/$(SNAKE_CASE)/g' $(PAGE_PATH)
	gsed -i 's/\/\/ DIR/$(DIR_CAMEL_CASE)Dir/g' $(PAGE_PATH)


