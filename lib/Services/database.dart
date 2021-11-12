import 'package:dio/dio.dart';
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
    var response = await _httpService.getRequest('/getuserlogs');
    final data = usersFromJson(response.data);
    return data;
  }
}
