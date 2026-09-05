import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/screens/main_nav_screen.dart';
import '../utils/asset_path.dart';
import '../widgets/screen_bg.dart';
import '../screens/login_screen.dart';
import '../controller/auth_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }

  Future moveToNextScreen () async {
    await Future.delayed(Duration(seconds: 3));
    AuthController.getUserData();
    bool isUserLogin = await AuthController.isUserLogin();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> isUserLogin ? MainNavScreen():LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Center(child: Image.asset(AssetPath.logoPNG,width: 300, height: 300,))),

    );
  }
}

