import 'dart:convert';

class Profile {
  int id;
  String name;
  String phone;
  String cep;
  String address;
  String neighborhood;
  String complement;
  String user;
  String password;

  Profile(
      {this.id = 0,
      this.name,
      this.phone,
      this.cep,
      this.address,
      this.neighborhood,
      this.complement,
      this.user,
      this.password});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"],
        name: map["name"],
        phone: map["phone"],
        cep: map["cep"],
        address: map["address"],
        neighborhood: map["neighborhood"],
        complement: map["complement"],
        user: map["user"],
        password: map["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "cep": cep,
      "address": address,
      "neighborhood": neighborhood,
      "complement": complement,
      "user": user,
      "password": password
    };
  }

  @override
  String toString() {
    return "Profile{id: $id, name: $name, phone: $phone, cep: $cep, address: $address,"
        "neighborhood: $neighborhood, complement: $complement, user: $user,"
        "password: $password}";
  }
}

List<Profile> profileFromJson(String dataJson) {
  final profile = json.decode(dataJson);
  return List<Profile>.from(profile.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile profile) {
  final dataJson = profile.toJson();
  return json.encode(dataJson);
}
