import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  Widget _searchbar() {
    return Container(
      height: 50,
      width: 320,
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              size: 26,
            ),
            fillColor: const Color(
              0xffe4e4e4,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _hotel({
    required String image,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 330,
            decoration: BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '\$$price',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Color(0xffdf842b),
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.sort,
          size: 35,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Center(
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/3.jpg',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello flutter baba",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Where are you going brou",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _searchbar(),
                    Container(
                      height: 47,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffdf842b),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hotel near you",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _hotel(
                        image: 'assets/1.jpg',
                        title: 'ada aja',
                        subtitle: 'Dimana mana ',
                        price: '60',
                      ),
                      _hotel(
                        image: 'assets/1.jpg',
                        title: 'ada aja',
                        subtitle: 'Dimana mana ',
                        price: '60',
                      ),
                      _hotel(
                        image: 'assets/1.jpg',
                        title: 'ada aja',
                        subtitle: 'Dimana mana ',
                        price: '60',
                      ),
                      _hotel(
                        image: 'assets/1.jpg',
                        title: 'ada aja',
                        subtitle: 'Dimana mana ',
                        price: '60',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Nearby you",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                      _hotel(
                        image: 'assets/4.jpg',
                        title: 'Zhecober car wash',
                        subtitle: 'Sindang ',
                        price: '30',
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shop,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'home'),
          ]),
    );
  }
}
