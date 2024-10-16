import 'package:flutter/material.dart';

void main() {
  runApp(InstagramProfileClone());
}

class InstagramProfileClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'alvarezdelayo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
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
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar_placeholder.png'), 
                  ),
                  SizedBox(width: 20),
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
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Editar perfil'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fernando Álvarez del Vayo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '"Nunca sabes lo que te depara el futuro".',
                  ),
                  Text(
                    'faqsandroid.com',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                storyHighlight("Nuevo"),
                storyHighlight("Pilotando"),
                storyHighlight("Praga y Bu..."),
                storyHighlight("Arquitectura"),
                storyHighlight("Retratos"),
              ],
            ),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 9, // Número de imágenes (por ejemplo)
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300], // Placeholder para imágenes
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget profileStats(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget storyHighlight(String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300], // Placeholder para imagen del story
          child: Icon(Icons.add, size: 30),
        ),
        SizedBox(height: 5),
        Text(label, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
