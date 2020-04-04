import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awq/models/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class QuoteDetailScreen extends StatefulWidget {
  @override
  _QuoteDetailScreenState createState() => _QuoteDetailScreenState();
}

class _QuoteDetailScreenState extends State<QuoteDetailScreen> {
  GlobalKey _globalKey = new GlobalKey();
  var _imageToShare;

  _shareImageSync(Quote quote) {
    _capturePng().then((_) => _shareImage(quote));
  }

  Future<void> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      setState(() {
        //  _imageToShare = Image.memory(pngBytes.buffer.asUint8List()); To test
        _imageToShare = pngBytes;
      });
    } catch (e) {
      print(' _capturePng error: $e');
    }
  }

  Future<void> _shareImage(Quote quote) async {
    try {
      await Share.file(
          '${quote.author}', '${quote.author}.png', _imageToShare, 'image/png',
          text: '${quote.text} - ${quote.author}');
    } catch (e) {
      print('_shareImage error: $e');
    }
  }

  String _getImageBySchool(Quote quote) {
    if (quote.school == 1) {
      return 'assets/images/background-marco-aurelio.jpg';
    } else {
      return 'assets/images/background-citacao-generico.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final quote = ModalRoute.of(context).settings.arguments as Quote;

    return Scaffold(
        appBar: AppBar(
          title: Text('Citação de ${quote.author}'),
        ),
        body: RepaintBoundary(
          key: _globalKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ClipRect(
                  child: Image.asset(
                    _getImageBySchool(quote),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    semanticLabel: quote.author,
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
                            color: Colors.white,
                            fontFamily: 'SedgwickAve',
                          ),
                          maxLines: 11,
                          maxFontSize: 18,
                          minFontSize: 18,
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
                ),
                // _imageToShare != null ? _imageToShare : Container(),  para testar
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share),
          splashColor: Colors.amberAccent,
          onPressed: () => _shareImageSync(quote),
        ));
  }
}
