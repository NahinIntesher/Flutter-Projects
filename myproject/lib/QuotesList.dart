import 'package:flutter/material.dart';
import 'QuoteCard.dart';
import 'Quotes.dart';

class QuotesList extends StatefulWidget {
  const QuotesList({Key? key}) : super(key: key);
  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List<Quotes> quotes = [
    Quotes(text: 'Amar maye amare bashay dhukte dibena', author: 'Jayed'),
    Quotes(text: 'I will be homed now', author: 'Ador'),
    Quotes(text: 'Vai bichanay shuichilam, ghumay gechilam', author: 'Nahin'),
    Quotes(text: 'Bondhu, Dada bari. CSS start kortechi', author: 'Ananta'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                  quotes: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
