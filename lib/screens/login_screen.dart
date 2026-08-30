import 'package:flutter/material.dart';
import 'package:task_manager/widgets/screen_bg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Column(
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
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.password),

            ),
          )
        ],
      )),
    );
  }
}
