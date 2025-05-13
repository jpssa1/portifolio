import 'package:flutter/material.dart';
import 'package:portifolio/home_page/sections/section_container.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});
  final List listaProjetos = [
    Projetos(
      nome: 'Brutão Veículos',
      descricao:
          'Plataforma para gestão de veículos, com funcionalidades como cadastro, busca por placa e autenticação de usuários.',
      link: '',
      tecnologias: 'Flutter, Supabase, BLoC',
    ),
    Projetos(
      nome: 'Brutão Veículos',
      descricao:
          'Plataforma para gestão de veículos, com funcionalidades como cadastro, busca por placa e autenticação de usuários.',
      link: '',
      tecnologias: 'Flutter, Firebase, BLoC',
    ),
    Projetos(
      nome: 'Brutão Veículos',
      descricao:
          'Plataforma para gestão de veículos, com funcionalidades como cadastro, busca por placa e autenticação de usuários.',
      link: '',
      tecnologias: 'Flutter, Supabase, BLoC',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projetos',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              int crossAxisCount = 1;
              if (width > 900) {
                crossAxisCount = 2;
              } else if (width > 600) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 4 / 3,
                ),
                itemBuilder:
                    (context, index) => ProjectCard(
                      nome: listaProjetos[index].nome,
                      descricao: listaProjetos[index].descricao,
                      link: '',
                      tecnologia: listaProjetos[index].tecnologias,
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.nome,
    required this.descricao,
    required this.link,
    required this.tecnologia,
  });
  final String nome;
  final String descricao;
  final String link;
  final String tecnologia;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Color(0xFF2C5364),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            nome,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            descricao,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(tecnologia, style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver Código',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Demo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Projetos {
  final String tecnologias;
  final String nome;
  final String descricao;
  final String link;

  Projetos({
    required this.nome,
    required this.descricao,
    required this.link,
    required this.tecnologias,
  });
}
