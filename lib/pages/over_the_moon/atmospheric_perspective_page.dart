import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class AtmosphericPerspectivePage extends StatelessWidget {
  const AtmosphericPerspectivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: atmosphericPerspectivePage,
      shaderDir: overTheMoonDir,
      needTime: true,
      needGesture: true,
    );
  }
}