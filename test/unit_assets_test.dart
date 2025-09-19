import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_gallery_app/core/file_validator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('1 - Verifica se a extensão do arquivo é .jpeg', () async {
    const filename = 'example1.jpeg';

    var data = await rootBundle.load('assets/$filename');
    var fileBytes = data.buffer.asUint8List();
    print('tamanho do arquivo: ' + fileBytes.length.toString());

    var isValid = FileValidator.validateFile(fileBytes, filename);

    expect(isValid, true);
  });

  test('2 - Verifica se a extensão do arquivo é .jpeg', () async {
    const filename = 'example4.jpg';

    var data = await rootBundle.load('assets/$filename');
    var fileBytes = data.buffer.asUint8List();
    print('tamanho do arquivo: ' + fileBytes.length.toString());
    
    var isValid = FileValidator.validateFile(fileBytes, filename);

    expect(isValid, false);
  });
}