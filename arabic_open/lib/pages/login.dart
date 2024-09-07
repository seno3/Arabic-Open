import 'package:arabic_open/components/button_2.dart';
import 'package:arabic_open/components/my_textfield.dart';
import 'package:arabic_open/components/square_tile.dart';
import 'package:arabic_open/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {

    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(),);
    });
    try {await FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text);}
      on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found'){
      print('No User found with that email');
     }
     else if (e.code == 'wrong-password'){
      print('Wrong Password!');
     }
      }

    Navigator.pop(context);
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6EDEA),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo

              Icon(
                Icons.lock,
                size: 100,
              ),

              SizedBox(height: 50),
              //welcome back
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

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
                onTap: () {
                  signUserIn();
                },
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey[400],
                        thickness: 0.5,
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey[400],
                        thickness: 0.5,
                      )),
                    ],
                  )),
              const SizedBox(height:10),

              SquareTile(imagePath: 'lib/images/arabic.png', 
              onTap: () => AuthService().signInwithGoogle(),
              )

              //or continue with
            ],
          ),
        )));
  }
}
