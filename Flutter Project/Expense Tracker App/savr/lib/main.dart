import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Wave Background
          const Positioned.fill(child: WaveBackground()),
          // Foreground Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/img/logo_savr.png',
                  height: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'EXPENSES \n TRACKER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveBackground extends StatelessWidget {
  const WaveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter(),
      child: Container(),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4EADF0), // Light blue
          Color(0xFFE9A7FF), // Soft purple
          Color(0xFFFFE047), // Yellow
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Bottom Wave
    final Path bottomWavePath = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.8,
          size.width * 0.5, size.height * 0.75)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.7, size.width, size.height * 0.8)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(bottomWavePath, paint);

    // Top Wave
    final Path topWavePath = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.2,
          size.width * 0.5, size.height * 0.25)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.3, size.width, size.height * 0.2)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(topWavePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
