
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Facebook Header
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Text(
                      "facebook",
                      style: TextStyle(
                        color: Color(0xFF1877F2),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.add_circle_outline, size: 28),
                    const SizedBox(width: 15),
                    const Icon(Icons.search, size: 28),
                    const SizedBox(width: 15),
                    const Icon(Icons.messenger_outline, size: 28),
                  ],
                ),
              ),

              // Navigation Icons
              const Divider(height: 1),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Color(0xFF1877F2), size: 28),
                  Icon(Icons.people_outline, size: 28),
                  Icon(Icons.ondemand_video, size: 28),
                  Icon(Icons.notifications_none, size: 28),
                  Icon(Icons.menu, size: 28),
                ],
              ),
              const Divider(height: 1),

              // What's on Your Mind
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/image/1.png"),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "What's on Your Mind?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                      size: 28,
                    ),
                  ],
                ),
              ),

              const Divider(thickness: 5, color: Color(0xFFEEEEEE)),

              // Stories
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      storyCard("assets/image/1.png", true),
                      storyCard("assets/image/2.png", false),
                      storyCard("assets/image/3.png", false),
                      storyCard("assets/image/5.png", false),
                    ],
                  ),
                ),
              ),

              const Divider(thickness: 5, color: Color(0xFFEEEEEE)),

              // First Post
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/image/1.png"),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Route",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "2 hrs · 🌍",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),

              Image.asset(
                "assets/image/route.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PostAction(icon: Icons.thumb_up_alt_outlined, text: "Like"),
                    PostAction(icon: Icons.mode_comment_outlined, text: "Comment"),
                    PostAction(icon: Icons.share_outlined, text: "Share"),
                  ],
                ),
              ),

              const Divider(thickness: 5, color: Color(0xFFEEEEEE)),

              // Second Post
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/image/1.png"),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "5 hrs · 🌍",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
              ),

              const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PostAction(icon: Icons.thumb_up_alt_outlined, text: "Like"),
                    PostAction(icon: Icons.mode_comment_outlined, text: "Comment"),
                    PostAction(icon: Icons.share_outlined, text: "Share"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Story Card
  Widget storyCard(String imagePath, bool isCreate) {
    return Container(
      width: 115,
      height: 190,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: isCreate
          ? Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF1877F2),
                child: Icon(Icons.add, color: Colors.white),
              ),
              const SizedBox(height: 4),
              const Text(
                "Create a Story",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      )
          : null,
    );
  }
}

// Post Action
class PostAction extends StatelessWidget {
  final IconData icon;
  final String text;

  const PostAction({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
