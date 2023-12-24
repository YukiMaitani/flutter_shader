import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

extension FgShaderEx on FragmentShader {
  void setUniforms(List<dynamic> uniforms) {
    int index = 0;
    for(final data in uniforms) {
      if(data is Size) {
        setFloat(index++, data.width);
        setFloat(index++, data.height);
      } else if(data is double) {
        setFloat(index++, data);
      } else if(data is Color) {
        setFloat(index++, data.red.toDouble());
        setFloat(index++, data.green.toDouble());
        setFloat(index++, data.blue.toDouble());
        setFloat(index++, data.alpha.toDouble());
      } else if(data is Offset) {
        setFloat(index++, data.dx);
        setFloat(index++, data.dy);
      }
    }
    final images = uniforms.whereType<ui.Image>().toList();
    for (int i = 0; i < images.length; i++) {
      setImageSampler(i, images[i]);
    }
  }
}

Future<ui.Image> loadUiImage(String path) async {
  final imageData = await rootBundle.load(path);
  return await decodeImageFromList(imageData.buffer.asUint8List());
}

Future<FragmentShader> loadFragmentShader(String path) async {
  final program = await FragmentProgram.fromAsset(path);
  return program.fragmentShader();
}