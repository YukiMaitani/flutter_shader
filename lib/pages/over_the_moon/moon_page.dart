import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class MoonPage extends StatelessWidget {
  const MoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: moonPage,
      shaderDir: overTheMoonDir,
      needTime: true,
      needGesture: true,
    );
  }
}