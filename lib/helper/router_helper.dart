import 'package:g_test/view/pages/auth/main_auth_information_page.dart';
import 'package:g_test/view/pages/auth/main_auth_page.dart';
import 'package:g_test/view/pages/auth/main_otp_page.dart';
import 'package:g_test/view/pages/home/main_home_page.dart';
import 'package:g_test/view/pages/splash/main_splash_page.dart';
import 'package:get/get.dart';

class RouterHelper {
  static const String splashPage = '/';
  static const String authPage = '/auth';
  static const String otpPage = '/otp';
  static const String authInformationPage = '/userInformation';
  static const String homePage = '/home';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const MainSplashPage()),
    GetPage(name: authPage, page: () => const MainAuthPage()),
    GetPage(name: otpPage, page: () => const MainOtpPage()),
    GetPage(name: authInformationPage, page: () => const MainAuthInformationPage()),
    GetPage(name: homePage, page: () => const MainHomePage()),
  ];
}
