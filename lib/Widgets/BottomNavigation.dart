import 'package:daily_todo/Models/DataModel.dart';
import 'package:daily_todo/Services/Provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'MyButton.dart';


class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  TextEditingController _noteController = new TextEditingController();

  Future InsertNote()async{
    if(_globalKey.currentState!.validate()){
      if(_noteController.text.isNotEmpty){
        DataModel dataModel=DataModel(
            title: _noteController.text,
            date:DateFormat.d().format(DateTime.now())
        );
        _noteController.clear();
        Provider.of<DataService>(context,listen: false)
            .addNote(dataModel).whenComplete(() => print("Insert Data"));
      }else{
        return showDialog(context: context, builder: (_){
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Something Wrong"),
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
              child: Form(
                key: _globalKey,
                child: TextFormField(
                  controller: _noteController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "enter note"),
                ),
              )),
          MyButton(
            label: "+Insert",
            press: () {
              InsertNote();
              //print("Click");
            },
          ),
        ],
      ),
    );
  }
}
