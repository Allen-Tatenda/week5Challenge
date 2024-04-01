import 'package:flutter/material.dart';

class LandingTop extends StatelessWidget {
  const LandingTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Positioned(
        //     child: CustomPaint(
        //   painter: EggPainter(color: Colors.red),
        //   size: Size(300, 500), // Adjust size as needed
        // ))

        Positioned(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(width: 1.0, color: Colors.black54)),
                ),
              ),
              Positioned(
                left: -5,
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(200)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(
                      'https://m.media-amazon.com/images/I/61cefoSfepS._AC_UF1000,1000_QL80_.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),

        Positioned(
          top: 10,
          right: 0,
          child: Container(
            width: 50,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(200)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                'https://m.media-amazon.com/images/I/61cefoSfepS._AC_UF1000,1000_QL80_.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 10,
          left: 0,
          child: Container(
            width: 50,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(200)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                'https://m.media-amazon.com/images/I/61cefoSfepS._AC_UF1000,1000_QL80_.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class EggPainter extends CustomPainter {
  final Color color;

  EggPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..quadraticBezierTo(0, size.height, size.width / 4, 3 * size.height / 4)
      ..quadraticBezierTo(
          size.width / 2, size.height, 3 * size.width / 4, 3 * size.height / 4)
      ..quadraticBezierTo(
          size.width, size.height, size.width / 2, size.height / 2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
