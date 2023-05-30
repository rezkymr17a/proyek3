import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SuksesPage extends StatelessWidget {
  const SuksesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(
                    3.0,
                    3.0,
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 350,
            width: 400,
            child: Column(
              children: [
                Image.asset(
                  'assets/checklist.png',
                  width: 200,
                ),
                Text(
                  'Berhasil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Berhasil buat lapak',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: 120,
            // padding: EdgeInsets.fromWindowPadding(WindowPadding.zero, 12),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Beranda",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
