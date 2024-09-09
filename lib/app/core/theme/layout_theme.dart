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
        child: body,
      ),
    );
  }
}
