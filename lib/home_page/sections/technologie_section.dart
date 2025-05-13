import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechnologiesSection extends StatelessWidget {
  TechnologiesSection({super.key});

  final List<Map<String, dynamic>> technologies = [
    {
      'name': 'Flutter',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg',
    },
    {
      'name': 'Dart',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg',
    },
    {
      'name': 'GitHub',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/github/github-original.svg',
    },
    {
      'name': 'Firebase',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg',
    },
    {
      'name': 'JavaScript',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg',
    },
    {
      'name': 'Python',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg',
    },
    {
      'name': 'HTML5',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg',
    },
    {
      'name': 'CSS3',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg',
    },
    {
      'name': 'Git',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg',
    },
    {
      'name': 'Supabase',
      'icon':
          'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/supabase/supabase-original.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Ferramentas e tecnologias que domino e utilizo em meus projetos',
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children:
                technologies
                    .map(
                      (tech) =>
                          _TechItem(name: tech['name'], iconUrl: tech['icon']),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class _TechItem extends StatefulWidget {
  final String name;
  final String iconUrl;

  const _TechItem({required this.name, required this.iconUrl});

  @override
  State<_TechItem> createState() => _TechItemState();
}

class _TechItemState extends State<_TechItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF2C5364),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SvgPicture.network(widget.iconUrl, height: 40, width: 40),
            ),
            const SizedBox(height: 10),
            Text(widget.name, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
