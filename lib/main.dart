import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/task_list/task_edit.dart';
import 'package:todo_app/provider/lang&theme.dart';
import 'package:todo_app/shared/style/My_Theme.dart';
import 'layout/home_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => LathProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<LathProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider1.LangugeChoose),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.RouteName,
      routes: {
        HomeLayout.RouteName: (c) => HomeLayout(),
        TaskEdite.routname: (c) => TaskEdite()
      },
      theme: Mytheme.lihgttheme,
      // darkTheme: Mytheme.darktheme,
      themeMode: ThemeMode.light,
    );
  }
}
