import 'package:flutter/material.dart';
import 'package:g_test/controller/auth_provider.dart';
import 'package:g_test/controller/loading_widget_provider.dart';
import 'package:g_test/helper/router_helper.dart';
import 'package:g_test/helper/sqflite_helper.dart';
import 'package:g_test/service/sqflite_service.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SqfliteHelper.initDB();
  await SqfliteService.createUsersTable();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoadingWidgetProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RouterHelper.routes,
    );
  }
}
