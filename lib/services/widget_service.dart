import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class WidgetService {
  /// Return file path.
  static Future<String?> captureAsPng(GlobalKey key, String fileName) async {
    try {
      final boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      final image = await boundary?.toImage(pixelRatio: 10);
      final byteData = await image?.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();
      base64Encode(pngBytes!.toList());
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/$fileName.png').create();
      file.writeAsBytesSync(pngBytes.toList());
      return file.path;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
