import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/controller/auth_controller.dart';
import 'package:task_manager/models/api_response.dart';
import 'package:task_manager/models/user_model.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/screens/sign_up_screen.dart';
import 'package:task_manager/service/api_caller.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widgets/screen_bg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onTapSignUp(){ // Recognizer add korar jonno
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: formKey, // eita validator use er jonno
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 180,),
              Text('Get Started With', style: Theme.of(context).textTheme.titleLarge,),
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

              FilledButton(onPressed: ()async{
                final ApiResponse response = await ApiCaller.postRequest(url: TMUrls.LoginURL,
                  body: {
                    "email": emailController.text,
                    "password": passwordController.text,
                  },
                );

                if(response.isSuccess){
                  UserModel model = UserModel.fromJson(response.responseData['data']);
                  String token = response.responseData['token'];
                  AuthController.saveUserData(model, token);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainNavScreen()));
                }
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
              }, child: Icon(Icons.arrow_forward_ios)),
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
        ),
      )),
    );
  }
}
