import 'package:flutter/cupertino.dart';

import '../../common/base_page.dart';
import '../../util/path_util.dart';

class CrossLinePage extends StatelessWidget {
  const CrossLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  BasePage(name: crossLinePage, shaderDir: overTheMoonDir,);
  }
}
