import 'package:flutter/material.dart';
import 'package:main/model/cliente.dart';
import 'package:main/services/cliente_service.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _pais = '';
  String _nombre = '';
  @override
  Widget build(BuildContext context) {
    ClienteService clienteService = ClienteService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _crearBuscarPorNombre(),
                IconButton(
                    onPressed: () async {
                      List<Cliente> _clientes =
                          await clienteService.getClienteByNombre(_nombre);
                      _clientes.forEach((element) {
                        print(element);
                      });
                      Navigator.pushNamed(context, 'filter',
                          arguments: _clientes);
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                _crearBuscarPorPais(),
                IconButton(
                    onPressed: () async {
                      List<Cliente> _clientes =
                          await clienteService.getClienteByPais(_pais);
                      _clientes.forEach((element) {
                        print(element);
                      });
                      Navigator.pushNamed(context, 'filter',
                          arguments: _clientes);
                    },
                    icon: Icon(Icons.search))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<Cliente> _clientes =
              await clienteService.getClienteByBoth(_nombre, _pais);
          _clientes.forEach((element) {
            print(element);
          });
          Navigator.pushNamed(context, 'filter', arguments: _clientes);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.search),
      ),
    );
  }

  Widget _crearBuscarPorNombre() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Buscar por nombre',
            labelText: 'Nombre',
            icon: Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _nombre = value;
          });
        },
      ),
    );
  }

  Widget _crearBuscarPorPais() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Buscar por pais',
            labelText: 'Pais',
            icon: Icon(Icons.public),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _pais = value;
          });
        },
      ),
    );
  }
}
