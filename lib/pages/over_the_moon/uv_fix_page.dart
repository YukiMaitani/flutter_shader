import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class UvFixPage extends StatelessWidget {
  const UvFixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(name: uvFixPage, shaderDir: overTheMoonDir,);
  }
}
