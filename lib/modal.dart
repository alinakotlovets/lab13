import 'package:flutter/material.dart';
import 'preview.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();

  double _fontSize = 16.0;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          width: 500,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.network(
              width: 66,
              'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            )
          ]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("Text previewer"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Text',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Font Size: ${_fontSize.round()}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              Slider(
                value: _fontSize,
                min: 10,
                max: 100,
                divisions: 90,
                onChanged: (double value) {
                  setState(() {
                    _fontSize = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        text: _textController.text,
                        fontSize: _fontSize,
                      ),
                    ),
                  );

                  if (result == 'ok') {
                    _showDialog('Cool!');
                  } else if (result == 'cancel') {
                    _showDialog('Let\'s try something else');
                  } else {
                    _showDialog('Don\'t know what to say');
                  }
                },
                child: const Text('Preview'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
