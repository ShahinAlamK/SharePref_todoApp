import 'package:daily_todo/Services/Provider.dart';
import 'package:daily_todo/Services/ThemeProvider.dart';
import 'package:daily_todo/Utils/CustomThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Pages/HomePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DataService()),
        ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ],
      child:Consumer<ThemeProvider>(builder: (context,theme,child){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme().lightTheme,
          darkTheme: CustomTheme().darkTheme,
          themeMode:theme.isDark? ThemeMode.light:ThemeMode.dark,
          home:  HomePage(),
        );
      },),
    );
  }
}
