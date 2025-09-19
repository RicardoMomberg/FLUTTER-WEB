import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:image_gallery_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de integração: carregamneto inicial', (
    WidgetTester tester,
  ) async {
    app.main();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Select Image'), findsOneWidget);
  });
}
