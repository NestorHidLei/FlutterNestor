import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramProfileClone());
}

class InstagramProfileClone extends StatelessWidget {
  const InstagramProfileClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Néstor.hidlei',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/kirbi.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            profileStats("1,026", "Publicaciones"),
                            profileStats("859", "Seguidores"),
                            profileStats("211", "Seguidos"),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Néstor Hidalgo Leiva",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Descripción ig.',
                    ),
                    Text(
                      'correo@ejemplo.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Editar perfil'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                storyHighlight("Nuevo", 'assets/images/sumar.png'),
                const SizedBox(width: 20),
                storyHighlight("Viajes", 'assets/images/viajes.jpg'),
                const SizedBox(width: 20),
                storyHighlight("Trabajo", 'assets/images/trabajo.jpg'),
                const SizedBox(width: 20),
                storyHighlight("Amigos", 'assets/images/amigos.jpg'),
                const SizedBox(width: 20),
                storyHighlight("Familia", 'assets/images/familia.jpeg'),
                const SizedBox(width: 10),
              ],
            ),
            const Divider(),

            // Aquí se reemplaza el Container con dos íconos
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.grid_on, size: 30),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.person, size: 30),
                  ],
                ),
              ],
            ),

           const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 185,
            color: Colors.black,
           ),

            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]), 
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[300],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '', // Label se puede dejar vacío o personalizar
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/kirbi.jpg'), // Cambia la ruta a tu imagen
            ),
            label: '',
          ),
        ],
        currentIndex: 0, // Índice del item seleccionado
        onTap: (index) {
          // Aquí puedes manejar el evento de selección de los ítems.
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }

  // Lista de imágenes para los 9 items
  final List<String> imagePaths = [
    'assets/images/niñoWither1.png',
    'assets/images/niñoWither2.png',
    'assets/images/niñoWither3.png',
    'assets/images/niñoWither4.png',
    'assets/images/niñoWither5.png',
    'assets/images/niñoWither6.png',
    'assets/images/niñoWither7.png',
    'assets/images/niñoWither8.png',
    'assets/images/niñoWither9.png',
  ];

  Widget profileStats(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget storyHighlight(String label, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath), // Cargar la imagen
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 5),
        Text(label, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
