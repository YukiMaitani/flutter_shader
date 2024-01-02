import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class JusticePage extends StatelessWidget {
  const JusticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: justicePage,
      shaderDir: pixelSpiritDeckDir,
      needTime: true,
    );
  }
}