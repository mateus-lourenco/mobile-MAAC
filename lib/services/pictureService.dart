import 'package:http/http.dart' as http;
import 'package:maac_app/models/picture.dart';

class PictureService {
  final String baseURL = "http://localhost:8080";

  Future<List<Picture>> getPictures() async {
    final response = await http.get("$baseURL/api/pictures");

    if (response.statusCode == 200) {
      return pictureFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Picture>> getPictureById(int id) async {
    final response = await http.get("$baseURL/api/pictures/$id");

    if (response.statusCode == 200) {
      return pictureFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createPicture(Picture picture) async {
    final response = await http.post(
      "$baseURL/api/pictures",
      headers: {"content-type": "application/json"},
      body: pictureToJson(picture),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePicture(Picture picture) async {
    final response = await http.put(
      "$baseURL/api/pictures/${picture.id}",
      headers: {"content-type": "application/json"},
      body: pictureToJson(picture),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deletePicture(int id) async {
    final response = await http.delete(
      "$baseURL/api/pictures/$id",
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
