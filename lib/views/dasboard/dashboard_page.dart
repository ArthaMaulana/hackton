// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day2/bloc/auth/auth_bloc.dart';
import 'package:flutter_day2/bloc/request/request_bloc.dart';
import 'package:flutter_day2/views/auth/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/const.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final String profileImageUrl = "assets/images/img_profile_pict.jpg";

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  @override
  void initState() {
    getToken().then(
      (value) {
        context.read<RequestBloc>().add(OnGetRequest(token: value ?? ""));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutWaiting) {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              });
        }
        if (state is SignOutError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("gagal"),
                );
              });
        }
        if (state is SignOutSucces) {
          {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          }
        }
      },
      child: Scaffold(
        backgroundColor: bodyBackgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: appBarBackgroundColor,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: cardBackgroundColor,
          ),
        ),
        appBar: AppBar(
          leading: ModalRoute.of(context)?.canPop ?? false
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: (Platform.isAndroid)
                      ? const Icon(Icons.arrow_back)
                      : const Icon(Icons.arrow_back_ios),
                )
              : Container(),
          shadowColor: appBarBackgroundColor,
          // elevation: 5,
          backgroundColor: appBarBackgroundColor,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(OnSignOut());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: GoogleFonts.acme(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appBarBackgroundColor)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          centerTitle: true,
          title: Text(
            "Dashboard",
            style: GoogleFonts.acme(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: cardBackgroundColor)),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 5,
                  color: appBarBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: height * 0.15,
                      width: width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(profileImageUrl),
                                radius: 40,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          const Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nama: Artha Maulana Rahman',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: cardBackgroundColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Unit: Politeknik Negeri Lampung',
                                  style: TextStyle(
                                      color: cardBackgroundColor, fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Job: Programmer',
                                  style: TextStyle(
                                      color: cardBackgroundColor, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(children: [
                        Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: appBarBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "Waiting",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: cardBackgroundColor),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                              child: BlocBuilder<RequestBloc, RequestState>(
                            builder: (context, state) {
                              if (state is GetRequestWaiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is GetRequestSuccess) {
                                return Text(
                                  state.responseGetRequest.waiting.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: appBarBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: appBarBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          )),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "Approved",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cardBackgroundColor),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                                child: BlocBuilder<RequestBloc, RequestState>(
                              builder: (context, state) {
                                if (state is GetRequestWaiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetRequestSuccess) {
                                  return Text(
                                    state.responseGetRequest.approved
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                } else {
                                  return const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                              },
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "In Progress",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cardBackgroundColor),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                                child: BlocBuilder<RequestBloc, RequestState>(
                              builder: (context, state) {
                                if (state is GetRequestWaiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetRequestSuccess) {
                                  return Text(
                                    state.responseGetRequest.waiting.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                } else {
                                  return const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                              },
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(children: [
                        Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: appBarBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "Fisihed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: cardBackgroundColor),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                              child: BlocBuilder<RequestBloc, RequestState>(
                            builder: (context, state) {
                              if (state is GetRequestWaiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is GetRequestSuccess) {
                                return Text(
                                  state.responseGetRequest.waiting.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: appBarBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: appBarBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          )),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "Rejected",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cardBackgroundColor),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                                child: BlocBuilder<RequestBloc, RequestState>(
                              builder: (context, state) {
                                if (state is GetRequestWaiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetRequestSuccess) {
                                  return Text(
                                    state.responseGetRequest.approved
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                } else {
                                  return const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                              },
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: appBarBackgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: cardBackgroundColor),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                                child: BlocBuilder<RequestBloc, RequestState>(
                              builder: (context, state) {
                                if (state is GetRequestWaiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is GetRequestSuccess) {
                                  return Text(
                                    state.responseGetRequest.waiting.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                } else {
                                  return const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: appBarBackgroundColor,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                              },
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  endIndent: width * 0.07,
                  indent: width * 0.07,
                  thickness: 1,
                  color: cardBackgroundColor,
                ),
                Text(
                  "Your Last Request",
                  style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: cardBackgroundColor)),
                ),
                Divider(
                  endIndent: width * 0.07,
                  indent: width * 0.07,
                  thickness: 1,
                  color: cardBackgroundColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: cardBackgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  // height: height * 0.17,
                  width: width * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "#1",
                        style: GoogleFonts.acme(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: appBarBackgroundColor)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.50,
                                  child: Text(
                                    "Servis Komputer",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.acme(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: appBarBackgroundColor)),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  child: Text(
                                    "8/8/2025",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.acme(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: appBarBackgroundColor)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                            Text(
                              "Requested by: Yuan Ferdinand",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.acme(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      color: appBarBackgroundColor)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: width * 0.7,
                              child: Text(
                                "Ini adalah description",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.acme(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: appBarBackgroundColor)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardStatus extends StatelessWidget {
  const CardStatus({
    super.key,
    required this.height,
    required this.width,
    required this.status,
    required this.value,
  });

  final double height;
  final double width;
  final String status;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: height * 0.12,
        width: width * 0.25,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.05,
              width: width * 0.25,
              decoration: const BoxDecoration(
                  color: appBarBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  status,
                  style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: cardBackgroundColor)),
                ),
              ),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.25,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "$value",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: appBarBackgroundColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
