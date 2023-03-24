
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import'package:flutter/material.dart';
import 'package:proyek3/widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
      title: Center(
        child: Text('Profil Saya',
        style: TextStyle(    
        color: Colors.black, 
        fontSize: 20,
        fontWeight: FontWeight.bold,
        ),
        ),
      ),
    ),
    body: ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      children: [
        const SizedBox(
        height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 22,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image:NetworkImage("https://upload.wikimedia.org/wikipedia/commons/d/d4/N.Tesla.JPG",

                  ),
                  fit: BoxFit.cover
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
              'Nikola Tesla',
              style: TextStyle(    
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileMenuItem(iconUrl: 'assets/icons/manage_accounts.png', title: 'Edit Profile',
              onTap: () {},
              ),
              ProfileMenuItem(iconUrl: 'assets/icons/location_on.png', title: 'Alamat',
              onTap: () {},
              ),
              ProfileMenuItem(iconUrl: 'assets/icons/in_home_mode.png', title: 'Buka Lapak',
              onTap: () {},
              ),
              

            ],
          ),

        )
      ],
    ),
    bottomNavigationBar: ConvexAppBar(


      items: [
      TabItem(icon: Icons.map, title: 'Discovery',),
      TabItem(icon: Icons.home, title: 'Home'),
      TabItem(icon: Icons.people, title: 'Profile'),
    ],
    initialActiveIndex: 2,
    ),
    );
  }
}