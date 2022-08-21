import 'package:flutter_test/flutter_test.dart';
import 'package:g_test/service/form_service.dart';

void main() {
  group('form validation test', () {
    test('user name test', () {
      String userName = 'kareem ayman';
      String? validation = FormService.userNameFieldValidation(userName);
      expect(validation, null);
    });
    test('phone number test', () {
      String userName = '0123456789';
      String? validation = FormService.phoneFieldValidation(userName);
      expect(validation, null);
    });
  });
}
