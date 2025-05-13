import 'package:flutter/material.dart';
import 'package:portifolio/home_page/sections/section_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Função otimizada para web
  Future<void> _launchWhatsApp() async {
    const phoneNumber = '5598991791100'; // Substitua pelo seu número real
    const message = 'Olá, vim pelo seu portfólio!';
    final url = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
    );

    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Fundamental para web
      );
    } catch (e) {
      // Fallback para WhatsApp Web se o direct link falhar
      await launchUrl(
        Uri.parse(
          'https://web.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}',
        ),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contato',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Adicionei cor para melhor contraste
            ),
          ),
          const SizedBox(height: 20),

          // Botão do WhatsApp melhorado
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C5364),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: _launchWhatsApp,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg',
                    height: 28,
                    width: 28,
                    color: Colors.white,
                    errorBuilder:
                        (_, __, ___) => const Icon(Icons.chat, size: 28),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Fale comigo pelo WhatsApp',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Color(0xFF2C5364)),
          const SizedBox(height: 30),

          // Formulário de contato
          _buildContactForm(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      children: [
        TextFormField(decoration: _inputDecoration('Seu nome')),
        const SizedBox(height: 16),
        TextFormField(
          decoration: _inputDecoration('Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextFormField(maxLines: 5, decoration: _inputDecoration('Mensagem')),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2C5364),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              // Adicione aqui a lógica para enviar o formulário
            },
            child: const Text(
              'Enviar Mensagem',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      floatingLabelStyle: const TextStyle(color: Colors.white),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2C5364), width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2C5364), width: 1),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      contentPadding: const EdgeInsets.all(16),
    );
  }
}
