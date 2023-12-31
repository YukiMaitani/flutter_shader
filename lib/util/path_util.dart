import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/pages/home_page.dart';
import 'package:flutter_shader/pages/cross_fading_page.dart';
import 'package:flutter_shader/pages/nega_posi_reverse_page.dart';
import 'package:flutter_shader/pages/show_image_page.dart';

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
// INSERT IMPORT MOON HERE

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
    case overTheMoonPage:
      return const OverTheMoonPage();
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
    // INSERT PAGE HERE
    default:
      throw Exception('Unknown name: $name');
  }
}

const String homePage = 'Home';
const String showImagePage = 'ShowImage';
const String negaPosiReversePage = 'NegaPosiReverse';
const String imageTransitionPage = 'CrossFading';
const String overTheMoonPage = 'OverTheMoon';
const String vectorLinePage = 'VectorLine';
const String crossLinePage = 'CrossLine';
const String topWhitePage = 'TopWhite';
const String whiteLinePage = 'WhiteLine';
const String whiteBoxPage = 'WhiteBox';
const String trapeziumPage = 'Trapezium';
const String trunkPage = 'Trunk';
const String treePage = 'Tree';
const String treeFunctionPage = 'TreeFunction';
// INSERT PAGE NAME HERE

const String imageDir = 'assets/';
const String dashImage = '${imageDir}dash.jpg';
const String flutterLogoImage = '${imageDir}flutter_logo.png';

const shaderDir = 'shaders/';
const overTheMoonDir = 'over_the_moon/';
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