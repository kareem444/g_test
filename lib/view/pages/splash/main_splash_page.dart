import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:g_test/service/auth_service.dart';
import 'package:g_test/view/widgets/create_page_widget.dart';

class MainSplashPage extends StatefulWidget {
  const MainSplashPage({Key? key}) : super(key: key);

  @override
  State<MainSplashPage> createState() => _MainSplashPageState();
}

class _MainSplashPageState extends State<MainSplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AuthService.checkIfUserIsSignedIn(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CreatePageWidget(
      page: Center(
        child: SpinKitFadingCube(
          size: 80,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.black45 : Colors.orange[800],
              ),
            );
          },
        ),
      ),
    );
  }
}
