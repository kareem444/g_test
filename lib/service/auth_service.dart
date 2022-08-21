// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g_test/controller/auth_provider.dart';
import 'package:g_test/controller/loading_widget_provider.dart';
import 'package:g_test/helper/feedback_widgets_helper.dart';
import 'package:g_test/helper/router_helper.dart';
import 'package:g_test/helper/sqflite_helper.dart';
import 'package:g_test/model/user_model.dart';
import 'package:g_test/repo/user_repo.dart';
import 'package:g_test/util/string_constants.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthService {
  static void handleSignIn(BuildContext context, String phone) async {
    context.read<LoadingWidgetProvider>().setLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20$phone',
      verificationCompleted: (PhoneAuthCredential credential) {
        signInWithPhoneCredential(context, credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        context.read<LoadingWidgetProvider>().setLoading(false);
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: e.code == 'invalid-phone-number'
              ? "Invalid phone number"
              : "Something went wrong",
          color: Colors.red,
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        context.read<LoadingWidgetProvider>().setLoading(false);
        SmsAutoFill().listenForCode;
        Get.toNamed(RouterHelper.otpPage, arguments: [verificationId]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        context.read<LoadingWidgetProvider>().setLoading(false);
        Get.offAllNamed(RouterHelper.authPage);
        FeedBackWidgetsHelper.snakeBar(
          context: context,
          text: "Something went wrong, please try again",
          color: Colors.red,
        );
      },
    );
  }

  static checkOtpVerfication(
    BuildContext context,
    String verificationId,
    String otp,
  ) async {
    context.read<LoadingWidgetProvider>().setLoading(true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    signInWithPhoneCredential(context, credential);
  }

  static signInWithPhoneCredential(
    BuildContext context,
    AuthCredential credential,
  ) {
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((UserCredential user) async {
      await checkIfUserIsInFireStore(context);
      context.read<LoadingWidgetProvider>().setLoading(false);
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: "Successfully signed in",
        color: Colors.green,
      );
    }).catchError((e) {
      context.read<LoadingWidgetProvider>().setLoading(false);
      Get.offAllNamed(RouterHelper.authPage);
      FeedBackWidgetsHelper.snakeBar(
        context: context,
        text: e.message.toString(),
        color: Colors.red,
      );
    });
  }

  static addUserToFireStore(BuildContext context, String userName) async {
    context.read<LoadingWidgetProvider>().setLoading(true);
    UserModel userModel = UserModel(
      userId: FirebaseAuth.instance.currentUser!.uid,
      userName: userName,
      userPhone: FirebaseAuth.instance.currentUser!.phoneNumber!,
    );
    await UserRepo.addUserToFireStore(userModel).then(
      (value) async {
        await SqfliteHelper.insert(
          table: StringConstants.userTable,
          data: userModel.toMap(),
        );
        context.read<AuthProvider>().setAuth(userModel);
      },
    );
    context.read<LoadingWidgetProvider>().setLoading(false);
    Get.offAllNamed(RouterHelper.homePage);
  }

  static checkIfUserIsSignedIn(BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await checkIfUserIsInFireStore(context);
    } else {
      Get.offAllNamed(RouterHelper.authPage);
    }
  }

  static Future<void> checkIfUserIsInFireStore(BuildContext context) async {
    await UserRepo.checkIfUserIsInFireStore(
            FirebaseAuth.instance.currentUser!.phoneNumber!)
        .then((value) {
      if (value.docs.isNotEmpty) {
        context
            .read<AuthProvider>()
            .setAuth(UserModel.fromMap(value.docs.first.data()));
        Get.offAllNamed(RouterHelper.homePage);
      } else {
        Get.offAllNamed(RouterHelper.authInformationPage);
      }
    });
  }

  static void handleSignOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouterHelper.authPage);
  }
}
