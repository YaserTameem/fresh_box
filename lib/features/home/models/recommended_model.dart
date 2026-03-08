import 'package:flutter/material.dart';

class RecommendedModel {
  final String image;
  final String name;
  final String disc;
  final double price;

  RecommendedModel({required this.image, required this.name, required this.disc, required this.price});

  static List<RecommendedModel> recommendedList = [
    RecommendedModel(
      name: 'Fresh Veg-Salad',
      image: 'assets/images/ph2.png',
      disc: 'Fresh Salad with Green\nberry',
      price: 8.99,
    ),
    RecommendedModel(
      name: 'Veg Biryani',
      image: 'assets/images/ph2.png',
      disc: 'Fresh Salad with Green\nberry',
      price: 12.26,
    ),
    RecommendedModel(
      name: 'Fresh Veg-Salad',
      image: 'assets/images/ph2.png',
      disc: 'Fresh Salad with Green\nberry',
      price: 52.22,
    ),
  ];
  static List<Color> cardColors = [Color(0x66EB6A58), Color(0xFFF0F3F9), Color(0xFFD1CFD5)];
}
