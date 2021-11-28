import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as _get;
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/user.dart';
import 'package:nurow/models/xray.dart';

import 'dio.dart';
import 'http.dart';

class DataService {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  final HttpService _httpService = HttpServiceImpl();

  // DataService() {
  //   _httpService.init();
  // }

  Future<Map> getImageUrl() async {
    // CollectionReference xrayImages = firestore.collection('xrays');

    Response imagesDoc =
        await Dio().get('http://185.132.38.189:3928/api/getxray');
    // await xrayImages.doc("XIrTPjoBgtHeC98TfdhQ").get();
    // print(imagesDoc);
    Map<String, dynamic> data = imagesDoc.data() as Map<String, dynamic>;
    return data;
  }

  Future<List<User>> getUserLogs() async {
    Response response = await _httpService.getRequest('/getuserlogs');
    final data = usersFromJson(response.data);
    return data;
  }

  Future<List<Xray>> getAllXrays(String patientId) async {
    var response = await _httpService
        .getRequest('/getxray', parameters: {"patientId": patientId});
    List<Xray> data = [];
    try {
      data = xraysFromJson(response.data);
    } catch (e) {
      _get.Get.snackbar(
        "Error",
        response.data.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
      return Future.error(e);
    }

    return data;
  }

  Future<dynamic> getXrayType(String id, String type) async {
    var response = await _httpService
        .getRequest('/getxray', parameters: {"id": id, "type": type});
    return response;
  }

  Future<Patient?> addPatient(Map<String, dynamic> data) async {
    Response response = await _httpService.post('/patientdata', data);
    Patient? returnData;
    try {
      returnData = Patient.fromJson(response.data);
    } catch (e) {
      _get.Get.snackbar(
        "Error",
        response.data.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
    }
    return returnData;
  }

  Future<Xray?> addXray(Map<String, dynamic> data) async {
    Response response = await _httpService.post('/addxray', data);
    Xray? returnData;
    try {
      returnData = Xray.fromJson(response.data);
    } catch (e) {
      _get.Get.snackbar(
        "Error",
        response.data.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
    }
    return returnData;
  }

  Future<dynamic> getPatient(String id) async {
    var response =
        await _httpService.getRequest('/patientdata', parameters: {"id": id});
    return response;
  }

  Future<List<Patient>> getAllPatients() async {
    Response response = await _httpService.getRequest('/patientdata');
    final data = patientsFromJson(response.data);
    debugPrint(data.toString());
    return data;
  }
}
