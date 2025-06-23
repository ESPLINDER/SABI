import 'package:flutter/material.dart';

class DietaMediterranea extends StatefulWidget {
  const DietaMediterranea({Key? key}) : super(key: key);

  @override
  State<DietaMediterranea> createState() => _DietaMediterraneaState();
}

class _DietaMediterraneaState extends State<DietaMediterranea> {
  String selectedFilter = 'Relevancia';
  List<Recipe> recipes = [
    Recipe(name: 'Ensalada Griega', icon: Icons.food_bank),
    Recipe(name: 'Pasta con Pesto', icon: Icons.fastfood),
    Recipe(name: 'Sopa de Lentejas', icon: Icons.soup_kitchen),
    Recipe(name: 'Hummus con Verduras', icon: Icons.local_drink),
    Recipe(name: 'Pescado a la Plancha', icon: Icons.emoji_food_beverage),
    Recipe(name: 'Pollo al Limón', icon: Icons.local_fire_department),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 170, 216), // Azul
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Recetas Mediterráneas',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Sección de beneficios de la dieta
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 150, // Altura ajustada para hacer el contenedor más alargado
            color: const Color(0xFF4FC3F7), // Azul
            child: const Text(
              'Beneficios de la Dieta Mediterránea:\n'
              '• Mejora la salud cardiovascular\n'
              '• Promueve un estilo de vida saludable\n'
              '• Ayuda en la prevención de enfermedades crónicas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          // Filtro de relevancia
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4FC3F7), // Azul
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedFilter,
                      dropdownColor: const Color(0xFF4FC3F7), // Azul
                      style: const TextStyle(color: Colors.white),
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      items: ['Relevancia', 'Alfabético', 'Favoritos']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedFilter = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Grid de recetas
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  ...recipes.map((recipe) => _buildRecipeCard(recipe)),
                  _buildCreateRecipeCard(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildRecipeCard(Recipe recipe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Área de imagen/icono con estrella
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      recipe.icon,
                      size: 60,
                      color: const Color(0xFF4FC3F7), // Azul
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          recipe.isFavorite = !recipe.isFavorite;
                        });
                      },
                      child: Icon(
                        recipe.isFavorite ? Icons.star : Icons.star_border,
                        color: recipe.isFavorite ? Colors.amber : Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Área de texto
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  recipe.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateRecipeCard() {
    return GestureDetector(
      onTap: () {
        // Aquí puedes agregar la lógica para crear una nueva receta
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Área superior
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 60,
                    color: Color(0xFF4FC3F7), // Azul
                  ),
                ),
              ),
            ),
            // Botón de crear receta
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFB74D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.black87, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Crear receta',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF4FC3F7), // Azul
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              // Lógica para ir a la pantalla principal
            },
          ),
          const Icon(Icons.play_arrow, color: Colors.white, size: 40),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Lógica para ir a la pantalla de configuración
            },
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String name;
  final IconData icon;
  bool isFavorite;

  Recipe({
    required this.name,
    required this.icon,
    this.isFavorite = false,
  });
}
