import 'package:flutter/material.dart';
import 'package:tienda_app/models/categoria.dart';
import 'package:tienda_app/models/producto.dart';
import 'package:tienda_app/widgets/categoria_item.dart';

class HomeScreen extends StatelessWidget {
  final List<Categoria> categorias = const [
    Categoria("Ropa", Icons.checkroom),
    Categoria("Calzado", Icons.hiking),
    Categoria("Tecnologia", Icons.devices),
    Categoria("Hogar", Icons.chair),
    Categoria("Deporte", Icons.sports_soccer),
    Categoria("Belleza", Icons.face_retouching_natural),
  ];
  final List<Producto> productos = const [
    Producto("Zapatos de escalada", 1200, Icons.hiking),
    Producto("Audifonos", 400, Icons.headphones),
    Producto("Chamarra", 1300, Icons.checkroom),
    Producto("Reloj", 9500, Icons.watch),
    Producto("Mochila", 620, Icons.backpack),
    Producto("Consola de videojuegos", 14999, Icons.games)
  ];
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tienda Delfines"),
        backgroundColor: const Color.fromARGB(255, 254, 72, 69),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hola, Joshua Fernando Miam Santos"),
                    Text("¿Qué vas a comprar hoy?", style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 239, 79, 67)),)
                  ],
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color.fromARGB(255, 195, 11, 11),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 140, // Altura corregida para evitar el overflow
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 162, 0),
                          Color.fromARGB(255, 220, 44, 4),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    top: 24,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasta 20% de descuento",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "En productos seleccionados",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                    right: 16,
                    bottom: 16,
                    child: Icon(Icons.local_offer, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Categorias",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return CategoriaItem(categoria: categoria);
                },
              ),
            ),
            const Text("Productos detacados", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14
                ),
              itemCount: productos.length,
              itemBuilder: ((context, index) {
                final producto=productos[index];
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            producto.icono, color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          producto.nombre,
                          style: const TextStyle(
                            fontSize: 12, 
                            fontWeight: 
                            FontWeight.bold
                            ), maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          producto.precio.toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.redAccent),
                        ),
                      ],
                    )
                  );
              }),
            ),

          ],
        ),
      ),
    );
  }
}
