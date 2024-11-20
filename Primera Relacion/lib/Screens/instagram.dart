import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';

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

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Tres pestañas
  }

  // Lista de pares (título, ruta de imagen) para las historias destacadas
  final List<Map<String, String>> highlightItems = [
    {"title": "Nuevo", "image": "assets/images/sumar.png"},
    {"title": "Familia", "image": "assets/images/familia.jpeg"},
    {"title": "Amigos", "image": "assets/images/amigos.jpg"},
    {"title": "Trabajo", "image": "assets/images/trabajo.jpg"},
    {"title": "Aventura", "image": "assets/images/viajes.jpg"},
    {"title": "Pilotando", "image": "assets/images/imagen1.jfif"},
    {"title": "Praga", "image": "assets/images/imagen2.jfif"},
    {"title": "Bu...", "image": "assets/images/imagen3.jfif"},
    {"title": "Verano", "image": "assets/images/walter.jpg"},
    {"title": "Fiesta", "image": "assets/images/imagen4.jfif"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        drawer: const MenuLateral(),
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

              // Scroll horizontal con la lista de imágenes circulares y texto
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Habilitar desplazamiento horizontal
                child: Row(
                  children: List.generate(highlightItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(highlightItems[index]["image"]!),
                            backgroundColor: Colors.grey[300],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            highlightItems[index]["title"]!, 
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const Divider(),

              // Agregar las pestañas
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: Icon(Icons.movie_creation)), 
                  Tab(icon: Icon(Icons.favorite_border)),
                ],
              ),

              // Vista del contenido según la pestaña seleccionada
              Container(
                height: 400, 
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Pestaña 1: Publicaciones
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
                    // Pestaña 2: Reels 
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, 
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: reelsPaths.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 900, 
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(reelsPaths[index]),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey[300],
                          ),
                        );
                      },
                    ),
                    // Pestaña 3: Corazones (posts que diste like)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: likedPosts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(likedPosts[index]),
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
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: '',
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
                backgroundImage: AssetImage('assets/images/kirbi.jpg'),
              ),
              label: '',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {},
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
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

  // Lista de imágenes de los Reels
  final List<String> reelsPaths = [
    'assets/images/reel1.png',
    'assets/images/reel2.png',
    'assets/images/reel3.png',
    'assets/images/reel4.png',
  ];

  // Lista de imágenes de los posts que se dieron like
  final List<String> likedPosts = [
    'assets/images/walter.jpg',
    'assets/images/imagen1.jfif',
    'assets/images/imagen6.jfif',
    'assets/images/imagen7.jfif',
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
}
