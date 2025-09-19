import 'dart:typed_data';

class FileValidator {
  static const int maxFileSize = 2 * 1024 * 1024; // 2 MB
  static const String validExtension = '.jpeg';

  static bool isJpeg(String filename) {
    return filename.toLowerCase().endsWith(validExtension);
  }

  static bool isFileSizeValid(Uint8List fileBytes, [String? fileName]) {
    return fileBytes.length <= maxFileSize;
  }

  static bool validateFile(Uint8List fileBytes, String filename) {
    if (!isJpeg(filename)) {
      return false;
    }

    if (!isFileSizeValid(fileBytes)) {
      return false;
    }
    return true;
  }
}
