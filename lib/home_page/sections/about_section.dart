import 'package:flutter/material.dart';
import 'package:portifolio/home_page/sections/section_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Sobre Mim',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '''Sou o João Pedro, estudante de Engenharia de Software com experiência em Front-end, JavaScript, Python e Mobile utilizando Flutter. Autodidata e entusiasta de novas tecnologias, busco uma oportunidade na área de desenvolvimento para aplicar meus conhecimentos e evoluir em um ambiente dinâmico e desafiador.''',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
