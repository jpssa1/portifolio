import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Stack(
        children: [
          // Fundo com gradiente e onda animada
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isDark
                          ? [const Color(0xFF0F2027), const Color(0xFF2C5364)]
                          : [const Color(0xFFE0EAFC), const Color(0xFFCFDEF3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: WaveBackgroundPainter(
                      progress: _controller.value,
                      color: isDark ? Colors.black12 : Colors.blueAccent,
                    ),
                  );
                },
              ),
            ),
          ),

          // Conteúdo por cima da animação
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset("assets/images/perfil.png", width: 200),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'João Pedro Sousa A.',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Desenvolvedor Mobile Flutter',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      onPressed:
                          () => launchUrl(
                            Uri.parse(
                              'https://www.linkedin.com/in/joao-pedro-sousa-de-andrade-848363241/',
                            ),
                          ),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      onPressed:
                          () =>
                              launchUrl(Uri.parse('https://github.com/jpssa1')),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.solidFilePdf),
                      onPressed:
                          () => launchUrl(
                            Uri.parse(
                              'https://drive.google.com/file/d/1lD6CSywMyrayHlxhiEpaLDiCH5MVxYaZ/view?usp=sharing',
                            ),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveBackgroundPainter extends CustomPainter {
  final double progress;
  final Color color;

  WaveBackgroundPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = LinearGradient(
            colors: [color.withOpacity(0.5), color.withOpacity(0.1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final waveHeight = 40.0;
    final waveLength = size.width / 1.5;
    final offset = progress * 2 * pi;

    path.moveTo(0, size.height * 0.5);

    for (double x = 0; x <= size.width; x++) {
      final y = sin((x / waveLength * 2 * pi) + offset) * waveHeight;
      path.lineTo(x, size.height * 0.5 + y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WaveBackgroundPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
