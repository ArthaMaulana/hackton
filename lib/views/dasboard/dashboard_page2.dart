import 'package:flutter/material.dart';
import 'package:flutter_day2/config/const.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        foregroundColor: cardBackgroundColor,
        backgroundColor: appBarBackgroundColor,
        title: Text(
          "Dashboard",
          style: TextStyle(
              color: cardBackgroundColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(12),
            height: 45,
            width: 75,
            decoration: BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Logout",
                style: TextStyle(
                    color: appBarBackgroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                //shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(6)),
                elevation: 6,
                child: Container(
                  height: 150,
                  width: 380,
                  decoration: BoxDecoration(
                    color: appBarBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            //Image.assets(name), digunakan jika tipe beratribut widget
                            // image.network(src)
                            radius: 45,
                            backgroundImage: AssetImage(
                              "assets/images/img_profile_pict.jpg",
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nama : User",
                              style: TextStyle(
                                  color: cardBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Unit : SD 01 GULA PUTIH MATARAM",
                              style: TextStyle(
                                  color: cardBackgroundColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Job: Guru Bahasa Inggris",
                              style: TextStyle(
                                  color: cardBackgroundColor,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Waiting",
                                style: TextStyle(
                                    color: cardBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)))),
                        Container(
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  color: appBarBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Waiting",
                                style: TextStyle(
                                    color: cardBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)))),
                        Container(
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  color: appBarBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Waiting",
                                style: TextStyle(
                                    color: cardBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)))),
                        Container(
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  color: appBarBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Waiting",
                                style: TextStyle(
                                    color: cardBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)))),
                        Container(
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  color: appBarBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Waiting",
                                style: TextStyle(
                                    color: cardBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)))),
                        Container(
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  color: appBarBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Waiting",
                                style: TextStyle(
                                    color: cardBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)))),
                        Container(
                            child: Center(
                                child: Text(
                              "10",
                              style: TextStyle(
                                  color: appBarBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Divider(
                    color: cardBackgroundColor,
                    indent: 35,
                    endIndent: 35,
                    height: 25,
                    thickness: 1.8,
                  ),
                  Text(
                    "YOUR LAST REQUEST",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: cardBackgroundColor,
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    color: cardBackgroundColor,
                    indent: 35,
                    endIndent: 35,
                    height: 25,
                    thickness: 1.8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
