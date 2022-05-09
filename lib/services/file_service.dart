import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  /// Picking image with 50% image quality
  /// and default image source from gallery
  static Future<File?> pickImage({
    ImageSource? imageSource,
  }) async {
    // Auto compress with 50% quality and 864 max width
    // (max height automatically adjusted).
    final xFile = await ImagePicker().pickImage(
      source: imageSource ?? ImageSource.gallery,
      imageQuality: 60,
      maxWidth: 864,
    );
    if (xFile == null) {
      return null;
    }
    final imageFile = File(xFile.path);
    return imageFile;
  }

  static Future<File> getJson(String filename) async {
    final dir = await getTemporaryDirectory();
    return File('${dir.path}/$filename');
  }

  static Future<void> safeToLocal(
    File file,
    String fileName,
  ) async {
    try {
      final dir = await getExternalStorageDirectory();
      if (dir == null) return;
      final path = '${dir.path}/$fileName';
      await file.copy(path);
    } catch (e) {
      Logger().e(e.toString());
    }
  }
}
