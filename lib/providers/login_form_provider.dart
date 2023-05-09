import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoging => _isLoading;
  
  set isLoging(bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    
    print("$email y $password");
    return formKey.currentState?.validate() ?? false;

  }




}