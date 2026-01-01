import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController prenomController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// Prénom
              TextFormField(
                controller: prenomController,
                decoration: const InputDecoration(
                  labelText: "Prénom",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Veuillez entrer le prénom" : null,
              ),
              const SizedBox(height: 12),

              /// Nom
              TextFormField(
                controller: nomController,
                decoration: const InputDecoration(
                  labelText: "Nom",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Veuillez entrer le nom" : null,
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
                  DropdownMenuItem(value: "Utilisateur", child: Text("Utilisateur")),
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
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mot de passe",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez entrer le mot de passe";
                  }
                  if (value.length < 6) {
                    return "Minimum 6 caractères";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              /// Confirmer mot de passe
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirmer mot de passe",
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
              const SizedBox(height: 20),

              /// Bouton inscription
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Traitement des données
                    print("Prénom: ${prenomController.text}");
                    print("Nom: ${nomController.text}");
                    print("Email: ${emailController.text}");
                    print("Username: ${usernameController.text}");
                    print("Type: $selectedType");

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Inscription réussie")),
                    );
                  }
                },
                child: const Text("S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
