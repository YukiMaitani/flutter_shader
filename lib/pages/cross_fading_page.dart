import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shader/common/base_page.dart';
import 'package:flutter_shader/util/path_util.dart';

class CrossFadingPage extends StatefulWidget {
  const CrossFadingPage({super.key});

  @override
  State<CrossFadingPage> createState() => _CrossFadingPageState();
}

class _CrossFadingPageState extends State<CrossFadingPage> {
  double time = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        time += 1/1000;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        name: imageTransitionPage,
        imagePaths: const [dashImage, flutterLogoImage],
        uniforms: [time]);
  }
}
