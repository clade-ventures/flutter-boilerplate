import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/bases/widgets/molecules/messenger.dart';

// Please refer to https://pub.dev/packages/url_launcher

class LaunchServices {
  static Future<void> launchInBrowser(
    String url, {
    BuildContext? context,
  }) async {
    Logger().i('Launch Url $url');
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      Messenger.errorX('Cant launch the url');
    }
  }

  static Future<void> openEmail(
    String email,
    String subject,
    String body,
  ) async {
    await launchInBrowser('mailto:$email?subject=$subject&body=$body');
  }
}
