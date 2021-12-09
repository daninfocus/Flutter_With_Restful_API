// To parse this JSON data, do
//
//     final cliente = clienteFromMap(jsonString);

import 'dart:convert';

import 'package:http/http.dart';
import 'package:main/model/cliente.dart';

class ClienteService {
  Future<List<Cliente>> getAllClientes() async {
    final resp = await get(
        Uri.parse('http://192.168.1.42/API/index.php/clientes/cliente'));

    var result = Clientes.fromMap(json.decode('{"clientes":${resp.body}}'));

    return result.clientes;
  }

  Future<bool> deleteCliente(int id) async {
    final resp = await get(
        Uri.parse('http://192.168.1.42/API/index.php/clientes/cliente/$id'));
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> insertPhotoHash(String hash, int id) async {
    final resp = await post(
        Uri.parse('http://192.168.1.42/API/index.php/clientes/hash/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: hash);
    print(resp.body);
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<Cliente>> getClienteByNombre(String nombre) async {
    final resp = await get(
        Uri.parse('http://192.168.1.42/API/index.php/clientes/nombre/$nombre'));

    var result = Clientes.fromMap(json.decode('{"clientes":${resp.body}}'));

    return result.clientes;
  }

  Future<List<Cliente>> getClienteByPais(String pais) async {
    final resp = await get(
        Uri.parse('http://192.168.1.42/API/index.php/clientes/pais/$pais'));

    var result = Clientes.fromMap(json.decode('{"clientes":${resp.body}}'));

    return result.clientes;
  }

  Future<List<Cliente>> getClienteByBoth(String nombre, String pais) async {
    final resp = await get(Uri.parse(
        'http://192.168.1.42/API/index.php/clientes/both/$nombre/$pais'));

    var result = Clientes.fromMap(json.decode('{"clientes":${resp.body}}'));

    return result.clientes;
  }

  Future<bool> insertCliente(String json) async {
    final resp = await post(
        Uri.parse('http://192.168.1.42/API/index.php/clientes/cliente'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json);
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }
}
