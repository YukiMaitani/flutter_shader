import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shader/util/shader_util.dart';

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader, required this.uniforms});

  final FragmentShader shader;
  final List<dynamic> uniforms;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.shader = shader..setUniforms([size, ...uniforms]);
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}