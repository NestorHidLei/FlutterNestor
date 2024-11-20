import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/MenuLateral.dart';
import 'package:flutter_application_2/Screens/utils/instagram/BottomNavBar.dart';
import 'package:flutter_application_2/Screens/utils/instagram/ProfileHeader.dart'; 
import 'package:flutter_application_2/Screens/utils/instagram/HighlightStories.dart'; 
import 'package:flutter_application_2/Screens/utils/instagram/ProfileTabs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(), 
            HighlightStories(), 
            const Divider(),
            ProfileTabs(tabController: _tabController), 
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), 
    );
  }
}
