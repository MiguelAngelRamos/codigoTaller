// To parse this JSON data, do
//
//     final users = usersFromMap(jsonString);

import 'dart:convert';

class Users {
    Users({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    int id;
    String name;
    String username;
    String email;
    Address address;
    String phone;
    String website;
    Company company;

    factory Users.fromJson(String str) => Users.fromMap(json.decode(str));
    
    factory Users.fromMap(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromMap(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromMap(json["company"]),
    );
}

class Address {
    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    String street;
    String suite;
    String city;
    String zipcode;
    Geo geo;

    factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromMap(json["geo"]),
    );

    Map<String, dynamic> toMap() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toMap(),
    };
}

class Geo {
    Geo({
        required this.lat,
        required this.lng,
    });

    String lat;
    String lng;

    factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    String name;
    String catchPhrase;
    String bs;

    factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
