import 'package:flutter/material.dart';
import 'package:tienda_app/models/categoria.dart';


class CategoriaItem extends StatelessWidget {
  final Categoria categoria;
  const CategoriaItem({super.key, required this.categoria});
  @override
  Widget build(BuildContext context) {
      return Container(
      width: 76,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
            children: [
                CircleAvatar(
                radius: 28,
                backgroundColor: const Color.fromARGB(255, 205, 71, 8),
                child: Icon(categoria.icono, color: Colors.white,),
                ),
                const SizedBox(height: 6,),
                Text(categoria.nombre, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center ),
            ],

      ),
    );
  }
}