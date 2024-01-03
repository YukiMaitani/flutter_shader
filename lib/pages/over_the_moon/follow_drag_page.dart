import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class FollowDragPage extends StatelessWidget {
  const FollowDragPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: followDragPage,
      shaderDir: overTheMoonDir,
      needTime: true,
      needGesture: true,
    );
  }
}