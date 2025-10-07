import 'package:flutter/material.dart';
import 'package:side_menu_animation/side_menu_animation.dart';
import 'widgets/image_carousel.dart';
import 'models/app_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andara-Med',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SideMenuScreen(),
    );
  }
}

class SideMenuScreen extends StatefulWidget {
  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  final _index = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideMenuAnimation(
        appBarBuilder: (showMenu) => AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black), onPressed: showMenu),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: ValueListenableBuilder<int>(
            valueListenable: _index,
            builder: (_, value, __) => Text(
                AppSections.getSectionName(_index.value),
                style: TextStyle(color: Colors.black)),
          ),
        ),
        // Generar views automáticamente desde AppSections
        views: AppSections.sections
            .map((section) => ImageCarousel(images: section.images))
            .toList(),
        // Generar items del menú automáticamente desde AppSections
        items: [
          Container(), // First empty container
          ...AppSections.sections.map(
            (section) => Container(
              child: Column(
                children: [
                  Icon(section.icon, color: Colors.white, size: 50)
                ],
              ),
            ),
          ),
        ],
        selectedColor: Color(0xFFFF595E),
        unselectedColor: Color(0xFF1F2041),
        tapOutsideToDismiss: true,
        scrimColor: Colors.black45,
        onItemSelected: (value) {
          setState(() {
            _index.value = value;
          });
        },
      ),
    );
  }
}
