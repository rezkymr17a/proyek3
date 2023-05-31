import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_3/models/lapak.dart';
import 'package:project_3/navigation/navigation.dart';
import 'package:project_3/pages/home_page.dart';

import 'package:project_3/pages/profil_page.dart';
import 'package:provider/provider.dart';

import '../coba/utils.dart';
import '../providers/lapaks.dart';

class FormDaftarLapak extends StatefulWidget {
  static const routeName = "/form-daftar-lapak";

  @override
  State<FormDaftarLapak> createState() => _FormDaftarLapakState();
}

class _FormDaftarLapakState extends State<FormDaftarLapak> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  // final TextEditingController imageUrlController = TextEditingController();

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('no Image selected');
  }

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Uint8List? _jpg;
  void pilihImage() async {
    Uint8List jpg = await pickImage(ImageSource.gallery);
    setState(() {
      _jpg = jpg;
    });
  }

  void saveProfile() async {
    // String name = nameController.text;
    // String bio = bioController.text;
    String resp = await StoreData().saveData(file: _image!);
    String resps = await StoreData().saveData(file: _jpg!);
    // String resp = await StoreData().saveData(file: _image!);
    // print(' ini adalah image ${_image}');
  }

  @override
  Widget build(BuildContext context) {
    // final Lapaks = Provider.of<LapaksCuci>(context);
    final lapaks = Provider.of<LapaksCuci>(context, listen: false);
    final Function addLapak = () {
      () {
        lapaks
            .addLapak(
          nameController.text,
          alamatController.text,
          deskripsiController.text,
          kategoriController.text,
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
        leadingWidth: 25,
        title: Text(
          'Form Daftar Lapak',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 230,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(213, 211, 211, 1),
                      spreadRadius: 0.8,
                      blurRadius: 2,
                      offset: Offset(
                        0.5,
                        0.5,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Buat Lapak',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: selectImage,
                          child: Container(
                            margin: EdgeInsets.only(left: 30, top: 20),
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(213, 211, 211, 1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                    3.0,
                                    3.0,
                                  ),
                                ),
                              ],
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _image != null
                                    ? Container(
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: MemoryImage(_image!),
                                              fit: BoxFit.cover),
                                        ),
                                      ) // CircleAvatar(

                                    //     radius: 40,
                                    //     backgroundImage: MemoryImage(_image!),
                                    //   )
                                    : Column(
                                        children: const [
                                          Icon(
                                            Icons.add_a_photo,
                                            size: 40,
                                            color: Colors.purple,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Tambah Photo',
                                            style:
                                                TextStyle(color: Colors.purple),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        _image != null
                            ? GestureDetector(
                                onTap: pilihImage,
                                child: Container(
                                  margin: EdgeInsets.only(left: 30, top: 20),
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(213, 211, 211, 1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                          3.0,
                                          3.0,
                                        ),
                                      ),
                                    ],
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _image != null
                                          ? Column(
                                              children: const [
                                                Icon(
                                                  Icons.add_a_photo,
                                                  size: 40,
                                                  color: Colors.purple,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Tambah Photo',
                                                  style: TextStyle(
                                                      color: Colors.purple),
                                                ),
                                              ],
                                            )
                                          : Container(
                                              height: 140,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                  image: MemoryImage(
                                                    _jpg!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FieldDaftarLapak(
              title: 'Nama Lapak',
              hint: 'Masukan nama lapak',
              isDeskripsi: false,
              controllers: nameController,
            ),
            FieldDaftarLapak(
              title: 'Kategori',
              hint: 'Pilih kategori',
              isDeskripsi: false,
              controllers: kategoriController,
            ),
            FieldDaftarLapak(
              title: 'Alamat lapak',
              hint: 'Pilih Alamat',
              isDeskripsi: false,
              controllers: alamatController,
            ),
            FieldDaftarLapak(
              title: 'Deskripsi',
              hint: 'Deskripsikan lapakmu',
              isDeskripsi: true,
              controllers: deskripsiController,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromWindowPadding(WindowPadding.zero, 10),
              // padding: EdgeInsets.fromWindowPadding(WindowPadding.zero, 12),
              child: ElevatedButton(
                onPressed: () {
                  saveProfile();
                  lapaks
                      .addLapak(
                    nameController.text,
                    kategoriController.text,
                    deskripsiController.text,
                    alamatController.text,
                    // imageUrlController.text,
                  )
                      .then(
                    (response) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil ditambahkan'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return NavigationBarPage();
                      }), (route) => false);
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

class FieldDaftarLapak extends StatelessWidget {
  String? title;
  String? hint;

  var controllers;
  bool? isDeskripsi = false;
  FieldDaftarLapak({
    Key? key,
    this.title,
    this.hint,
    this.isDeskripsi,
    this.controllers,
  }) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  // final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lapaks = Provider.of<LapaksCuci>(context, listen: false);
    final Function addLapak = () {
      () {
        lapaks
            .addLapak(
          nameController.text,
          alamatController.text,
          deskripsiController.text,
          kategoriController.text,
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
            Navigator.pop(context);
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
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 40, top: 10),
            child: Text(
              title!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 3, left: 6),
          margin: EdgeInsets.only(top: 10),
          height: isDeskripsi! ? 100 : 40,
          width: 321,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(width: 1, color: Colors.grey),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(213, 211, 211, 1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(
                  3.0,
                  3.0,
                ),
              ),
            ],
          ),
          child: TextField(
            cursorColor: Colors.black,
            cursorHeight: 20,
            onEditingComplete: addLapak(),
            controller: controllers,
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
