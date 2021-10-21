import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? label;
  final Function? press;
  const MyButton({
    required this.label,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>press!(),
      child: Container(
          height: 45,
          padding: EdgeInsets.symmetric(horizontal:15),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigo
          ),
          child: Center(child: Text(label!))),
    );
  }
}
