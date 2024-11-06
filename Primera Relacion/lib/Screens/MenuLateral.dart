import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/screens.dart';

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
          // Enlace 1
          ListTile(
            title: const Text("Enlace 1", style: TextStyle(color: Colors.white)),
            tileColor: Colors.green,
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace1())); // Navega a Enlace1
            },
          ),
          // Enlace 2
          ListTile(
            title: const Text("Enlace 2"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace2())); // Navega a Enlace2
            },
          ),
          // Enlace 3
          ListTile(
            title: const Text("Enlace 3"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace3())); // Navega a Enlace3
            },
          ),
          // Enlace 4
          ListTile(
            title: const Text("Enlace 4"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace4())); // Navega a Enlace4
            },
          ),
          // Enlace 5
          ListTile(
            title: const Text("Enlace 5"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace5())); // Navega a Enlace5
            },
          ),
          // Pirámide
          ListTile(
            title: const Text("Piramide"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Piramide())); // Navega a Piramide
            },
          ),
          // Contador
          ListTile(
            title: const Text("Contador"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ContadorPage())); // Navega a ContadorPage
            },
          ),
          // Instagram
          ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage())); // Navega a ProfilePage
            },
          ),
          // Filas y Columnas
          ListTile(
            title: const Text("Filas y Columnas"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FilasColumnas())); // Navega a FilasColumnas
            },
          ),
          // Juego de clicks
          ListTile(
            title: const Text("Juego de clicks"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Enlace9())); // Navega a Enlace9
            },
          ),
        ],
      ),
    );
  }
}
