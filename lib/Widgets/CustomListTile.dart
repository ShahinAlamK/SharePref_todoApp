import 'package:daily_todo/Models/DataModel.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final DataModel?dataModel;
  final int?index;
  CustomListTile({Key? key,required this.dataModel,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey.withOpacity(.1)
        //color: Theme.of(context).colorScheme.primary
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryVariant
            ),
            child: Center(child: Text(dataModel!.date!
                ,style: Theme.of(context).textTheme.bodyText2)),
          ),

          SizedBox(width: 10,),

          Expanded(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Text(dataModel!.title??"",maxLines: 2,overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 5,),
            ],
          ))
        ],
      ),
    );
  }
}


