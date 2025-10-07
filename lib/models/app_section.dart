import 'package:flutter/material.dart';

/// Modelo de datos para representar una sección de la aplicación
class AppSection {
  final String name;
  final IconData icon;
  final List<String> images;

  const AppSection({
    required this.name,
    required this.icon,
    required this.images,
  });
}

/// Clase que contiene todas las secciones de la aplicación
/// Esta es una forma más avanzada de organizar el código para facilitar la generación automática
class AppSections {
  static final List<AppSection> sections = [
    AppSection(
      name: 'Ecommerce',
      icon: Icons.shopping_cart_checkout,
      images: [
        'assets/images/e1.png',
        'assets/images/e2.png',
        'assets/images/e3.png',
        'assets/images/e4.png',
        'assets/images/e5.png',
        'assets/images/e6.png',
        'assets/images/e7.png',
        'assets/images/e8.png',
        'assets/images/e9.png',
        'assets/images/e10.png',
      ],
    ),
    AppSection(
      name: 'Events',
      icon: Icons.calendar_month,
      images: [
        'assets/images/ev1.png',
        'assets/images/ev2.png',
        'assets/images/ev3.png',
      ],
    ),
    AppSection(
      name: 'Routing',
      icon: Icons.route,
      images: [
        'assets/images/r1.png',
        'assets/images/r2.png',
        'assets/images/r3.png',
        'assets/images/r4.png',
      ],
    ),
    AppSection(
      name: 'Monitor',
      icon: Icons.monitor_heart,
      images: [
        'assets/images/m1.png',
      ],
    ),
    AppSection(
      name: 'Education',
      icon: Icons.cast_for_education,
      images: [
        'assets/images/ed1.png',
        'assets/images/ed2.png',
        'assets/images/ed3.png',
        'assets/images/ed4.png',
        'assets/images/ed5.png',
        'assets/images/ed6.png',
      ],
    ),
    AppSection(
      name: 'Points',
      icon: Icons.leaderboard_outlined,
      images: [
        'assets/images/p1.png',
        'assets/images/p2.png',
        'assets/images/p3.png',
        'assets/images/p4.png',
      ],
    ),
    AppSection(
      name: 'ChatBot',
      icon: Icons.chat,
      images: [
        'assets/images/c1.png',
        'assets/images/c2.png',
        'assets/images/c3.png',
        'assets/images/c4.png',
        'assets/images/c5.png',
      ],
    ),
  ];
  
  /// Obtener el nombre de una sección por índice
  static String getSectionName(int index) {
    if (index >= 0 && index < sections.length) {
      return sections[index].name;
    }
    return sections.first.name;
  }
  
  /// Obtener todas las imágenes organizadas en listas
  static List<List<String>> getAllImages() {
    return sections.map((section) => section.images).toList();
  }
}
