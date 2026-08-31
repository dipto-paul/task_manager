import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/widgets/screen_bg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {

  onTapSignIn(){ // Recognizer add korar jonno
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 180,),
            Text('Join With Us', style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'First Name',
                prefixIcon: Icon(Icons.drive_file_rename_outline),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Last Name',
                prefixIcon: Icon(Icons.drive_file_rename_outline),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Mobile',
                prefixIcon: Icon(Icons.call),
              ),
            ),
            SizedBox(height: 10,),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(height: 20,),

            FilledButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios)),
            SizedBox(height: 50,),

            Center(
              child: Column(
                children: [

                  RichText(text: TextSpan(
                      text:"Already Have an Account?", style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Sign In", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
                        ),
                      ]
                  ),
                  ),

                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
