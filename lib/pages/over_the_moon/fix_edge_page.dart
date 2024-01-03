import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class FixEdgePage extends StatelessWidget {
  const FixEdgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: fixEdgePage,
      shaderDir: overTheMoonDir,
      needTime: true,
      needGesture: true,
    );
  }
}