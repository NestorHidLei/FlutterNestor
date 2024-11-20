import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/utils/instagram/ProfilePage.dart'; 

class InstagramProfileClone extends StatelessWidget {
  const InstagramProfileClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(), // Página de perfil
    );
  }
}
