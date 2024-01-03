import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/pages/home_page.dart';
import 'package:flutter_shader/pages/cross_fading_page.dart';
import 'package:flutter_shader/pages/nega_posi_reverse_page.dart';
import 'package:flutter_shader/pages/show_image_page.dart';
import '../pages/pixel_spirit_deck/pixel_spirit_deck_page.dart';
import '../pages/uv_page.dart';
// IMPORT SHADER

import '../pages/over_the_moon/cross_line_page.dart';
import '../pages/over_the_moon/over_the_moon_page.dart';
import '../pages/over_the_moon/vector_line_page.dart';
import '../pages/over_the_moon/top_white_page.dart';
import '../pages/over_the_moon/white_line_page.dart';
import '../pages/over_the_moon/white_box_page.dart';
import '../pages/over_the_moon/trapezium_page.dart';
import '../pages/over_the_moon/trunk_page.dart';
import '../pages/over_the_moon/tree_page.dart';
import '../pages/over_the_moon/tree_function_page.dart';
import '../pages/over_the_moon/shadow_page.dart';
import '../pages/over_the_moon/uv_fix_page.dart';
import '../pages/over_the_moon/shadow_fix_page.dart';
import '../pages/over_the_moon/repeat_tree_page.dart';
import '../pages/over_the_moon/random_place_page.dart';
import '../pages/over_the_moon/move_in_time_page.dart';
import '../pages/over_the_moon/random_size_page.dart';
import '../pages/over_the_moon/flat_ground_page.dart';
import '../pages/over_the_moon/gentle_ground_page.dart';
import '../pages/over_the_moon/stragiht_tree_page.dart';
import '../pages/over_the_moon/multiple_layer_page.dart';
import '../pages/over_the_moon/motion_parallax_page.dart';
import '../pages/over_the_moon/follow_drag_page.dart';
import '../pages/over_the_moon/atmospheric_perspective_page.dart';
// IMPORT MOON

import '../pages/pixel_spirit_deck/justice_page.dart';
import '../pages/pixel_spirit_deck/strength_page.dart';
import '../pages/pixel_spirit_deck/death_page.dart';
// IMPORT SPIRIT

Widget getPage(String name) {
  switch (name) {
    case homePage:
      return const HomePage();
    case showImagePage:
      return const ShowImagePage();
    case negaPosiReversePage:
      return const NegaPosiReversePage();
    case imageTransitionPage:
      return const CrossFadingPage();
    case uvPage:
      return const UvPage();
    case overTheMoonPage:
      return const OverTheMoonPage();
    case pixelSpiritDeckPage:
      return const PixelSpiritDeckPage();
    // PAGE SHADER
    case vectorLinePage:
      return const VectorLinePage();
    case crossLinePage:
      return const CrossLinePage();
    case topWhitePage:
      return const TopWhitePage();
    case whiteLinePage:
      return const WhiteLinePage();
    case whiteBoxPage:
      return const WhiteBoxPage();
    case trapeziumPage:
      return const TrapeziumPage();
    case trunkPage:
      return const TrunkPage();
    case treePage:
      return const TreePage();
    case treeFunctionPage:
      return const TreeFunctionPage();
    case shadowPage:
      return const ShadowPage();
    case uvFixPage:
      return const UvFixPage();
    case shadowFixPage:
      return const ShadowFixPage();
    case repeatTreePage:
      return const RepeatTreePage();
    case randomPlacePage:
      return const RandomPlacePage();
    case moveInTimePage:
      return const MoveInTimePage();
    case randomSizePage:
      return const RandomSizePage();
    case flatGroundPage:
      return const FlatGroundPage();
    case gentleGroundPage:
      return const GentleGroundPage();
    case stragihtTreePage:
      return const StragihtTreePage();
    case multipleLayerPage:
      return const MultipleLayerPage();
    case motionParallaxPage:
      return const MotionParallaxPage();
    case followDragPage:
      return const FollowDragPage();
    case atmosphericPerspectivePage:
      return const AtmosphericPerspectivePage();
    // PAGE MOON

    case justicePage:
      return const JusticePage();
    case strengthPage:
      return const StrengthPage();
    case deathPage:
      return const DeathPage();
    // PAGE SPIRIT
    default:
      throw Exception('Unknown name: $name');
  }
}

const String homePage = 'Home';
const String showImagePage = 'ShowImage';
const String negaPosiReversePage = 'NegaPosiReverse';
const String imageTransitionPage = 'CrossFading';
const String overTheMoonPage = 'OverTheMoon';
const String uvPage = 'Uv';
const String pixelSpiritDeckPage = 'PixelSpiritDeck';
// NAME SHADER

const String vectorLinePage = 'VectorLine';
const String crossLinePage = 'CrossLine';
const String topWhitePage = 'TopWhite';
const String whiteLinePage = 'WhiteLine';
const String whiteBoxPage = 'WhiteBox';
const String trapeziumPage = 'Trapezium';
const String trunkPage = 'Trunk';
const String treePage = 'Tree';
const String treeFunctionPage = 'TreeFunction';
const String shadowPage = 'Shadow';
const String uvFixPage = 'UvFix';
const String shadowFixPage = 'ShadowFix';
const String repeatTreePage = 'RepeatTree';
const String randomPlacePage = 'RandomPlace';
const String moveInTimePage = 'MoveInTime';
const String randomSizePage = 'RandomSize';
const String flatGroundPage = 'FlatGround';
const String gentleGroundPage = 'GentleGround';
const String stragihtTreePage = 'StragihtTree';
const String multipleLayerPage = 'MultipleLayer';
const String motionParallaxPage = 'MotionParallax';
const String followDragPage = 'FollowDrag';
const String atmosphericPerspectivePage = 'AtmosphericPerspective';
// NAME MOON

const String justicePage = 'Justice';
const String strengthPage = 'Strength';
const String deathPage = 'Death';
// NAME SPIRIT

const String imageDir = 'assets/';
const String dashImage = '${imageDir}dash.jpg';
const String flutterLogoImage = '${imageDir}flutter_logo.png';

const shaderDir = 'shaders/';
const overTheMoonDir = 'over_the_moon/';
const pixelSpiritDeckDir = 'pixel_spirit_deck/';

extension StringEx on String {
  String toSnakeCase() {
    return replaceAllMapped(RegExp('(.)([A-Z][a-z]+)'),
            (Match match) => '${match[1]}_${match[2]}')
        .replaceAllMapped(RegExp('([a-z0-9])([A-Z])'),
            (Match match) => '${match[1]}_${match[2]}')
        .toLowerCase();
  }
}

String getShaderPath(String name) => '$shaderDir${name.toSnakeCase()}.frag';
String getNestShaderPath(String name, String dir) => '$shaderDir$dir${name.toSnakeCase()}.frag';