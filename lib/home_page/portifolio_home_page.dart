import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        elevation: 4,
        backgroundColor: Color(0xFF0F2027),
        title: const Text('João Pedro Sousa A. | Portfólio'),
        actions: [
          // Barra com logos das tecnologias
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Logo Flutter
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg',
                  ),
                  onPressed: () {},
                ),
                // Logo Dart
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg',
                  ),
                  onPressed: () {},
                ),
                // Logo GitHub
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/github/github-original.svg',
                  ),
                  onPressed: () {},
                ),
                // Logo Firebase
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg',
                  ),
                  onPressed: () {},
                ),
                // Logo JavaScript
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg',
                  ),
                  onPressed: () {},
                ),
                // Logo Python
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg',
                  ),
                  onPressed: () {},
                ),
                // logo html
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg',
                  ),
                  onPressed: () {},
                ),
                //logo css
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg',
                  ),
                  onPressed: () {},
                ),
                //logo git
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg',
                  ),
                  onPressed: () {},
                ),
                //logo supabase
                IconButton(
                  icon: SvgPicture.network(
                    height: 30,
                    'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/supabase/supabase-original.svg',
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              const HeroSection(),
              const AboutSection(),
              TechnologiesSection(),
              ProjectsSection(),
              const ContactSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
