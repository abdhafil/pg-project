import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenWorkers extends StatelessWidget {
  ScreenWorkers({super.key});
  final CollectionReference worker =
      FirebaseFirestore.instance.collection("ACCEPTED WORKERS");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) {
              //     return ScreenCompamw();
              //   },
              // ));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Workers",
          style: GoogleFonts.quicksand(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: StreamBuilder(
        stream: worker.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final DocumentSnapshot workerssnap = snapshot.data.docs[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(workprovider.adminprofile),
                  ),
                  title: Text(workerssnap["workersname"],
                      style: GoogleFonts.alata()),
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
          return Container(
            child: Text("No Workers Registered yet"),
          );
        },
      ),
    );
  }
}
