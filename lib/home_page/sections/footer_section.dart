import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2C5364),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          '© 2025  jpssa.dev . Todos os direitos reservados.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
