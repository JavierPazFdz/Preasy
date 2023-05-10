import 'package:flutter/material.dart';

class NotificationsService{

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message){
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 100.0, right: 30, left: 30),
      content: Text(message, style: TextStyle(color: Colors.white, fontSize: 20,), textAlign: TextAlign.center,),
       backgroundColor: Colors.red,
      //  margin: EdgeInsets.all(15),
      
      );


    messengerKey.currentState!.showSnackBar(snackBar);
  }

}