import 'package:daily_todo/Models/DataModel.dart';
import 'package:daily_todo/Services/Provider.dart';
import 'package:daily_todo/Widgets/CustomListTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DataListBuilder extends StatefulWidget {
  const DataListBuilder({Key? key}) : super(key: key);


  @override
  State<DataListBuilder> createState() => _DataListBuilderState();
}

class _DataListBuilderState extends State<DataListBuilder> {

  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    final DataList=Provider.of<DataService>(context).DataList;
    return Expanded(
        child: ListView.builder(
            itemCount: DataList.length,
            itemBuilder: (_, index) {
              if(DataList.length==0){
                return Text("No data",style:TextStyle(color: Colors.black),);
              }
              return CustomListTile(
                dataModel:DataList[index],
                index: index,
              );
            }));
  }
}
