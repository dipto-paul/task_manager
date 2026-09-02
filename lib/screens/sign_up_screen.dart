import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/service/api_caller.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_bg.dart';

import '../models/api_response.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onTapSignIn() async { // Recognizer add korar jonno
    final ApiResponse response = await ApiCaller.postRequest(url: TMUrls.SignUpURL,
    body: {
      "email": emailController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "mobile": mobileController.text,
      "password": passwordController.text,
    },
    );



    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 180,),
              Text('Join With Us', style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Email is required';
                  }else{
                    return null;
                  }
                },

              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  prefixIcon: Icon(Icons.drive_file_rename_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }

                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  prefixIcon: Icon(Icons.drive_file_rename_outline),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your last name";
                  }

                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                  prefixIcon: Icon(Icons.call),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your mobile number";
                  }

                  if (value.length != 11) {
                    return "Mobile number must be 11 digits";
                  }

                  return null;
                },
              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your password";
                  }

                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20,),

              FilledButton(onPressed: (){
                onTapSignIn();
              }, child: Icon(Icons.arrow_forward_ios)),
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
        ),
      )),
    );
  }
}
