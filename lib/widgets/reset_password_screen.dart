import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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

  Future<void> _sendData() async {
    final dio = Dio();
    const String url = 'https://lab12.requestcatcher.com/';
    final response = await dio.post(url, data: {
      'email': _emailController.text,
    });
    if (kDebugMode) {
      print(response.data);
    }
  }

  void _showResetPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return const AlertDialog(
          title: Text('Message'),
          content: Text("Need to implement"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                  "Password Reset",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _sendData();
                            _showResetPasswordDialog();
                          }
                        },
                        child: const Text("Reset Password"),
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