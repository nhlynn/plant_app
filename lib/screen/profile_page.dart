import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import '../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 2,
                  )),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('images/profile.jpg'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Heaven',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor.withOpacity(.8),
                  ),
                ),
                const SizedBox(width: 5,),
                Image.asset('images/verified.png',height: 24,),
              ],
            ),
            const SizedBox(height: 16,),
            const ProfileWidget(icon: Icons.person,text: 'My Profile',),
            const ProfileWidget(icon: Icons.settings,text: 'Settings',),
            const ProfileWidget(icon: Icons.notifications,text: 'Notifications',),
            const ProfileWidget(icon: Icons.message_outlined,text: 'FAQs',),
            const ProfileWidget(icon: Icons.share,text: 'Share',),
            const ProfileWidget(icon: Icons.logout,text: 'Logout',),
          ],
        ),
      ),
    );
  }
}
