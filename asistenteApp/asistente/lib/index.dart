import 'package:flutter/material.dart';
import 'paginas/dietaVegetariana.dart';
import 'paginas/dietaCetogenica.dart';
import 'paginas/dietaMediterranea.dart';
import 'paginas/dietaPaleo.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4FC3F7), // Azul claro
      appBar: AppBar(
        backgroundColor: const Color(0xFF4FC3F7),
        elevation: 0,
        title: const Text(
          '\nAsistente Virtual De Salud \n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Pregunta principal
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '¿Qué dieta probaremos hoy?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Grid de dietas
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                  children: [
                    _buildDietCard(
                      context,
                      'Dieta Vegetariana',
                      () => _navigateToDiet(context, 'Dieta Vegetariana'),
                    ),
                    _buildDietCard(
                      context,
                      'Dieta Cetogénica',
                      () => _navigateToDiet(context, 'Dieta Cetogénica'),
                    ),
                    _buildDietCard(
                      context,
                      'Dieta Mediterránea',
                      () => _navigateToDiet(context, 'Dieta Mediterránea'),
                    ),
                    _buildDietCard(
                      context,
                      'Dieta Paleo',
                      () => _navigateToDiet(context, 'Dieta Paleo'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildDietCard(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      _getIconForDiet(title),
                      size: 80,
                      color: const Color(0xFF4FC3F7),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForDiet(String diet) {
    switch (diet.toLowerCase()) {
      case 'dieta vegetariana':
        return Icons.local_dining;
      case 'dieta cetogénica':
        return Icons.fastfood;
      case 'dieta mediterránea':
        return Icons.food_bank;
      case 'dieta paleo':
        return Icons.favorite;
      default:
        return Icons.food_bank;
    }
  }

  void _navigateToDiet(BuildContext context, String diet) {
    // Navegar a la pantalla correspondiente según la dieta
    if (diet == 'Dieta Vegetariana') { 
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DietaVegetariana(), // Navegar a DietaVegetariana
        ),
      );
    } else if (diet == 'Dieta Cetogénica') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DietaCetogenica(), // Navegar a DietaCetogénica
        ),
      );
    } else if (diet == 'Dieta Mediterránea') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DietaMediterranea(), // Navegar a DietaMediterránea
        ),
      );
    } else if (diet == 'Dieta Paleo') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DietaPaleo(), // Navegar a DietaPaleo
        ),
      );
    } else {
      // Aquí puedes manejar otras dietas
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DietDetailPage(diet: diet),
        ),
      );
    }
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF4FC3F7),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home, color: Colors.white, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}

// Página de ejemplo para mostrar la navegación
class DietDetailPage extends StatelessWidget {
  final String diet;

  const DietDetailPage({Key? key, required this.diet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $diet'),
        backgroundColor: const Color(0xFF4FC3F7),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIconForDiet(diet),
              size: 100,
              color: const Color(0xFF4FC3F7),
            ),
            const SizedBox(height: 20),
            Text(
              'Página de $diet',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForDiet(String diet) {
    switch (diet.toLowerCase()) {
      case 'dieta vegetariana':
        return Icons.local_dining;
      case 'dieta cetogénica':
        return Icons.fastfood;
      case 'dieta mediterránea':
        return Icons.food_bank;
      case 'dieta paleo':
        return Icons.favorite;
      default:
        return Icons.food_bank;
    }
  }
}
