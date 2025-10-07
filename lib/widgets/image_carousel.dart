import 'package:flutter/material.dart';

/// A reusable image carousel widget with navigation arrows
class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final EdgeInsets padding;

  const ImageCarousel({
    super.key,
    required this.images,
    this.padding = const EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 40),
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIndex = 0;

  void _goToPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void _goToNext() {
    if (currentIndex < widget.images.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Stack(
      children: [
        // PageView para las imágenes
        Padding(
          padding: widget.padding,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(widget.images[currentIndex]),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        // Flecha izquierda
        Positioned(
          left: 20,
          top: size.height / 2 - 25,
          child: GestureDetector(
            onTap: _goToPrevious,
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
            onTap: _goToNext,
            child: Icon(
              Icons.arrow_right,
              size: 100,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
