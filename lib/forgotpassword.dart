import 'package:crud_oprations/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller = TextEditingController();
  forgotpassword(String email) async{
    if(email==""){
      Uihelper.CustomAlertBox(context, "Enter an email to reset password");
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Passwors"),
      ),
      body: Column(
        children: [
          Uihelper.CustomTextField(emailcontroller, "Email",Icons.mail, false),
          SizedBox(height: 20,),
          Uihelper.CustomButton(() {
            forgotpassword(emailcontroller.text.toString());
          }, "Reset Password"),
        ],
      ),
    );
  }
}
