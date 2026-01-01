import 'package:flutter/material.dart';
import 'package:guettgui/wigth/inscription.dart';
import 'package:guettgui/wigth/chang_lang.dart';
class Connecter extends StatefulWidget {
  const Connecter({super.key});

  @override
  State<Connecter> createState() => _ConnecterState();
}

class _ConnecterState extends State<Connecter> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ✅ APPBAR
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 220, 132),
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/logoColor.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Center(
                child: Text(
                  'Guett Gui',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 27, 83, 29),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
             IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageSelection()),
              );
            },
          ),
          ],
        ),
      ),

      /// ✅ BODY
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      /// Titre
                      const Text(
                        "Connexion",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 27, 83, 29),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Email
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return "Email requis";
                          if (!value.contains("@")) return "Email invalide";
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      /// Mot de passe
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Mot de passe",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Mot de passe requis" : null,
                      ),
                      const SizedBox(height: 20),

                      /// Bouton Connexion
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 27, 83, 29),
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Connexion réussie"),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );

                              emailController.clear();
                              passwordController.clear();
                            }
                          },
                          child: const Text(
                            "Se connecter",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Lien inscription
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Inscription(),
                            ),
                          );
                        },
                        child: const Text(
                          "Vous n'avez pas de compte ? S'inscrire",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
