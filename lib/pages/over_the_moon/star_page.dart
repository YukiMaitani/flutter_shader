import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class StarPage extends StatelessWidget {
  const StarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: starPage,
      shaderDir: overTheMoonDir,
      needTime: true,
      needGesture: true,
    );
  }
}