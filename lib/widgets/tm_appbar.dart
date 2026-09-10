import '../controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../screens/update_profile_screen.dart';
class TmAppBar extends StatelessWidget implements PreferredSize{
  const TmAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://scontent.fdac182-1.fna.fbcdn.net/v/t39.30808-6/599424271_1401864821532715_2140463736355173132_n.jpg?stp=dst-jpg_tt6&cstp=mx1270x2048&ctp=s1270x2048&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=nAyy4d8D_ZMQ7kNvwFoAhKN&_nc_oc=AdplX3tIV9Ll3rWJMphjxBrpnL2Br5jANqRPOqW8XMMXeie3w6zcLr57uoteSOJtqpM&_nc_zt=23&_nc_ht=scontent.fdac182-1.fna&_nc_gid=UeQtxks4LgphciRUSJaHvQ&_nc_ss=7b2a8&oh=00_AQJJFrk8t5khWdW7BD7xIksDulF8vhFDGekA4O3B1oRQfQ&oe=6AA8B17E'),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${AuthController.userData?.firstName}  ${AuthController.userData?.lastName}',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white
                ),),
                Text(AuthController.userData!.email.toString(),style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}