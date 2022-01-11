import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/user.dart';
import 'package:nurow/models/xray.dart';

class DataService extends GetConnect {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Patient.fromJson(map);
    //   if (map is List) {
    //     return map.map((item) => Patient.fromJson(item)).toList();
    //   }
    // };
    httpClient.baseUrl = 'http://185.132.38.189:3928/api';
  }

  // DataService() {
  //   _httpService.init();
  // }

  Future<Map> getImageUrl() async {
    // CollectionReference xrayImages = firestore.collection('xrays');

    Response imagesDoc = await get('http://185.132.38.189:3928/api/getxray');
    // await xrayImages.doc("XIrTPjoBgtHeC98TfdhQ").get();
    // print(imagesDoc);
    Map<String, dynamic> data = imagesDoc.body as Map<String, dynamic>;
    return data;
  }

  Future<List<User>> getUserLogs() async {
    Response response = await get('http://185.132.38.189:3928/api/getuserlogs');
    final data = usersFromJson(response.body);
    return data;
  }

  Future<List<Xray>> getAllXrays(String patientId) async {
    var response = await get('http://185.132.38.189:3928/api/getxray',
        query: {"patientId": patientId});
    List<Xray> data = [];
    try {
      data = xraysFromJson(response.body);
    } catch (e) {
      Get.snackbar(
        "Error",
        response.body.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
      return Future.error(e);
    }

    return data;
  }

  Future<dynamic> getXrayType(String id, String type) async {
    var response = await get('http://185.132.38.189:3928/api/getxray',
        query: {"id": id, "type": type});
    return response;
  }

  Future<Patient?> addPatient(Map<String, dynamic> data) async {
    Response response =
        await post('http://185.132.38.189:3928/api/patientdata', data);
    Patient? returnData;
    try {
      returnData = Patient.fromJson(response.body);
    } catch (e) {
      Get.snackbar(
        "Error",
        response.body.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
    }
    return returnData;
  }

  Future<Xray?> addXray(Map<String, dynamic> data) async {
    Response response =
        await post('http://185.132.38.189:3928/api/addxray', data);
    Xray? returnData;
    try {
      returnData = Xray.fromJson(response.body);
    } catch (e) {
      Get.snackbar(
        "Error",
        response.body.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
    }
    return returnData;
  }

  Future<dynamic> getPatient(String id) async {
    var response = await get('http://185.132.38.189:3928/api/patientdata',
        query: {"id": id});
    return response;
  }

  Future<List<Patient>> getAllPatients() async {
    Response response = await get('http://185.132.38.189:3928/api/patientdata');
    debugPrint(response.toString());
    debugPrint(response.bodyString);
    final data = patientsFromJson(response.body);
    return data;
  }
}
