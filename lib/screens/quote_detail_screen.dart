
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';

class QuoteDetailScreen extends StatelessWidget {
  
  void _doShare(Quote quote, BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(quote.text,
        subject: quote.author,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

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
                  height: 300,
                  fit: BoxFit.cover,
                  semanticLabel : quote.author,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 55),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        '" ${quote.text} "',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: 'SedgwickAve',
                        ),
                        maxLines: 7,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        ' - ${quote.author}',
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share),
          splashColor: Colors.amberAccent,
          onPressed: () => _doShare(quote, context),
        ));
  }
}
