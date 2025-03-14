import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Centrar el texto del título
          centerTitle: true,
          // Color de fondo del AppBar
          backgroundColor: Colors.blue,
          // Widget leading (por ejemplo, un icono)
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Acción al presionar el icono
            },
          ),
          title: Text('Lista de Clientes'),
        ),
        body: ClienteList(),
      ),
    );
  }
}

class ClienteList extends StatelessWidget {
  final Map<String, dynamic> datosClientes = {
    'cliente1': {
      'url_imagen':
          'https://raw.githubusercontent.com/ali-ledezma/imagenes_tabla/refs/heads/main/cliente1.jpg',
      'nombre': 'Juan',
      'apellido': 'Pérez',
      'correo': 'juan.perez@example.com',
      'rfc': 'ABC123456789',
      'id_cliente': '1',
    },
    'cliente2': {
      'url_imagen':
          'https://raw.githubusercontent.com/ali-ledezma/imagenes_tabla/refs/heads/main/cliente2.jpg',
      'nombre': 'María',
      'apellido': 'Gómez',
      'correo': 'maria.gomez@example.com',
      'rfc': 'DEF987654321',
      'id_cliente': '2',
    },
    'cliente3': {
      'url_imagen':
          'https://raw.githubusercontent.com/ali-ledezma/imagenes_tabla/refs/heads/main/cliente3.png',
      'nombre': 'Carlos',
      'apellido': 'Rodríguez',
      'correo': 'carlos.rodriguez@example.com',
      'rfc': 'GHI135792468',
      'id_cliente': '3',
    },
    'cliente4': {
      'url_imagen':
          'https://raw.githubusercontent.com/ali-ledezma/imagenes_tabla/refs/heads/main/cliente4.png',
      'nombre': 'Laura',
      'apellido': 'López',
      'correo': 'laura.lopez@example.com',
      'rfc': 'JKL864297531',
      'id_cliente': '4',
    },
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> clientesListTiles = [];

    datosClientes.forEach((key, cliente) {
      clientesListTiles.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cliente['url_imagen']),
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: '${cliente['nombre']} ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: cliente['apellido'],
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
            subtitle: Text(cliente['correo']),
          ),
        ),
      );
    });

    return Column(
      children: clientesListTiles,
    );
  }
}
