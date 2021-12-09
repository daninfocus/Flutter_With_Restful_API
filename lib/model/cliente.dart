// To parse this JSON data, do
//
//     final clientes = clientesFromMap(jsonString);

import 'dart:convert';

class Clientes {
  Clientes({
    required this.clientes,
  });

  List<Cliente> clientes;

  factory Clientes.fromJson(String str) => Clientes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clientes.fromMap(Map<String, dynamic> json) => Clientes(
        clientes:
            List<Cliente>.from(json["clientes"].map((x) => Cliente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "clientes": List<dynamic>.from(clientes.map((x) => x.toMap())),
      };
}

class Cliente {
  Cliente(
      {required this.id,
      required this.nombre,
      required this.activo,
      required this.correo,
      required this.zip,
      required this.telefono1,
      required this.telefono2,
      required this.pais,
      required this.direccion,
      required this.photo,
      required this.photoHash,
      required this.selected});

  String id;
  String nombre;
  String activo;
  String correo;
  String zip;
  String telefono1;
  String telefono2;
  String pais;
  String direccion;
  String photo;
  String photoHash;
  bool selected;

  factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
      id: json["id"],
      nombre: json["nombre"],
      activo: json["activo"],
      correo: json["correo"],
      zip: json["zip"],
      telefono1: json["telefono1"],
      telefono2: json["telefono2"],
      pais: json["pais"],
      direccion: json["direccion"],
      photo: json["photo"],
      photoHash: json["photoHash"],
      selected: false);

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "activo": activo,
        "correo": correo,
        "zip": zip,
        "telefono1": telefono1,
        "telefono2": telefono2,
        "pais": pais,
        "direccion": direccion,
        "photo": photo,
        "photoHash": photoHash,
      };
  @override
  String toString() {
    return '$id $nombre $activo $correo$zip$telefono1$telefono2$pais$direccion$photo$photoHash$selected';
  }
}
