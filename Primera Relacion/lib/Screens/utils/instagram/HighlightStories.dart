import 'package:flutter/material.dart';

class HighlightStories extends StatelessWidget {
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

  HighlightStories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
