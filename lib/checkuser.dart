import 'package:crud_oprations/loginpage.dart';
import 'package:crud_oprations/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  Widget build(BuildContext context) {
    return checkuser();
  }
  checkuser(){
    final user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      return MyHomePage();
    }
    else{
      return LoginPage();
    }
  }
}
