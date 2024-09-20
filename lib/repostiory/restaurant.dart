

import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui';

import 'package:delivery_app_admin_panel/constant.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';



Future<bool> getIndividualRestaurant(String id) async {
  final response = await http.get(
    Uri.parse('$serverurl/restaurant/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    restaurant = jsonDecode(response.body)['data'];
    print(restaurant);
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}


Future<bool> createRestaurant(String name, String url) async {
  final response = await http.post(
    Uri.parse('$serverurl/restaurant/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'image_url': url,
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}

Future<String> uploadImage() async {
  var mediaData = await ImagePickerWeb.getImageAsBytes();
  Uint8List? _imageBytes;
  String? _imageName;
  if (mediaData != null) {
      _imageBytes = mediaData;  // Store image bytes
      _imageName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';  // Generate a name or use a static name
  }
  if (_imageBytes == null || _imageName == null) return "";

  var uri = Uri.parse('$serverurl/upload/');

  // Convert the Uint8List data into a multipart file for HTTP request
  var request = http.MultipartRequest('POST', uri);
  request.files.add(http.MultipartFile.fromBytes(
    'image',
    _imageBytes!,
    filename: _imageName,
  ));

  var response = await request.send();
  if (response.statusCode == 200) {
    var responseData = await http.Response.fromStream(response);
    var data = jsonDecode(responseData.body);
    print(data);
      return data['image_url'];  // Image URL from Django
  } else {
    return "";
    print('Failed to upload image. Status code: ${response.statusCode}');
  }
}


