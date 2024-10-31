import 'package:flutter/material.dart';
import './reset_password_screen.dart';
import './signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 7) {
      return 'Password must be at least 7 characters';
    }
    return null;
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return const AlertDialog(
          title: Text('Message'),
          content: Text("Login successful"),
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
              const Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
              const Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Write your password',
                  border: Theme.of(context).inputDecorationTheme.border,
                ),
                obscureText: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                        child: const Text("Sign up"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showLoginDialog();
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: BorderSide.none,
                        ),
                        child: const Text("Reset password"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                ],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}