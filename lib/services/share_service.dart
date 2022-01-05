import 'package:flutter/material.dart';
import 'package:share/share.dart';

// Please refer to https://pub.dev/packages/share

class ShareService {
  static Future<void> share(
    BuildContext context,
    String textOrLink,
    String desc,
  ) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      textOrLink,
      subject: desc,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
