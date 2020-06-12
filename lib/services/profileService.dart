import 'package:http/http.dart' as http;
import 'package:maac_app/models/profile.dart';

class ProfileService {
  final String baseURL = "http://localhost:8080";

  Future<List<Profile>> getProfiles() async {
    final response = await http.get("$baseURL/api/profiles");

    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Profile>> getProfileById(int id) async {
    final response = await http.get("$baseURL/api/profiles/$id");

    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProfile(Profile profile) async {
    final response = await http.post(
      "$baseURL/api/profiles",
      headers: {"content-type": "application/json"},
      body: profileToJson(profile),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile profile) async {
    final response = await http.put(
      "$baseURL/api/profiles/${profile.id}",
      headers: {"content-type": "application/json"},
      body: profileToJson(profile),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await http.delete(
      "$baseURL/api/profiles/$id",
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
