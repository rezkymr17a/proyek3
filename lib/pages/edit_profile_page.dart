import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_3/provider/profils.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = "/edit-profil";
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController namaController =TextEditingController();
  TextEditingController jeniskController =TextEditingController();
  TextEditingController  tglController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final profils = Provider.of<Profils>(context, listen: false);
    final Function addProfil = () {
      () {
        profils
            .addProfil(
          namaController.text,
          jeniskController.text,
          tglController.text,
          // imageUrlController.text,
        )
            .then(
          (Response) {
            print("Kembali ke home dan kasih notif");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Berhasil di tambahkan"),
                duration: Duration(seconds: 2),
              ),
            );
            // Navigator.pop(context);
          },
        ).catchError(
          (err) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('terjadi error $err'),
              content: Text('tidak dapat menambahkan data'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('okay'),
                ),
              ],
            ),
          ),
        );
      };
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        'assets/user.png',
                        color: Colors.grey[200],
                        scale: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ubah Foto Profil',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
            FieldEditProfile(
              Controller: namaController,
              title: 'Nama Lengkap',
              hint: '',
              isDeskripsi: false,
            ),
            FieldEditProfile(
              Controller: jeniskController,
              title: 'Jenis Kelamin',
              hint: '',
              isDeskripsi: false,
            ),
            FieldEditProfile(
              Controller: tglController,
              title: 'Tanggal Lahir',
              hint: '',
              isDeskripsi: false,
            ),
            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.fromWindowPadding(WindowPadding.zero, 10),
              // padding: EdgeInsets.fromWindowPadding(WindowPadding.zero, 12),
              child: ElevatedButton(
                onPressed: () {
                  profils.addProfil(
                    namaController.text,
                  jeniskController.text, 
                  tglController.text,).then((response){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('berhasil'),duration: Duration(seconds: 2),
                    ),
                    );
                  
                    
                  

                  },
              );
                },
                child: Text(
                  "Tambahkan",
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
      ),
    );
  }
}

class FieldEditProfile extends StatelessWidget {
  String? title;
  String? hint;
  var Controller;
  bool? isDeskripsi = false;
  FieldEditProfile({Key? key, this.title, this.hint, this.isDeskripsi,this.Controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title!,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 3, left: 6),
          margin: EdgeInsets.only(top: 10),
          height: isDeskripsi! ? 100 : 40,
          width: 341,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //border: Border.all(color: Colors.grey),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(213, 211, 211, 1),
                spreadRadius: 1.5,
                blurRadius: 5,
                offset: Offset(
                  3.0,
                  3.0,
                ),
              ),
            ],
          ),
          child: TextField(
            controller: Controller,
            cursorColor: Colors.black,
            cursorHeight: 20,
            decoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
