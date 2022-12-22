import 'package:flutter/material.dart';

class Product {
  final String image, name;
  final int id;
  final IconData icon;
  final String time;
  Product({
    required this.id,
    required this.time,
    required this.icon,
    required this.image,
    required this.name,
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: "Maged",
    time: "8:00",
    image: "assets/images/images.png",
    icon: Icons.video_call_sharp,
  ),
  Product(
    id: 2,
    name: "Ahmed",
    time: "9:00",
    image: "assets/images/images.png",
    icon: Icons.call,
  ),
  Product(
    id: 3,
    name: "Nada",
    time: "10:00",
    image: "assets/images/images.png",
    icon: Icons.shield,
  ),
  Product(
    id: 4,
    name: "Mindy",
    time: "11:00",
    image: "assets/images/images.png",
    icon: Icons.video_call_sharp,
  ),
];
