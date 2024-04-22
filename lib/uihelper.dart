import 'package:flutter/material.dart';

class Uihelper{
  static CustomTextField(TextEditingController controller,String text,IconData iconData,bool toHide){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
  static CustomButton(VoidCallback voidCallback,String text){
    return SizedBox(width: 200,height: 50, child: ElevatedButton(onPressed: (){
      voidCallback();
    },style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      backgroundColor: Colors.pink
    ),
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),),));
  }
  static CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("OK"))
        ],
      );
    });
  }
}