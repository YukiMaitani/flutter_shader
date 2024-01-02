import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class FlatGroundPage extends StatelessWidget {
  const FlatGroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: flatGroundPage,
      shaderDir: overTheMoonDir,
      needTime: true,
    );
  }
}
