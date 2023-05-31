import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_3/pages/detail_page.dart';
import 'package:project_3/pages/edit_alamat_page.dart';
import 'package:project_3/providers/alamats.dart';
import 'package:project_3/theme/theme.dart';
import 'package:provider/provider.dart';

import '../providers/lapaks.dart';

class AlamatPage extends StatefulWidget {
  static const routeName = "/alamat-page";
  AlamatPage({super.key});

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Alamats>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    isInit = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alamatProvider = Provider.of<Alamats>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: const Text(
          'Alamat saya',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 15),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: (alamatProvider.jumlahYgBaru == 0)
          ?
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const SizedBox(
          //       height: 30,
          //     ),
          //     Align(
          //       alignment: Alignment.center,
          //       child: SizedBox(
          //         height: 40,
          //         width: 355,
          //         child: ElevatedButton(
          //           onPressed: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return const EditAlamatPage();
          //                 },
          //               ),
          //             );
          //           },
          //           style: ElevatedButton.styleFrom(
          //             padding: const EdgeInsets.all(0),
          //             backgroundColor: Colors.white,
          //             side: BorderSide(color: greyColor, width: 1.3),
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.only(left: 13),
          //             child: Row(
          //               children: [
          //                 const SizedBox(width: 60),
          //                 const Icon(
          //                   Icons.add,
          //                   color: Colors.purple,
          //                 ),
          //                 const SizedBox(width: 40),
          //                 const Text(
          //                   'Tambah alamat',
          //                   style: TextStyle(color: Colors.purple, fontSize: 16),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          // const SizedBox(height: 50),

          Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 40,
                width: 90,
                child: const Center(child: Text('No data')),
              ),
            )
          : ListView.builder(
              itemCount: (alamatProvider.jumlahYgBaru),
              itemBuilder: (context, index) {
                var id = alamatProvider.allalamat[index].id;
                return Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(
                      //   const EditAlamatPage().routeName,
                      //   arguments: id,
                      // );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const EditAlamatPage();
                            },
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.fromWindowPadding(
                              WindowPadding.zero, 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 8, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.purple,
                                        ),
                                        const Text(
                                          'Lapak Usaha',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.purple),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.purple[300],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Utama',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    alamatProvider.allalamat[index].name!,
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    alamatProvider.allalamat[index].nomtelp!,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    '', // alamatProvider.allalamat[index].provinsi!,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, bottom: 10),
                                  child: Text(
                                    '', //'Kec ${alamatProvider.allalamat[index].kecamatan} kabupaten ${alamatProvider.allalamat[index].kabupaten}',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, bottom: 10),
                                  child: Text(
                                    '', //'Kec ${alamatProvider.allalamat[index].kecamatan} kabupaten ${alamatProvider.allalamat[index].kabupaten}',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, bottom: 10),
                                  child: Text(
                                    '', //'Kec ${alamatProvider.allalamat[index].kecamatan} kabupaten ${alamatProvider.allalamat[index].kabupaten}',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
