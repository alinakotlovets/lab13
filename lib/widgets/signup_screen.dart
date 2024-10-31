import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Валідація email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // Валідація пароля
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 7) {
      return 'Password must be at least 7 characters long';
    }
    return null;
  }

  void _showRegistrationSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return const AlertDialog(
          title: Text('Success'),
          content: Text("Registration successful"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Write your name',
                  border: Theme.of(context).inputDecorationTheme.border,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              const Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Write your email',
                  border: Theme.of(context).inputDecorationTheme.border,
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 18),
              const Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Пароль приховується
                decoration: InputDecoration(
                  labelText: 'Write your password',
                  border: Theme.of(context).inputDecorationTheme.border,
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showRegistrationSuccessDialog();
                          }
                        },
                        child: const Text("Sign up"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: const Text("Back"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}