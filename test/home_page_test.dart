import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g_test/controller/auth_provider.dart';
import 'package:g_test/controller/loading_widget_provider.dart';
import 'package:g_test/view/pages/home/main_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("home page test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoadingWidgetProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const MaterialApp(
          home: Scaffold(body: MainHomePage()),
        ),
      ),
    );

    expect(find.byType(Text), findsNWidgets(3));
  });
}
