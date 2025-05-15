import 'package:flutter/material.dart';
import 'package:portifolio/home_page/sections/section_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _launchWhatsApp() async {
    const phoneNumber = '5598991791100';
    const message = 'Olá, vim pelo seu portfólio!';
    final url = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
    );

    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      await launchUrl(
        Uri.parse(
          'https://web.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}',
        ),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> _sendEmail() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final uri = Uri(
      scheme: 'mailto',
      path: 'jpssa1@hotmail.com', // <-- Substitua pelo seu email real
      queryParameters: {
        'subject': 'Contato do Portfólio - $name',
        'body': 'Nome: $name\nEmail: $email\nMensagem: $message',
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o e-mail.')),
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
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
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
          _buildContactForm(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          decoration: _inputDecoration('Seu nome'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _emailController,
          decoration: _inputDecoration('Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _messageController,
          maxLines: 5,
          decoration: _inputDecoration('Mensagem'),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2C5364),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: _sendEmail,
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
      fillColor: Colors.white.withOpacity(0.05),
      contentPadding: const EdgeInsets.all(16),
    );
  }
}
