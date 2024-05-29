import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class AdminFeedBackAndSupport extends StatelessWidget {
  const AdminFeedBackAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminController>(builder: (context, controler, child) {
      return FutureBuilder(
          future: controler.fetchAllReports(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = controler.listofReporst;
            return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      color: Color.fromARGB(255, 255, 217, 104),
                    ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 0),
                    child: Container(
                      width: 200,
                      height: 270,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 236, 226, 134),
                          boxShadow: [BoxShadow(blurRadius: 1)]),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 1)]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/kanew.jpg"),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Harshal singh",
                                  style: GoogleFonts.signikaNegative(),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Manager",
                                  style: GoogleFonts.mavenPro(),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Text(
                                        "A building construction work is in progress",
                                        style: GoogleFonts.mavenPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Workers",
                                        style: GoogleFonts.mavenPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Text("Male Names :",
                                  style: GoogleFonts.mavenPro(
                                      fontWeight: FontWeight.bold)),
                              Text("Rohit",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Rajesh",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Ankit",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Rahul",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Vikram",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Arjun",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Karthik",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                              Text("Aditya",
                                  style: GoogleFonts.kanit(fontSize: 13)),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 78,
                              ),
                              Text("Female Names :",
                                  style: GoogleFonts.mavenPro(
                                      fontWeight: FontWeight.bold)),
                              Text("Priya", style: GoogleFonts.kanit()),
                              Text("Neha", style: GoogleFonts.kanit()),
                              Text("Pooja", style: GoogleFonts.kanit()),
                              Text("Arti", style: GoogleFonts.kanit()),
                              Text("Swati", style: GoogleFonts.kanit()),
                              Text("Neha", style: GoogleFonts.kanit()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 220),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.location_solid),
                                Text(
                                  "Manjeri",
                                  style: GoogleFonts.langar(),
                                ),
                                Text(","),
                                Text(
                                  "Anakayam",
                                  style: GoogleFonts.langar(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data.length);
          });
    });
  }
}
