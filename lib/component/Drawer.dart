import 'package:chat_kide/page/settings.dart';
import 'package:chat_kide/servcies/auth/auth_servcie.dart';

import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});
  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
          const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.blue, // Change the background color of the DrawerHeader
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 50, color: Colors.white),
        SizedBox(height: 10),
        Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),
              // home list
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home,color: Colors.blue.shade700,),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // settings
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SettingPage()));
                  },
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.security,color: Colors.blue.shade300,),
                  title: const Text("Privacy and Security"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SettingPage()));
                  },
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.storage,color: Colors.green,),
                  title: const Text("Data and Storage"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SettingPage()));
                  },
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.help ,color: Colors.red.shade200,),
                  title: const Text("Help"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SettingPage()));
                  },
                ),
              ),
              
            ],
          ),
          //logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 30.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
