import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g_test/view/pages/auth/widgets/auth_page_widget.dart';

void main() {
  testWidgets('auth widget test', (WidgetTester tester) async {
    TextEditingController phoneController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AuthPageWidget(
          controller: phoneController,
          description: 'description',
          hintText: 'hint',
          title: 'title',
          onPress: () => phoneController.text = "world",
        ),
      ),
    ));

    expect(find.text("title"), findsOneWidget);
    expect(find.text("description"), findsOneWidget);

    final textWidgets = find.byType(Text);
    expect(textWidgets, findsNWidgets(4));

    final paddingWidgets = find.byType(Padding);
    expect(paddingWidgets, findsNWidgets(4));

    final textFormFieldWidget = find.byType(TextFormField);
    expect(textFormFieldWidget, findsOneWidget);
    await tester.enterText(textFormFieldWidget, "Hello");
    expect(phoneController.text, "Hello");

    final button = find.byType(InkWell);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(phoneController.text, "world");
  });
}
