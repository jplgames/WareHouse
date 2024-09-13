import 'package:flutter/material.dart';

class BlankLayout extends StatelessWidget {
  final Widget body;
  // ignore: use_super_parameters
  const BlankLayout({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: body,
      ),
    );
  }
}

class MainLayout extends StatelessWidget {
  final Widget body;
  final AppBar appbar;
  final bool isDrawer;
  final bool isFloatingButton;
  final Widget? floatingButton;
  final Widget? drawer;

  // ignore: use_super_parameters
  const MainLayout(
      {Key? key,
      required this.body,
      required this.appbar,
      this.isDrawer = true,
      this.isFloatingButton = false,
      this.floatingButton,
      this.drawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appbar,
      drawer: isDrawer ? drawer : null,
      body: body,
      floatingActionButton: isFloatingButton ? floatingButton : null,
    );
  }
}
