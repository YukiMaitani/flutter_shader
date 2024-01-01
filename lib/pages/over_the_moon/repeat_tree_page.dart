import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class RepeatTreePage extends StatelessWidget {
  const RepeatTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(name: repeatTreePage, shaderDir: overTheMoonDir,);
  }
}
