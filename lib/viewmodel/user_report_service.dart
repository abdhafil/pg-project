import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:secure_kare/model/report_model.dart';

class UserReportService {
  final db = FirebaseFirestore.instance;
  String id = randomAlphaNumeric(10);
  Future addUserreports(Reports userreportModel, uid, id) async {
    final doc = db.collection("Reports").doc(id);

    doc.set(userreportModel.toJson(doc.id));
  }
}
