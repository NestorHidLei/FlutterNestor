import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/kirbi.jpg'),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileStats(count: "1,026", label: "Publicaciones"),
                        ProfileStats(count: "859", label: "Seguidores"),
                        ProfileStats(count: "211", label: "Seguidos"),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Descripción del perfil de Instagram
          const Text(
            "Néstor Hidalgo Leiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Descripción ig."),
          const SizedBox(height: 5),
          const Text(
            "correo@ejemplo.com",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(height: 10),
          // Botón para editar perfil
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de editar perfil
              },
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
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  final String count;
  final String label;

  const ProfileStats({Key? key, required this.count, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
