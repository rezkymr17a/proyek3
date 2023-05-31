import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project_3/models/alamat.dart';
import 'package:project_3/pages/edit_alamat_page.dart';
import '../models/lapak.dart';

class Alamats with ChangeNotifier {
  final List<Alamat> _allAlamat = [];

  List<Alamat> get allalamat => _allAlamat;
  int get jumlahalamat => allalamat.length;
  int get jumlahYgBaru => jumlahalamat;

  Alamat selectById(String id) =>
      _allAlamat.firstWhere((element) => element.id == id);

  addAlamat(
    String name,
    String nomtelp,
    String provinsi,
    String kabupaten,
    String kecamatan,
    String detailalamat,
    // String image,
  ) async {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://lapaks-data-default-rtdb.firebaseio.com/lapaks.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'name': name,
            'nomtelp': nomtelp,
            'provinsi': provinsi,
            'kabupaten': kabupaten,
            'kecamatan': kecamatan,
            'detailalamat': detailalamat,
            'createdAt': datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allAlamat.add(
          Alamat(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            nomtelp: nomtelp,
            provinsi: provinsi,
            // imageUrl: image,
            kabupaten: kabupaten,
            kecamatan: kecamatan,
            detailalamat: detailalamat,
            createdAt: datetimeNow,
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

  EditAlamat(String id, String name, String nomtelp, String provinsi,
      String kabupaten, String kecamatan, String detailalamat) async {
    Uri url = Uri.parse(
        "https://lapaks-data-default-rtdb.firebaseio.com/lapaks/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "name": name,
            "nomtelp": nomtelp,
            // "imageUrl": image,
            "provinsi": provinsi,
            "kabupaten": kabupaten,
            "kecamatan": kecamatan,
            "detailalamat": detailalamat,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Alamat selectAlamat =
            _allAlamat.firstWhere((element) => element.id == id);

        selectAlamat.name = name;
        selectAlamat.nomtelp = nomtelp;
        // selectLapak.imageUrl = image;
        selectAlamat.provinsi = provinsi;
        selectAlamat.kabupaten = kabupaten;
        selectAlamat.kecamatan = kecamatan;
        selectAlamat.detailalamat = detailalamat;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  deleteAlamat(String id) async {
    Uri url = Uri.parse(
        "https://lapaks-data-default-rtdb.firebaseio.com/lapaks/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          _allAlamat.removeWhere((element) => element.id == id);
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
        'https://lapaks-data-default-rtdb.firebaseio.com/lapaks.json');
    var hasilGetData = await http.get(url);
    //print("Hasil data ${hasilGetData.body}");
    var dataResponse = json.decode(hasilGetData.body);
    if (dataResponse != null) {
      //print('ini jumlah langsung ${jumlahLapak}');
      // print('ini adalah data resposen => ${dataResponse}');

      dataResponse.forEach(
        (key, value) {
          DateTime dateTimeParse =
              DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
          _allAlamat.add(
            Alamat(
              id: key,
              createdAt: dateTimeParse,
              // imageUrl: value["imageUrl"],
              name: value["name"],
              nomtelp: value["nomtelp"],
              provinsi: value["provinsi"],
              kabupaten: value["kabupaten"],
              kecamatan: value["kecamatan"],
              detailalamat: value["detailalamat"],
            ),
          );
        },
      );

      // print("berhasil masukan data brou");
      notifyListeners();
    }
  }
}
