import 'package:flutter/material.dart';
import 'index.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2)); // Simular llamada a API
      setState(() {
        _isLoading = false;
      });

      // Redirección a la nueva pantalla
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => IndexScreen()), // Redirige a IndexScreen
);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.blueAccent, Colors.blue],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Asistente Virtual', style: TextStyle(fontSize: 40, color: Colors.white)),
          Text('de salud', style: TextStyle(fontSize: 38, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('¡Bienvenido!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildTextField(_emailController, 'Email', Icons.email, false),
            SizedBox(height: 20),
            _buildTextField(_passwordController, 'Contraseña', Icons.lock, true),
            SizedBox(height: 20),
            _buildLoginButton(),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {}, // Lógica para crear cuenta
              child: Text('¿Aún no tienes una cuenta? Únete aquí'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, bool isPassword) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Por favor ingresa $hint';
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleLogin,
      child: _isLoading ? CircularProgressIndicator() : Text('Iniciar sesión'),
    );
  }
}

// Nueva pantalla de destino
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Principal')),
      body: Center(
        child: Text('¡Bienvenido a la Pantalla Principal!'),
      ),
    );
  }
}
