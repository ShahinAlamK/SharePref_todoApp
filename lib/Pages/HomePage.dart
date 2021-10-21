import 'package:daily_todo/Services/Provider.dart';
import 'package:daily_todo/Services/ThemeProvider.dart';
import 'package:daily_todo/Utils/CustomThemes.dart';
import 'package:daily_todo/Widgets/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'TodoList.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLight=true;

  @override
  void initState() {
    Provider.of<DataService>(context,listen: false).loadNote();
    Provider.of<ThemeProvider>(context,listen: false).loadPref();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final isDark= Provider.of<ThemeProvider>(context,listen: false).isDark;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [

          DataListBuilder(),

          BottomNavigation(),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      title: Text("Note Application"),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isLight=!isLight;
                Provider.of<ThemeProvider>(context,listen: false).updateTheme(isLight);
              });
            },
            icon: SvgPicture.asset(
              "assets/icons/brightness.svg",
              height: 20,
              color:isLight?kLColor:ksecondary,
            )),
        IconButton(
            onPressed: () {
             setState(() {
               Provider.of<DataService>(context,listen: false).clearData();
             });
            },
            icon: Icon(Icons.clear)),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}

