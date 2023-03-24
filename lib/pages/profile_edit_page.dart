import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

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
          child: Text(
            'Profil Saya',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/d/d4/N.Tesla.JPG",
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.mode_edit,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
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
                // NOTE: NAME INPUT
                const CustomFormField(
                  title: 'Full Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: EMAIL INPUT
                const CustomFormField(
                  title: 'Email Address',
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: PASSWORD INPUT
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-set-profile');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
