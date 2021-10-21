import 'dart:convert';
import 'package:daily_todo/Models/DataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataService extends ChangeNotifier{
List<DataModel>_listData=[];
List<DataModel>get DataList{
  return _listData;
}

late SharedPreferences? sharedPreferences;

Future addNote(DataModel dataModel)async{
  _listData.add(dataModel);
  saveNote();
}

Future saveNote()async{
  sharedPreferences=await SharedPreferences.getInstance();
  List<String>listMap=_listData.map((item) => jsonEncode(item.toJson())).toList();
  sharedPreferences!.setStringList("key",listMap);
  print("Get Data${listMap.length}");
  notifyListeners();
}

Future loadNote()async{
  sharedPreferences=await SharedPreferences.getInstance();
  List<String>?dataList=sharedPreferences!.getStringList("key");
  if(dataList!=null){
    _listData=dataList.map((e) => DataModel.fromJson(jsonDecode(e))).toList();
    print(_listData.length);
  }else{
    print("No Data List");
  }


  notifyListeners();
}

Future clearData()async{
  sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences!.clear().whenComplete((){
    print("All Data Clear");
  });

}
}