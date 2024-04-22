import 'package:crud_oprations/forgotpassword.dart';
import 'package:crud_oprations/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'signuppage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  login(String email,String password)async{
    if(email=="" && password==""){
      return Uihelper.CustomAlertBox(context, "Enter Required field ");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        });
      }
      on FirebaseAuthException catch(ex){
        return Uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Uihelper.CustomTextField(emailController, "Email", Icons.mail, false),
            Uihelper.CustomTextField(passController, "Password", Icons.password, true),
            SizedBox(height: 30,),
            Uihelper.CustomButton(() {
              login(emailController.text.toString(), passController.text.toString());
            }, 'Login'),
            SizedBox(height: 28,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Are you new user ?',style: TextStyle(fontSize: 16),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                },
                    child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),)
              ],
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
            },
                child: Text("Forgot Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        ),
      ),
    );
  }
}
