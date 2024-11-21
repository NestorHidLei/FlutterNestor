import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';
import 'package:flutter_application_2/Screens/utils/instagram/ProfilePage.dart';

class InstagramProfileClone extends StatelessWidget {
  const InstagramProfileClone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
      ),
      drawer: const MenuLateral(),
      body: const ProfilePage(), // Página de perfil
    );
  }
}
