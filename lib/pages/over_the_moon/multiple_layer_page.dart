import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class MultipleLayerPage extends StatelessWidget {
  const MultipleLayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: multipleLayerPage,
      shaderDir: overTheMoonDir,
      needTime: true,
    );
  }
}