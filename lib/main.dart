import 'package:flutter/material.dart';
import 'package:latihan_dart_1/pages/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool statusCode = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         leading: const Icon(Icons.person),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 150,
//               height: 40,
//               child: CupertinoSwitch(
//                 value: statusCode,
//                 onChanged: (value) => setState(
//                   () {
//                     statusCode = !statusCode;
//                   },
//                 ),
//               ),
//             ),
//             if (statusCode == true)
//               Text("Swict on",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber,
//                   ))
//             else
//               Text(
//                 "Swict of",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.amber,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
