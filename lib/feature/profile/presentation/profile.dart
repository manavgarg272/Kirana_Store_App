import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kirna_store_app/feature/profile/presentation/widget/profile_widget.dart';

class MyProfilePageScreen extends StatefulWidget {
  const MyProfilePageScreen({super.key});

  @override
  State<MyProfilePageScreen> createState() => _MyProfilePageScreenState();
}

class _MyProfilePageScreenState extends State<MyProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "My Profile",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600, fontSize: size.height / 40),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: size.height / 80, horizontal: size.height / 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Account',
                style: GoogleFonts.roboto(
                    fontSize: size.height / 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height / 80,
              ),
              Text(
                '${FirebaseAuth.instance.currentUser!.phoneNumber}',
                style: GoogleFonts.roboto(
                    fontSize: size.height / 60, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              Text(
                'Your Information',
                style: GoogleFonts.roboto(fontSize: size.height / 50,color: Colors.grey.shade600),
              ),
              SizedBox(
                height: size.height / 40,
              ),
             const ProfileWidget(
                icon: Icons.shopping_bag,
                textOrder: 'Your order',
              ),
              SizedBox(
                height: size.height / 40,
              ),
              const ProfileWidget(
                icon: Icons.book,
                textOrder: 'Address Book',
              ),
              SizedBox(
                height: size.height / 40,
              ),
              const ProfileWidget(
                icon: Icons.share,
                textOrder: 'Share the App',
              ),
              SizedBox(
                height: size.height / 40,
              ),
              const ProfileWidget(
                icon: Icons.share,
                textOrder: 'About Us',
              ),
              SizedBox(
                height: size.height / 40,
              ),
              const ProfileWidget(
                icon: Icons.logout,
                textOrder: 'Log Out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


