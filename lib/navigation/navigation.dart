import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../pages/daftar_lapak_page.dart';
import '../pages/home_page.dart';
import '../pages/profil_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedTableIndex = 0;

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedTableIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      const HomePage(),
      const DaftarLapak(),
      const ProfilePage(),
    ];

    final _bottomNavbarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.local_car_wash_rounded),
        label: 'Lapak',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavbarItems,
      currentIndex: _selectedTableIndex,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      onTap: _onNavbarTapped,
    );
    return Scaffold(
      body: _listPage[_selectedTableIndex],
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
