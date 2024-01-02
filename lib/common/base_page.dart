import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_shader/common/shader_panter.dart';
import 'package:flutter_shader/util/path_util.dart';

import '../util/shader_util.dart';

class BasePage extends StatefulWidget {
  const BasePage(
      {super.key,
      required this.name, this.shaderDir,
      this.imagePaths = const [],
      this.uniforms = const [],
      this.needTime = false});

  final String name;
  final String? shaderDir;
  final List<String> imagePaths;
  final List<dynamic> uniforms;
  final bool needTime;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with SingleTickerProviderStateMixin {
  FragmentShader? shader;
  List<ui.Image?> images = [];
  Ticker? ticker;
  double time = 0.0;

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  void dispose() {
    ticker?.dispose();
    super.dispose();
  }

  void setTicker() {
    ticker = createTicker((elapsed) {
      time = elapsed.inMilliseconds.toDouble() / 1000.0;
      setState(() {});
    })..start();
  }

  Future<void> setup() async {
    for (final path in widget.imagePaths) {
      final image = await loadUiImage(path);
      images.add(image);
    }
    final path = widget.shaderDir == null
        ? getShaderPath(widget.name)
        : getNestShaderPath(widget.name, widget.shaderDir!);
    shader = await loadFragmentShader(path);
    if (widget.needTime) {
      setTicker();
    }
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
      return AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: ShaderPainter(
            shader: shader!,
            uniforms: [
              ...widget.uniforms,
              if (widget.needTime) time,
              ...images
            ],
          ),
          child: Container(),
        ),
      );
    }
  }
}
