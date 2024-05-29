import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:secure_kare/model/report_model.dart';

class PoliceControler with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  List<Reports> userreport = [];
  Future fetchCompleint(String status) async {
    final snapshot = await db
        .collection('Reports')
        .where('reportstatus', isEqualTo: status)
        .get();

    userreport = snapshot.docs.map((e) {
      return Reports.fromJson(e.data());
    }).toList();
  }

  // Future fetchCompleint() async {
  //   return db.collection('UserReports').snapshots();
  // }
}
