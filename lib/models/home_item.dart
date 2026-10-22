import 'package:flutter/material.dart';

class HomeItem {
  final int id;
  final String title;
  final String subtitle;
  final String imagePath;
  final String iconName;

  const HomeItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.iconName,
  });
}