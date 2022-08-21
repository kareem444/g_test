import 'package:flutter/cupertino.dart';
import 'package:g_test/helper/sqflite_helper.dart';
import 'package:g_test/util/string_constants.dart';

class SqfliteService {
  static createUsersTable() async {
    await SqfliteHelper.createTable(
      tableName: StringConstants.userTable,
      columns: '''
                    userName STRING not null,
                    userPhone STRING not null
                ''',
    );
    debugPrint('${StringConstants.userTable} table created');
  }
}
