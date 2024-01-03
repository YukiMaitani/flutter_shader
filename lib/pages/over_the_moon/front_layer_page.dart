import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class FrontLayerPage extends StatelessWidget {
  const FrontLayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: frontLayerPage,
      shaderDir: overTheMoonDir,
      needTime: true,
      needGesture: true,
    );
  }
}