

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddButtonWidget extends StatefulWidget {
  const AddButtonWidget({super.key});

  @override
  State<AddButtonWidget> createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  
  int addValue= 0;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  
    addValue==0 ? InkWell(
      onTap: () {
        addValue++;
        setState(() {
          
        });
      },
      child: Container(
        width:size.width/3 ,
        height: size.height/22,
        alignment: Alignment.center,
        padding: EdgeInsets.all(size.height/120),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent)
        ),
        child: Text("ADD"),
      ),
    ):  Container(
      padding: EdgeInsets.all(size.height/120),
      height: size.height/22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent)
      ),
    width:size.width/3 ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              addValue--;
              setState(() {
                
              });
            },
            child: Icon(Icons.remove)),
            Text("$addValue"),
          GestureDetector(
            onTap: () {
              
              addValue++;
              setState(() {
              
              });
            },
            child: Icon(Icons.add)),
       
         
        ],
      ),
    );
  }
}