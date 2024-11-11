import 'package:flutter/material.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

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

  @override
  void initState() {
    super.initState();
    // Inicializamos el PageController
  }

  // Limpiamos el PageController cuando se destruye el widget
  @override
  void dispose() {
    super.dispose();
  }
      int currentIndexe = 0;
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
    
  void _goToPreviouse() {
    if (currentIndexe > 0) {
      setState(() {
        currentIndexe--;
      });
    }
  }

  void _goToNexte(int index) {
    if (currentIndexe < imagese.length - 1) {
      setState(() {
        currentIndexe++;
      });
    }
  }


  final List<String> imagesev = [
    'assets/images/ev1.png',
    'assets/images/ev2.png',
    'assets/images/ev3.png',

  ];



    int currentIndexev = 0;

  void _goToPreviousev() {
    if (currentIndexev > 0) {
      setState(() {
        currentIndexev--;
      });
    }
  }

  void _goToNextev(int index) {
    if (currentIndexev < imagesev.length - 1) {
      setState(() {
        currentIndexev++;
      });
    }
  }


    final List<String> imagesr = [
    'assets/images/r1.png',
    'assets/images/r2.png',
    'assets/images/r3.png',
    'assets/images/r4.png',

  ];


      int currentIndexr = 0;

  void _goToPreviousr() {
    if (currentIndexr > 0) {
      setState(() {
        currentIndexr--;
      });
    }
  }

  void _goToNextr(int index) {
    if (currentIndexr < imagesr.length - 1) {
      setState(() {
        currentIndexr++;
      });
    }
  }



    final List<String> imagesm = [
    'assets/images/m1.png',


  ];


      int currentIndexm = 0;

  void _goToPreviousm() {
    if (currentIndexm > 0) {
      setState(() {
        currentIndexm--;
      });
    }
  }

  void _goToNextm(int index) {
    if (currentIndexm < imagesm.length - 1) {
      setState(() {
        currentIndexm++;
      });
    }
  }



      final List<String> imagesed = [
    'assets/images/ed1.png',
    'assets/images/ed2.png',
    'assets/images/ed3.png',
    'assets/images/ed4.png',
    'assets/images/ed5.png',
    'assets/images/ed6.png',


  ];


      int currentIndexed = 0;

  void _goToPrevioused() {
    if (currentIndexed > 0) {
      setState(() {
        currentIndexed--;
      });
    }
  }

  void _goToNexted(int index) {
    if (currentIndexed < imagesed.length - 1) {
      setState(() {
        currentIndexed++;
      });
    }
  }



  
      final List<String> imagesp = [
    'assets/images/p1.png',
    'assets/images/p2.png',
    'assets/images/p3.png',
    'assets/images/p4.png',



  ];


      int currentIndexp = 0;

  void _goToPreviousp() {
    if (currentIndexp > 0) {
      setState(() {
        currentIndexp--;
      });
    }
  }

  void _goToNextp(int index) {
    if (currentIndexp < imagesp.length - 1) {
      setState(() {
        currentIndexp++;
      });
    }
  }


        final List<String> imagesc = [
    'assets/images/c1.png',
    'assets/images/c2.png',
    'assets/images/c3.png',
    'assets/images/c4.png',
    'assets/images/c5.png',



  ];


      int currentIndexc = 0;

  void _goToPreviousc() {
    if (currentIndexc > 0) {
      setState(() {
        currentIndexc--;
      });
    }
  }

  void _goToNextc(int index) {
    if (currentIndexc < imagesc.length - 1) {
      setState(() {
        currentIndexc++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                
          Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagese[currentIndexe]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPreviouse,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNexte(currentIndexe);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
            Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagesev[currentIndexev]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPreviousev,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNextev(currentIndexev);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),

            Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagesr[currentIndexr]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPreviousr,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNextr(currentIndexr);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),

              Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagesm[currentIndexm]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPreviousm,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNextm(currentIndexm);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),

              Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagesed[currentIndexed]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPrevioused,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNexted(currentIndexed);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),



                   Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagesp[currentIndexp]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPreviousp,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNextp(currentIndexp);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),



                   Stack(
            children: [
              // PageView para las imágenes
              Padding(
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 20, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(imagesc[currentIndexc]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              // Flecha izquierda
              Positioned(
                left: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: _goToPreviousc,
                  child: Icon(
                    Icons.arrow_left,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 20,
                top: size.height / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    var a = _goToNextc(currentIndexc);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 100,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
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
