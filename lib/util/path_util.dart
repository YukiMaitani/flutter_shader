import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/pages/home_page.dart';
import 'package:flutter_shader/pages/cross_fading_page.dart';
import 'package:flutter_shader/pages/nega_posi_reverse_page.dart';
import 'package:flutter_shader/pages/show_image_page.dart';

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
    default:
      throw Exception('Unknown name: $name');
  }
}

const String homePage = 'Home';
const String showImagePage = 'ShowImage';
const String negaPosiReversePage = 'NegaPosiReverse';
const String imageTransitionPage = 'CrossFading';

const String imageDir = 'assets/';
const String dashImage = '${imageDir}dash.jpg';
const String flutterLogoImage = '${imageDir}flutter_logo.png';

const shaderDir = 'shaders/';
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