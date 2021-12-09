import 'package:flutter/material.dart';
import 'package:main/model/cliente.dart';
import 'package:main/services/cliente_service.dart';
import 'dart:convert';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _nombre = '';
  String _correo = '';
  String _zip = '';
  String _telf1 = '';
  String _telf2 = '';
  String _pais = '';
  String _direccion = '';

  bool _nombreVal = false;
  bool _correoVal = false;
  bool _zipVal = false;
  bool _telf1Val = false;
  bool _telf2Val = false;
  bool _paisVal = false;
  bool _direccionVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _crearNombreInput(),
              const SizedBox(
                height: 30,
              ),
              _crearCorreoInput(),
              const SizedBox(
                height: 30,
              ),
              _crearZipInput(),
              const SizedBox(
                height: 30,
              ),
              _crearTelf1Input(),
              const SizedBox(
                height: 30,
              ),
              _crearTelf2Input(),
              const SizedBox(
                height: 30,
              ),
              _crearPaisInput(),
              const SizedBox(
                height: 30,
              ),
              _crearDireccionInput(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_nombre != '') {
            _nombreVal = false;
            if (_correo != '') {
              _correoVal = false;
              if (_pais != '') {
                _paisVal = false;
                ClienteService clienteService = ClienteService();

                Map<String, String> jsonG = {
                  "nombre": _nombre,
                  "correo": _correo,
                  "zip": _zip,
                  "telefono1": _telf1,
                  "telefono2": _telf2,
                  "pais": _pais,
                  "direccion": _direccion
                };

                clienteService.insertCliente(json.encode(jsonG));
              } else {
                _paisVal = true;
              }
            } else {
              _correoVal = true;
            }
          } else {
            _nombreVal = true;
          }
          setState(() {});
        },
        tooltip: 'Save',
        child: Icon(Icons.save),
      ),
    );
  }

  Widget _crearNombreInput() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar nombre del cliente',
            labelText: 'Nombre *',
            icon: Icon(Icons.public),
            errorText: _nombreVal ? 'Este campo es requerido.' : null,
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

  Widget _crearCorreoInput() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar correo del cliente',
            labelText: 'Correo *',
            icon: Icon(Icons.email),
            errorText: _correoVal ? 'Este campo es requerido.' : null,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _correo = value;
          });
        },
      ),
    );
  }

  Widget _crearZipInput() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar zip del cliente',
            labelText: 'ZIP',
            icon: Icon(Icons.directions),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _zip = value;
          });
        },
      ),
    );
  }

  Widget _crearTelf1Input() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar telefono 1 del cliente',
            labelText: 'Telefono 1',
            icon: Icon(Icons.phone),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _telf1 = value;
          });
        },
      ),
    );
  }

  Widget _crearTelf2Input() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar telefono 2 del cliente',
            labelText: 'Telefono 2',
            icon: Icon(Icons.phone),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _telf2 = value;
          });
        },
      ),
    );
  }

  Widget _crearPaisInput() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar pais del cliente',
            labelText: 'Pais *',
            icon: Icon(Icons.public),
            errorText: _paisVal ? 'Este campo es requerido.' : null,
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

  Widget _crearDireccionInput() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: 'Insertar direccion del cliente',
            labelText: 'Direccion',
            icon: Icon(Icons.directions),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) {
          setState(() {
            _direccion = value;
          });
        },
      ),
    );
  }
}
