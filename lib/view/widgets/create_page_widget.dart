import 'package:g_test/controller/loading_widget_provider.dart';
import 'package:g_test/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePageWidget extends StatelessWidget {
  final Widget page;
  final Widget? bottomAppbar;
  final PreferredSizeWidget? appBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CreatePageWidget({
    Key? key,
    required this.page,
    this.bottomAppbar,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomAppbar,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: page,
            ),
            if (context.watch<LoadingWidgetProvider>().showLoadingScreen)
              const LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
