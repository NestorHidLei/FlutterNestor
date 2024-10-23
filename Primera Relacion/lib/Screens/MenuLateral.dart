import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/ContadorApp.dart';
import 'package:flutter_application_2/Screens/Enlace4.dart';
import 'package:flutter_application_2/Screens/filas_columnas.dart';
import 'package:flutter_application_2/Screens/instagram.dart';
import 'Enlace1.dart';
import 'Enlace2.dart';
import 'Enlace3.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green[200],  // Fondo de color gris claro
      child: ListView(
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                top: -90, // Ajusta este valor para subir la imagen
                left: 0,
                right: 0,
                bottom: 9,
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/b2/d6/8e/b2d68e020f95e2f264a7890476656bbf.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const UserAccountsDrawerHeader(
                accountName: Text("Empresa"),
                accountEmail: Text("micorreo@gmail.com"),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Fondo transparente para no tapar la imagen
                ),
              ),
            ],
          ),
          Ink(
            color: Colors.green,
            child: ListTile(
              title: const Text(
                "Enlace 1",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Enlace1()));
              },
            ),
          ),
          ListTile(
            title: const Text("Enlace 2"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace2()));
            },
          ),
          ListTile(
            title: const Text("Enlace 3"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace3()));
            },
          ),
          ListTile(
            title: const Text("Enlace 4"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace4()));
            },
          ),
          ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage()));
            },
          ),
          ListTile(
            title: const Text("Filas y Columnas"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FilasColumnas()));
            },
          ),
          ListTile(
            title: const Text("Contador"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ContadorPage()));
            },
          ),
        ],
      ),
    );
  }
}




