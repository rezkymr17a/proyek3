import 'package:flutter/material.dart';
import 'package:project_findhouse/pages/home_page.dart';
import 'package:project_findhouse/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("images/splash_home.png"),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Find cozy house\nto stay and happy",
                    style: TextStyle(color: blackColor, fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Stop membuang banyak waktu \npada tempat yang tidak habitable bagi anda",
                    style: TextStyle(color: greyColor, fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Explore Now",
                        style: TextStyle(color: whiteColor, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
