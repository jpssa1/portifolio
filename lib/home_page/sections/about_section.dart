import 'package:flutter/material.dart';
import 'dart:math';
import 'package:portifolio/home_page/sections/section_container.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sobre Mim',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            '''Sou o João Pedro, estudante de Engenharia de Software com experiência em Front-end, JavaScript, Python e Mobile utilizando Flutter. Autodidata e entusiasta de novas tecnologias, busco uma oportunidade na área de desenvolvimento para aplicar meus conhecimentos e evoluir em um ambiente dinâmico e desafiador.''',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Efeito de partículas orbitais animado
                SizedBox(
                  width: 200,
                  height: 200,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _OrbitalParticlesPainter(_controller.value),
                      );
                    },
                  ),
                ),

                // Seu avatar
                Image.asset("assets/images/perfil.png", width: 158),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrbitalParticlesPainter extends CustomPainter {
  final double animationValue;

  _OrbitalParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final primaryColor = Colors.blueAccent;
    final secondaryColor = Color(0xFF2C5364);

    // Desenha órbitas elípticas
    for (int i = 1; i <= 3; i++) {
      final ratio = i / 3;
      final paint =
          Paint()
            ..color = Color(0xFF2C5364).withValues(alpha: 0.5)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0;

      canvas.drawCircle(center, size.width * 0.4 * ratio, paint);
    }

    // Desenha partículas em movimento
    for (int i = 0; i < 12; i++) {
      final angle = animationValue * 2 * pi + i * (2 * pi / 12);
      final distance = 0.7 + sin(animationValue * 4 * pi + i) * 0.15;
      final particlePos = Offset(
        center.dx + cos(angle) * size.width * 0.35 * distance,
        center.dy + sin(angle) * size.height * 0.35 * distance,
      );

      final sizeVariation = (sin(animationValue * 2 * pi + i) + 1) * 0.5;
      final particleSize = 3.0 + sizeVariation * 2.0;

      final paint =
          Paint()
            ..color = Color.lerp(primaryColor, secondaryColor, i / 12)!
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

      canvas.drawCircle(particlePos, particleSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitalParticlesPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
