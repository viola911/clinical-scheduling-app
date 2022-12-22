import 'package:flutter/material.dart';

class Posts {
  final String image, detail;

  final IconData icon;

  Posts({
    required this.icon,
    required this.image,
    required this.detail,
  });
}

List<Posts> post = [
  Posts(
    detail: "Post 1",
    image: "assets/images/images.png",
    icon: Icons.favorite_border_rounded,
  ),
  Posts(
    detail: "Post 2",
    image: "assets/images/mental.jpg",
    icon: Icons.favorite_border_rounded,
  ),
  Posts(
    detail: "Post 3",
    image: "assets/images/postt.png",
    icon: Icons.favorite_border_rounded,
  ),
];
