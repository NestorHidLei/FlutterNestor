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
              Navigator.pushNamed(context, AppRoutes.enlace1); // Usa la ruta de AppRoutes
            },
          ),
          // Enlace 2
          ListTile(
            title: const Text("Enlace 2"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.enlace2); // Usa la ruta de AppRoutes
            },
          ),
          // Enlace 3
          ListTile(
            title: const Text("Enlace 3"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.enlace3); // Usa la ruta de AppRoutes
            },
          ),
          // Enlace 4
          ListTile(
            title: const Text("Enlace 4"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.enlace4); // Usa la ruta de AppRoutes
            },
          ),
          // Enlace 5
          ListTile(
            title: const Text("Enlace 5"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.enlace5); // Usa la ruta de AppRoutes
            },
          ),
          // Pirámide
          ListTile(
            title: const Text("Piramide"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.piramide); // Usa la ruta de AppRoutes
            },
          ),
          // Contador
          ListTile(
            title: const Text("Contador"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.contadorApp); // Usa la ruta de AppRoutes
            },
          ),
          // Instagram
          ListTile(
            title: const Text("Instagram"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.instagram); // Usa la ruta de AppRoutes
            },
          ),
          // Filas y Columnas
          ListTile(
            title: const Text("Filas y Columnas"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.filasColumnas); // Usa la ruta de AppRoutes
            },
          ),
          // Juego de clicks
          ListTile(
            title: const Text("Juego de clicks"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.enlace9); // Usa la ruta de AppRoutes
            },
          ),
          ListTile(
            title: const Text("Juego de cartas"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.sieteYMedia); // Usa la ruta de AppRoutes
            },
          ),
          ListTile(
            title: const Text("Formulario"),
            onTap: () {
              Navigator.of(context).pop(); // Cierra el Drawer
              Navigator.pushNamed(context, AppRoutes.Formulario); // Usa la ruta de AppRoutes
            },
          ),
        ],
      ),
    );
  }
}
