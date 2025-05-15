import 'package:flutter/material.dart';

import 'package:portifolio/home_page/sections/about_section.dart';
import 'package:portifolio/home_page/sections/contact_section.dart';
import 'package:portifolio/home_page/sections/footer_section.dart';
import 'package:portifolio/home_page/sections/hero_section.dart';

import 'package:portifolio/home_page/sections/projects_section.dart';
import 'package:portifolio/home_page/sections/technologie_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xFF121212),
        title: const Text('João Pedro Sousa A. | Portfólio'),
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              const HeroSection(),

              TechnologiesSection(),
              ProjectsSection(),
              const AboutSection(),
              const ContactSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
