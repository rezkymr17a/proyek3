import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/lapak.dart';

class LapaksCuci with ChangeNotifier {
  final List<Lapak> _allLapak = [];

  List<Lapak> get allLapak => _allLapak;
  int get jumlahLapak => allLapak.length;
  int get jumlahYgBaru => jumlahLapak;

  Lapak selectById(String id) =>
      _allLapak.firstWhere((element) => element.id == id);

  addLapak(
    String name,
    String kategori,
    String deskripsi,
    String alamat,
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
            'kategori': kategori,
            // 'imageUrl': image,
            'alamat': alamat,
            'deskripsi': deskripsi,
            'createdAt': datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allLapak.add(
          Lapak(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            kategori: kategori,
            alamat: alamat,
            // imageUrl: image,
            deskripsi: deskripsi,
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

  editLapak(String id, String name, String kategori, String deskripsi,
      String alamat) async {
    Uri url = Uri.parse(
        "https://lapaks-data-default-rtdb.firebaseio.com/lapaks/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "name": name,
            "kategori": kategori,
            // "imageUrl": image,
            "alamat": alamat,
            "deskripsi": deskripsi,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Lapak selectLapak = _allLapak.firstWhere((element) => element.id == id);

        selectLapak.name = name;
        selectLapak.kategori = kategori;
        // selectLapak.imageUrl = image;
        selectLapak.alamat = alamat;
        selectLapak.deskripsi = deskripsi;
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
        "https://lapaks-data-default-rtdb.firebaseio.com/lapaks/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          _allLapak.removeWhere((element) => element.id == id);
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
      print('ini jumlah langsung ${jumlahLapak}');
      // print('ini adalah data resposen => ${dataResponse}');

      dataResponse.forEach(
        (key, value) {
          DateTime dateTimeParse =
              DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
          _allLapak.add(
            Lapak(
              id: key,
              createdAt: dateTimeParse,
              // imageUrl: value["imageUrl"],
              name: value["name"],
              deskripsi: value["deskripsi"],
              kategori: value["kategori"],
              alamat: value["alamat"],
            ),
          );
        },
      );

      // print("berhasil masukan data brou");
      notifyListeners();
    }
  }
}
