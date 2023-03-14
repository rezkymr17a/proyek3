import 'package:flutter/material.dart';
import 'package:hana_pbb/daftar_akun.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CAR",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "WASH",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.indigo[500],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Selamat Datang Di Car Wash",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Mohon Masukan Akun Anda",
              style: TextStyle(
                fontSize: 20,
                height: 5,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    labelText: 'Input User Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Input Password',
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    child: Text("Log In"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Belum Punya Akun?",
                  style: TextStyle(
                    fontSize: 15,
                    height: 10,
                    color: Colors.indigo[500],
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    child: Text("Daftar Sekarang"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewWidget2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
