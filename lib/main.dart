import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'firebase_options.dart';

import 'app/core/routes/app_pages.dart';
import 'app/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Warehouse());
}

class Warehouse extends StatelessWidget {
  const Warehouse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('pt', ''),
      ],
      title: 'Warehouse Manager',
      theme: MaterialTheme(Theme.of(context).textTheme).light(),
      darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
