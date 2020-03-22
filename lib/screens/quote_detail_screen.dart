import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';

class QuoteDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quote = ModalRoute.of(context).settings.arguments as Quote;

    return Scaffold(
      appBar: AppBar(
        title: Text('Citação de ${quote.author}'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRect(
              child: Image.network(
                'https://i.insider.com/53e00a6decad045538f4aa0e',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '" ${quote.text} "',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontFamily: 'SedgwickAve',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      quote.author,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'SedgwickAve',
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
