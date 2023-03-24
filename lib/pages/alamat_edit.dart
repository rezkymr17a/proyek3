import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class AlamatEditPage extends StatelessWidget {
  const AlamatEditPage({super.key});

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
            'Alamat',
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
                ),
                const SizedBox(
                  height: 40,
                ),
                // NOTE: NAME INPUT
                const CustomFormField(
                  title: 'Nama',
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: EMAIL INPUT
                const CustomFormField(
                  title: 'Nomor Telepon',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Provinsi',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Kabupaten',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Kecamatan',
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE: PASSWORD INPUT
                const CustomFormField(
                  title: 'Detail Alamat',
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
