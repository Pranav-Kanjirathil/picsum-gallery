import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:picsum/models/photo_model.dart';

class PicsumApi {
  Future<List<PhotoModel>> picsumApi() async {
    try {
      final String uri = 'https://picsum.photos/v2/list';
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map((item) => PhotoModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
