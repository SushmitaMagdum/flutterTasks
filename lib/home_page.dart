// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) - 130,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          height: 60,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15,
                                  spreadRadius: 1),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                hintText: 'Search',
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 18),
                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(15),
                                  width: 18,
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        IconData(0xe05a, fontFamily: 'MaterialIcons'),
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        print("cart btn pressed");
                      },
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        IconData(0xf528, fontFamily: 'MaterialIcons'),
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        print("notification btn pressed");
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Products For You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  children: List.generate(
                    4,
                    (index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/watch.png",
                                height: 80,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Savils Watch",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      "\$1200",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Spacer(),
                                  Ink(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      onTap: () {
                                        print("save btn pressed..");
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 20.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   width: 30,
                                  //   height: 30,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     border: Border.all(color: Colors.grey),
                                  //     borderRadius: const BorderRadius.all(
                                  //         Radius.circular(20)),
                                  //   ),
                                  //   child: const Icon(
                                  //     Icons.favorite,
                                  //     color: Colors.grey,
                                  //     size: 20.0,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("Categories will show here",
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "A Summer Surprise",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 40, right: 15),
                      child: Text(
                        "Cashback 20%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Special For You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "See More",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Container(
                        width: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/smartphone.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Smart Phones',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: '\n 18 Brands'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Container(
                        // height: 200,
                        width: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/fashion.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Fashion',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: '\n 25 Brands'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Container(
                        // height: 200,
                        width: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/electronic.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.red,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Electronic Devices',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: '\n 30 Brands'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Container(
                        // height: 200,
                        width: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/jwell.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Watches',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: '\n 15 Brands'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//   alignment: Alignment.center,
//   padding: const EdgeInsets.all(15),
//   child: const Text(
//       "WELCOME TO HOME PAGE... \n You've successfully logged in...",
//       style: TextStyle(
//           color: Colors.black,
//           fontSize: 25,
//           fontStyle: FontStyle.italic)),
// ),
// Container(
//   height: 50,
//   width: 250,
//   decoration: BoxDecoration(
//       color: Colors.black, borderRadius: BorderRadius.circular(20)),
//   child: TextButton(
//     onPressed: () async {
//       final SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       sharedPreferences.remove('email');
//       // ignore: use_build_context_synchronously
//       Navigator.pop(context);
//     },
//     child: const Text(
//       'Logout',
//       style: TextStyle(color: Colors.white, fontSize: 25),
//     ),
//   ),
// ),
// ]),