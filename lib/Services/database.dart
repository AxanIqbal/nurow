import 'package:dio/dio.dart';

class DataService {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map> getImageUrl() async {
    // CollectionReference xrayImages = firestore.collection('xrays');

    Response imagesDoc =
        await Dio().get('http://185.132.38.189:3928/api/getxray');
    // await xrayImages.doc("XIrTPjoBgtHeC98TfdhQ").get();
    // print(imagesDoc);
    Map<String, dynamic> data = imagesDoc.data() as Map<String, dynamic>;
    return data;
  }

  Future<Map> getUserLogs() async {
    // var client = http.Client();
    // var data = await client.get(Uri.parse("http://127.0.0.1:5000/getuserlogs"));
    Response data = await Dio().get('185.132.38.189:3928/api/getuserlogs');
    // print('dio');
    // print(data.statusCode);
    // print(data.statusMessage);
    // print(data.data);
    // print(data);
    return data.data;
  }
}
