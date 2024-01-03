import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class MotionParallaxPage extends StatelessWidget {
  const MotionParallaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: motionParallaxPage,
      shaderDir: overTheMoonDir,
      needTime: true,
    );
  }
}