import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenAgencies extends StatelessWidget {
  const ScreenAgencies({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference agent =
        FirebaseFirestore.instance.collection("AGENT");
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenCompamw();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Agencies",
          style: GoogleFonts.merriweather(
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
        stream: agent.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot agentsnap = snapshot.data!.docs[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(workprovider.person),
                ),
                title: Text(
                  agentsnap['agencyname'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
