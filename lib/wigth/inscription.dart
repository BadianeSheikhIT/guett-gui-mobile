import 'package:flutter/material.dart';
import 'chang_lang.dart';
class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController prenomController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


      void clearForm() {
        prenomController.clear();
        nomController.clear();
        emailController.clear();
        usernameController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        setState(() {
          selectedType = null;
        });

        _formKey.currentState!.reset();
      }

  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 220, 132),
        title: Row(
          children: [
            // Circular Image
            ClipOval(
              child: const Image(
                image: AssetImage('assets/images/logoColor.jpg'),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 4), // Add some spacing between the image and text
            const Expanded( // Allows the text to occupy the remaining space
              child: Center(
                child: Text(
                  'Guett Gui',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 27, 83, 29),
                    fontWeight: FontWeight.bold,
                    height: 1.5,
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
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// Prénom
              Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: prenomController,
                    decoration: const InputDecoration(
                      labelText: "Prénom",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Prénom requis" : null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: nomController,
                    decoration: const InputDecoration(
                      labelText: "Nom",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Nom requis" : null,
                  ),
                ),
              ],
            ),
              const SizedBox(height: 12), 

              /// Email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez entrer l'email";
                  }
                  if (!value.contains("@")) {
                    return "Email invalide";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              /// Nom utilisateur
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Nom d'utilisateur",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Veuillez entrer le nom d'utilisateur" : null,
              ),
              const SizedBox(height: 12),

              /// Type
              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: const InputDecoration(
                  labelText: "Type",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "Admin", child: Text("Admin")),
                  DropdownMenuItem(value: "Client", child: Text("Client")),
                  DropdownMenuItem(value: "Eleveur", child: Text("Eleveur")),
                  DropdownMenuItem(value: "Veterinaire", child: Text("Veterinaire")),
                  DropdownMenuItem(value: "Vendeur", child: Text("Vendeur")),
                  DropdownMenuItem(value: "PromoteurImm", child: Text("PromoteurImm")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Veuillez sélectionner un type" : null,
              ),
              const SizedBox(height: 12),

              /// Mot de passe
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Mot de passe",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Veuillez entrer le mot de passe" : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirmer le mot de passe",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez confirmer le mot de passe";
                        }
                        if (value != passwordController.text) {
                          return "Les mots de passe ne correspondent pas";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Bouton inscription
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 27, 83, 29),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Inscription réussie"),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        clearForm();
                      }
                    },
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}