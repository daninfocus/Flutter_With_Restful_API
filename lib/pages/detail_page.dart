import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/model/cliente.dart';
import 'package:main/pages/home_page.dart';
import 'package:main/services/cliente_service.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Cliente cliente = ModalRoute.of(context)!.settings.arguments as Cliente;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: _clientCard(cliente),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ClienteService clienteService = ClienteService();
          await clienteService.deleteCliente(int.parse(cliente.id));

          final value = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );

          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget _clientCard(Cliente cliente) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 9,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 70,
                  height: 70,
                  // decoration: BoxDecoration(
                  //   color: Colors.grey.withOpacity(.6),
                  // ),
                  child: Center(
                      child: FadeInImage(
                          image: NetworkImage(cliente.photo),
                          placeholder: AssetImage('assets/loading.png'))),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ID: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cliente.id),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nombre: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cliente.nombre),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Correo: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            cliente.correo,
                            style: TextStyle(
                                fontSize: 15, overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ZIP: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cliente.zip),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Telefono 1: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cliente.telefono1),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Telefono 2: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cliente.telefono2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pais: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cliente.pais),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Direccion: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(cliente.direccion),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
