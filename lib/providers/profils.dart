import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_3/model/profil.dart';
import 'package:project_3/pages/edit_profile_page.dart';


class Profils with ChangeNotifier {
  final List<CrudProfile> _allProfil = [];

  List<CrudProfile> get allProfil => _allProfil;
  int get jumlahProfil => allProfil.length;
  int get jumlahYgBaru => jumlahProfil;

  CrudProfile selectById(String id) =>
      _allProfil.firstWhere((element) => element.id == id);

  addProfil(
    String nama,
    String Jenis_kelamin,
    String Tanggal_lahir
    // String image,
  ) async {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://pesanan-d2fe6-default-rtdb.asia-southeast1.firebasedatabase.app/profils.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'nama': nama,
            'jenis_kelamin': Jenis_kelamin,
            'tanggal_lahir': Tanggal_lahir,
            'dateNow': datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allProfil.add(
          CrudProfile(
            id: json.decode(response.body)["name"].toString(),
            Nama: nama,
            Jenis_kelamin: Jenis_kelamin,
            Tanggal_lahir: Tanggal_lahir,
            // imageUrl: image,
            dateNow: datetimeNow,
          ),
        );
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  EditProfile(String id, String nama, String jenis_kelamin, String tanggal_lahir,
  ) async {
    Uri url = Uri.parse(
        "https://pesanan-d2fe6-default-rtdb.asia-southeast1.firebasedatabase.app/profils/$id.json");

    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "nama": nama,
            "jenis_kelamin": jenis_kelamin,
            // "imageUrl": image,
            "tanggal_lahir": tanggal_lahir,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        CrudProfile selectProfile = _allProfil.firstWhere((element) => element.id == id);

        selectProfile.Nama = nama;
        selectProfile.Jenis_kelamin = jenis_kelamin;
        // selectLapak.imageUrl = image;
        selectProfile.Tanggal_lahir = tanggal_lahir;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  deleteLapak(String id) async {
    Uri url = Uri.parse(
        "https://pesanan-d2fe6-default-rtdb.asia-southeast1.firebasedatabase.app/profils/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          _allProfil.removeWhere((element) => element.id == id);
          notifyListeners();
        },
      );
      if (response.statusCode < 200 && response.statusCode >= 300) {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        'https://pesanan-d2fe6-default-rtdb.asia-southeast1.firebasedatabase.app/profils.json');
    var hasilGetData = await http.get(url);
    //print("Hasil data ${hasilGetData.body}");
    var dataResponse = json.decode(hasilGetData.body);
    if (dataResponse != null) {
      print('ini jumlah langsung ${jumlahProfil}');
      // print('ini adalah data resposen => ${dataResponse}');

      dataResponse.forEach(
        (key, value) {
          DateTime dateTimeParse =
              DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["dateNow"]);
          _allProfil.add(
            CrudProfile(
              id: key,
              dateNow: dateTimeParse,
              // imageUrl: value["imageUrl"],
              Nama: value["nama"],
              Jenis_kelamin: value["jenis_kelamin"],
              Tanggal_lahir: value["tanggal_lahir"],
           
            ),
          );
        },
      );

      // print("berhasil masukan data brou");
      notifyListeners();
    }
  }
}