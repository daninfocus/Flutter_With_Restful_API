import 'dart:convert';
import 'dart:io';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:http/http.dart';
import 'package:image/image.dart' as img;
import 'package:main/services/cliente_service.dart';

import 'model/cliente.dart';

void main(List<String> args) async {
  ClienteService clienteService = ClienteService();
  List<Cliente> lista = await clienteService.getAllClientes();
  lista.forEach((element) async {
    Response response = await get(Uri.parse(element.photo));

    //final data = File(element.photo).readAsBytesSync();
    final image = img.decodeImage(response.bodyBytes.toList());
    final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);
    Map<String, String> jsonG = {"hash": blurHash.hash};

    await clienteService.insertPhotoHash(
        json.encode(jsonG), int.parse(element.id));
  });
}
