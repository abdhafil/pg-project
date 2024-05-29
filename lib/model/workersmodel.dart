class WorkersModel {
  String? workersname;
  String? workersplace;
  String? workersage;
  String? workersemail;
  String? workerspassword;
  String? workerimage;
  String? id;
  String agencyId;
  WorkersModel(
      {required this.workersname,
      required this.agencyId,
      required this.workersplace,
      required this.workersage,
      required this.workersemail,
      required this.workerspassword,
      required this.workerimage,
      this.id});

  Map<String, dynamic> toJson(docId) => {
        "workersname": workersname,
        "workersplace": workersplace,
        "workersage": workersage,
        "workersemail": workersemail,
        "workerspassword": workerspassword,
        "workerimage": workerimage,
        "agencyId":agencyId,
        "id": docId
      };
  factory WorkersModel.fromJson(Map<String, dynamic> json) {
    return WorkersModel(
      id: json["id"],
      agencyId:json["agencyId"],
      workersname: json["workersname"],
      workersplace: json["workersplace"],
      workersage: json["workersage"],
      workersemail: json["workersemail"],
      workerspassword: json["workerspassword"],
      workerimage: json["workerimage"],
    );
  }
}
