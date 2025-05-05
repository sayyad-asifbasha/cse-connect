import 'package:cse_connect/locator.dart';
import 'package:cse_connect/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    User? user=userService.getUser;
    print(user!.email);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                        NetworkImage(user.photoURL ?? ''),
                      ),
                      SizedBox(width: 16),
                      Text(
                        user.displayName ?? 'User',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildListTile(Icons.email, 'Email Address',
                      user.email ?? '',context),
                  _buildListTile(Icons.phone, 'Phone Number',
                      user.phoneNumber ?? 'Not provided',context),


                ],
              ),
            ),
          )
      ),
    );
  }
}
Widget _buildListTile(IconData icon, String title, String subtitle, BuildContext? context) {
  return ListTile(
    leading: Icon(icon, color: Colors.black),
    title: Text(
      title,
      style: Theme.of(context!).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w300,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context!).textTheme.titleLarge?.copyWith(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
