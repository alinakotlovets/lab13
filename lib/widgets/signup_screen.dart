import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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

              /**/

              const SizedBox(height: 20),
              const Center(
                child: Text("Sign up",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),

              /**/

              const Text('Name',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Write you name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 18),

              /**/

              const Text('Email',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Write you email', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 18),

              /**/

              const Text('Password',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Write you password',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 18),

              /**/

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return const AlertDialog(
                                title: Text('Message'),
                                content: Text("Need to implement"),
                              );
                            },
                          ),
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
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.pop(context),
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // Прозорий фон
                          foregroundColor: Colors.blue, // Колір тексту
                          shadowColor: Colors.transparent, // Прибираємо тінь
                          side: const BorderSide(
                              color: Colors.blue,
                              width: 1), // Колір та ширина обводки
                        ),
                        child: const Text("Back"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
