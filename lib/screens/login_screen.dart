import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/widgets/screen_bg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  onTapSignUp(){ // Recognizer add korar jonno
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
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
            Text('Get Started With', style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
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
                  TextButton(onPressed: (){},
                      child: Text('Forget Password ?', style: TextStyle(color: Colors.grey),)
                  ),
                  RichText(text: TextSpan(
                      text:"Don't have Account ?", style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign Up", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),

                        recognizer: TapGestureRecognizer()..onTap = onTapSignUp,// text ke clickable korar jonno
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
