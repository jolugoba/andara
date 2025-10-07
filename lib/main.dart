import 'package:flutter/material.dart';
import 'package:side_menu_animation/side_menu_animation.dart';
import 'widgets/image_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  // Definición de listas de imágenes para cada sección
  final List<String> imagese = [
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
  ];

  final List<String> imagesev = [
    'assets/images/ev1.png',
    'assets/images/ev2.png',
    'assets/images/ev3.png',
  ];

  final List<String> imagesr = [
    'assets/images/r1.png',
    'assets/images/r2.png',
    'assets/images/r3.png',
    'assets/images/r4.png',
  ];

  final List<String> imagesm = [
    'assets/images/m1.png',
  ];

  final List<String> imagesed = [
    'assets/images/ed1.png',
    'assets/images/ed2.png',
    'assets/images/ed3.png',
    'assets/images/ed4.png',
    'assets/images/ed5.png',
    'assets/images/ed6.png',
  ];

  final List<String> imagesp = [
    'assets/images/p1.png',
    'assets/images/p2.png',
    'assets/images/p3.png',
    'assets/images/p4.png',
  ];

  final List<String> imagesc = [
    'assets/images/c1.png',
    'assets/images/c2.png',
    'assets/images/c3.png',
    'assets/images/c4.png',
    'assets/images/c5.png',
  ];

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
                _index.value == 1 ? "Ecommerce" :   _index.value == 2 ? "Events" :   _index.value == 3 ? "Routing" :   _index.value == 4 ? "Monitor" :   _index.value == 5 ? "Education" :   _index.value == 6 ? "Points" :  _index.value == 7 ? "ChatBot" :  "Ecommerce".toString(),
                style: TextStyle(color: Colors.black)),
          ),
        ),
        views: [
          ImageCarousel(images: imagese),
          ImageCarousel(images: imagesev),
          ImageCarousel(images: imagesr),
          ImageCarousel(images: imagesm),
          ImageCarousel(images: imagesed),
          ImageCarousel(images: imagesp),
          ImageCarousel(images: imagesc),
        ],
        items: [
             Container(),
          Container(
              child: Column(
            children: [
              Icon(Icons.shopping_cart_checkout, color: Colors.white, size: 50)
            ],
          )),
              Container(
              child: Column(
            children: [
              Icon(Icons.calendar_month, color: Colors.white, size: 50)
            ],
          )),
                 Container(
              child: Column(
            children: [
              Icon(Icons.route, color: Colors.white, size: 50)
            ],
          )),
                    Container(
              child: Column(
            children: [
              Icon(Icons.monitor_heart, color: Colors.white, size: 50)
            ],
          ))
          ,
                     Container(
              child: Column(
            children: [
              Icon(Icons.cast_for_education, color: Colors.white, size: 50)
            ],
          )),
                      Container(
              child: Column(
            children: [
              Icon(Icons.leaderboard_outlined, color: Colors.white, size: 50)
            ],
          )),
                       Container(
              child: Column(
            children: [
              Icon(Icons.chat, color: Colors.white, size: 50)
            ],
          ))
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
