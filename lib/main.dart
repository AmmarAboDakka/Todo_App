import 'package:flutter/material.dart';
import 'package:todo_app/shared/style/My_Theme.dart';
import 'layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeLayout.RouteName,
      routes: {
        HomeLayout.RouteName:(c)=>HomeLayout(),
      },
      theme: Mytheme.lihgttheme,
      // darkTheme: Mytheme.darktheme,
      themeMode: ThemeMode.light,
    );

  }
}
