import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nurow/models/patient.dart';
import 'package:nurow/models/user.dart';

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

  Future<dynamic> getXrays() async {
    var response = await _httpService.getRequest('/getxray');
    return response;
  }

  Future<dynamic> getXrayType(String id, String type) async {
    var response = await _httpService
        .getRequest('/getxray', parameters: {"id": id, "type": type});
    return response;
  }

  Future<Response> addPatient(Map<String, dynamic> data) async {
    Response response = await _httpService.post('/patientdata', data);
    return response;
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
