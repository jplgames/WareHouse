import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'app/core/routes/app_pages.dart';
import 'app/core/theme/theme.dart';

void main() {
  runApp(const Warehouse());
}

class Warehouse extends StatelessWidget {
  const Warehouse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Warehouse Manager', 
      theme: MaterialTheme(Theme.of(context).textTheme).light(),
      darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      );
  }
}
