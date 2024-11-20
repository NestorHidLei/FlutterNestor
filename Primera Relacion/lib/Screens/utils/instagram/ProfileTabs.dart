import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  final TabController tabController;

   ProfileTabs({super.key, required this.tabController});

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

  final List<String> reelsPaths = [
    'assets/images/reel1.png',
    'assets/images/reel2.png',
    'assets/images/reel3.png',
    'assets/images/reel4.png',
  ];

  final List<String> likedPosts = [
    'assets/images/walter.jpg',
    'assets/images/imagen1.jfif',
    'assets/images/imagen6.jfif',
    'assets/images/imagen7.jfif',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.grid_on)),
            Tab(icon: Icon(Icons.movie_creation)),
            Tab(icon: Icon(Icons.favorite_border)),
          ],
        ),
        Container(
          height: 400,
          child: TabBarView(
            controller: tabController,
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
              // Pestaña 3: Posts liked
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
    );
  }
}
