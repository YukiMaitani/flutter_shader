import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_shader/common/shader_panter.dart';
import 'package:flutter_shader/util/path_util.dart';

import '../util/shader_util.dart';

class BasePage extends StatefulWidget {
  const BasePage(
      {super.key,
      required this.name,
      required this.imagePaths,
      this.uniforms = const []});

  final String name;
  final List<String> imagePaths;
  final List<dynamic> uniforms;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  FragmentShader? shader;
  List<ui.Image?> images = [];

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    for(final path in widget.imagePaths) {
      final image = await loadUiImage(path);
      images.add(image);
    }
    shader = await loadFragmentShader(getShaderPath(widget.name));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (shader == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return CustomPaint(
        painter: ShaderPainter(
          shader: shader!,
          uniforms: [...widget.uniforms, ...images],
        ),
        child: Container(),
      );
    }
  }
}
