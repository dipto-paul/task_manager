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
              backgroundImage: NetworkImage('https://scontent.fdac183-1.fna.fbcdn.net/v/t39.30808-6/799773882_122121277425372660_5349377044784928502_n.jpg?stp=cp6_dst-jpg_tt6&cstp=mx1540x2048&ctp=s1540x2048&_nc_cat=109&ccb=1-7&_nc_sid=833d8c&_nc_ohc=Gut_5zYcdRQQ7kNvwHAHq1L&_nc_oc=AdouR9PN8IohIeVspbBoZu4uyzMtDT1kxsRYqD75J-iqHF6g2UMt_QuH51hFjAFsppI&_nc_zt=23&_nc_ht=scontent.fdac183-1.fna&_nc_gid=3h8-z4CJ7chMgLwwgnnLjA&_nc_ss=7b2a8&oh=00_AQKuK9Cbr-1Sg5Hfpac4lmwc0cbqxTAFuogmm3DRTGGd6Q&oe=6AA886B2'),
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