import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:main/model/cliente.dart';
import 'package:main/services/cliente_service.dart';
import 'package:octo_image/octo_image.dart';

class FilterPage extends StatefulWidget {
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    List<Cliente> clientes =
        ModalRoute.of(context)!.settings.arguments as List<Cliente>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes filtrado'),
      ),
      body: SingleChildScrollView(
          child: Column(children: _clienteCard(clientes))),
    );
  }

  List<Widget> _clienteCard(List<Cliente> lista) {
    List<Widget> listWidget = [];
    lista.forEach((element) {
      listWidget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'details', arguments: element);
          },
          child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 9,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                //width: 300,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      width: 70,
                      height: 70,
                      // decoration: BoxDecoration(
                      //   color: Colors.grey.withOpacity(.6),
                      // ),
                      child: Center(
                        child: OctoImage(
                          image: CachedNetworkImageProvider(element.photo),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            element.photoHash != null
                                ? element.photoHash
                                : 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                          ),
                          errorBuilder: OctoError.icon(color: Colors.red),
                          fit: BoxFit.cover,
                        ),
                        // child: FadeInImage(
                        //     image: NetworkImage(element.photo),
                        //     placeholder: AssetImage('assets/loading.png'))
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(element.nombre),
                          Text(
                            element.correo,
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(element.pais)
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ));
    });
    return listWidget;
  }
}
