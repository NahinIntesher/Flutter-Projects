import 'package:flutter/material.dart';
import 'Quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quotes quotes;
  final Function delete;

  const QuoteCard({required this.quotes, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quotes.text,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              quotes.author,
              style: const TextStyle(fontSize: 18.0, color: Colors.teal),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () => delete(),
              icon: const Icon(Icons.delete),
              label: const Text('Delete Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
