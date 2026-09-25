import 'package:flutter_test/flutter_test.dart';
import 'package:finalday/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const FitnessMockupApp());

    expect(find.byType(FitnessMockupApp), findsOneWidget);
  });
}
