


import 'package:flutter/material.dart';

class HomeDrawerScreen extends StatelessWidget {
  const HomeDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Manav Garg',
            ),
            accountEmail: Text(
              'Manavgarg272@gmail.com',
            ),
           
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pop();
              /* context.read<DrawerNotifier>().drawerIndex = 0; */
            },
          ),
        ],
      ),
    );
  }
}