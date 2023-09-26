




import 'package:flutter/material.dart';

class CheckOutFloatingButton extends StatelessWidget {
  const CheckOutFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      
      decoration: BoxDecoration(
        color:  Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.fromLTRB(size.height/30,0,0,0),
    
      height: size.height/15,
      child: Text("GO TO ORDER SUMMARY",style: TextStyle(fontWeight: FontWeight.bold,),),);
  }
}