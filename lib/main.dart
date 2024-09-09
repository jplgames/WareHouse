import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/app/core/routes/app_pages.dart';
import 'app/core/theme/theme.dart';

void main() {
  runApp(const Warehouse());
}

class Warehouse extends StatelessWidget {
  const Warehouse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo', 
      theme: MaterialTheme(Theme.of(context).textTheme).light(),
      darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      );
  }
}
