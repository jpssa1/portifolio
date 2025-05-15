import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/home_page/sections/section_container.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Projetos> listaProjetos = [
    Projetos(
      nome: 'Brutão Veículos',
      descricao:
          'Plataforma para gestão de veículos, com funcionalidades como cadastro, busca por placa e autenticação de usuários. O sistema utiliza validação de dados, upload de documentos PDF e integração com banco de dados em tempo real (Freelancer)',
      link: '',
      tecnologias: 'Flutter, Supabase, BLoC',
      listaImagens: [
        'assets/images/brutao 1.png',
        'assets/images/brutao 2.png',
        'assets/images/brutao 3.png',
        'assets/images/brutao 4.png',
        'assets/images/brutao 5.png',
      ],
    ),
    Projetos(
      nome: 'Pokédex Flutter',
      descricao:
          'Uma Pokédex digital criada em Flutter que consome dados da PokéAPI para exibir uma lista de Pokémon com imagens, nomes e informações detalhadas como tipos, habilidades e estatísticas. A navegação entre telas e a busca por nome oferecem uma experiência prática e intuitiva.',
      link: '',
      tecnologias: 'Flutter, Dart, HTTP, PokéAPI',
      listaImagens: [
        'assets/images/pokemon 1.png',
        'assets/images/pokemon 2.png',
        'assets/images/pokemon 3.png',
        'assets/images/pokemon 4.png',
        'assets/images/pokemon 5.png',
      ],
    ),
    Projetos(
      nome: 'Pharma+',
      descricao:
          'Aplicativo acadêmico de farmácia digital, desenvolvido para auxiliar usuários no controle e organização de seus medicamentos. O app permite cadastrar remédios, configurar lembretes por meio de um calendário interativo e receber notificações nos horários definidos. Ideal para pessoas que precisam manter uma rotina médica mais eficiente.',
      link: '',
      tecnologias: 'Flutter, Dart, Calendar Widget',
      listaImagens: [
        'assets/images/farma 1.png',
        'assets/images/farma 2.png',
        'assets/images/farma 3.png',
        'assets/images/farma 4.png',
      ],
    ),
    Projetos(
      nome: 'CryptoWatcher',
      descricao:
          'Aplicativo simples desenvolvido em Flutter para monitorar os preços de criptomoedas em tempo real. O app consome dados de uma API pública e exibe as principais informações como nome, símbolo, valor atual e variação nas últimas 24h. Ideal para estudos de consumo de API e exibição de dados em listas.',
      link: '',
      tecnologias: ' Flutter, Dart, HTTP, API REST, Provider',
      listaImagens: [
        'assets/images/cripto app 1.png',
        'assets/images/cripto app 2.png',
      ],
    ),
    Projetos(
      nome: 'Tetris em Flutter',
      descricao:
          'Jogo clássico do Tetris desenvolvido em Flutter. Inclui movimentação, rotação de peças, detecção de colisões e sistema de pontuação. Interface responsiva e jogável tanto em mobile quanto em web.',
      link: '',
      tecnologias: ' Flutter, Dart, Custom Paint',
      listaImagens: ['assets/images/tetris app.png'],
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
              double maxWidth = constraints.maxWidth;
              double itemWidth =
                  maxWidth > 900
                      ? maxWidth / 2 - 15
                      : maxWidth > 600
                      ? maxWidth / 2 - 15
                      : maxWidth;

              return Wrap(
                spacing: 15,
                runSpacing: 15,
                children:
                    listaProjetos.map((projeto) {
                      return SizedBox(
                        width: itemWidth,
                        child: ProjectCard(
                          nome: projeto.nome,
                          descricao: projeto.descricao,
                          link: projeto.link,
                          tecnologia: projeto.tecnologias,
                          listaImagens: projeto.listaImagens,
                        ),
                      );
                    }).toList(),
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
    required this.listaImagens,
  });

  final String nome;
  final String descricao;
  final String link;
  final String tecnologia;
  final List<String> listaImagens;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                child: Text(
                  descricao,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(tecnologia, style: const TextStyle(color: Colors.white60)),
            const SizedBox(height: 20),
            if (listaImagens.isNotEmpty)
              CarouselSlider(
                options: CarouselOptions(
                  height: 500, // ⬆️ Aumenta a altura da imagem
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlay: listaImagens.length > 1,
                  viewportFraction: 1.0, // ⬅️ Ocupa 100% da largura do card
                  enableInfiniteScroll: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                ),
                items:
                    listaImagens.map((img) {
                      return Image.asset(
                        img,
                        fit:
                            BoxFit
                                .contain, // ⬅️ Pode mudar para .cover se quiser preencher
                      );
                    }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class Projetos {
  final String tecnologias;
  final String nome;
  final String descricao;
  final String link;
  final List<String> listaImagens;

  Projetos({
    required this.listaImagens,
    required this.nome,
    required this.descricao,
    required this.link,
    required this.tecnologias,
  });
}
