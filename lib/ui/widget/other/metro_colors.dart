import 'dart:convert';

import 'package:flutter/material.dart';

Color getRandomColor(String title) {
  // List of colors
  List<Color> colors = [
    Colors.red,
    const Color(0xFF54BB6A),
    const Color(0xFF7CBE37),
    const Color(0xFF5E54BB),
     Color(0x40628F03),
    Colors.orange,
    Colors.blue,
    Colors.yellow,
  ];

  // Generate a hash code based on the title string and current date
  int hash = utf8.encode(title + DateTime.now().toString()).fold(
      0, (result, byte) => result + byte); // Hash code can be negative

  // Use the hash code to get a random index for the colors array
  int randomIndex = hash.abs() % colors.length;

  // Return the color at the random index
  return colors[randomIndex];
}