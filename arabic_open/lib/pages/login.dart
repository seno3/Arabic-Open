import 'package:arabic_open/components/button_2.dart';
import 'package:arabic_open/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  LoginPage({super.key
  
  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EDEA),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height:50),
              //logo


              Icon(
                Icons.lock,
                size:100,
              ),

              SizedBox(height:50),
              //welcome back
              Text('Welcome back you\'ve been missed!', style: TextStyle(color: Colors.grey[700], fontSize: 16),),


              //username
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,


              ),
              

              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              //forgot

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),

              //sign in button
              MyButton2(
                text: "Sign In",
                onTap: (){
                  Navigator.pushNamed(context, '/courses');
                },

              ),

              //or continue with


            ],),
        )
      )
    );
  }
}