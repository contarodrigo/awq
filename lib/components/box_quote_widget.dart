import 'dart:math';

import 'package:awq/models/quote.dart';
import 'package:awq/utils/app_routes.dart';
import 'package:flutter/material.dart';

class BoxQuoteWidget extends StatefulWidget {
  final List<Quote> quotes;

  BoxQuoteWidget(this.quotes);

  @override
  _BoxQuoteWidgetState createState() => _BoxQuoteWidgetState();
}

class _BoxQuoteWidgetState extends State<BoxQuoteWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation colorAnimation;
  Animation sizeAnimation;
  Animation growAnimation;
  Animation fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Defining controller with animation duration of two seconds
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // Defining both color, funciona com Icon
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(_controller);

    growAnimation = Tween<double>(begin: 0, end: 200).animate(_controller);

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Rebuilding the screen when animation goes ahead
    _controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    TickerFuture tickerFuture = _controller.repeat();
    tickerFuture.timeout(Duration(seconds: 15), onTimeout: () {
      _controller.forward(from: 0);
      // _controller.stop(canceled: true); retira o widget
    });

    //For single time
    // _controller.forward();

    //Reverses the animation instead of starting it again and repeats
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  static final colorTween = ColorTween(begin: Colors.blue, end: Colors.red);

  Quote get _newQuote {
    return widget.quotes[Random().nextInt(widget.quotes.length)];
  }

  Future _showQuoteOfTheBox() async {
    return await Navigator.of(context)
        .pushNamed(AppRoutes.QUOTE_DETAIL, arguments: _newQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: Center(
                      child: TweenAnimationBuilder<Color>(
                          tween: colorTween,
                          duration: Duration(seconds: 10),
                          builder: (_, Color color, __) {
                            return ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    color,
                                    BlendMode
                                        .dstIn), //a cor esta funcionando, nao consegui um BlendMode que pintasse o formato da caixa sem pintar o fundo
                                child: Image.asset(
                                  'assets/images/bau-de-tesouro.png',
                                  width: growAnimation.value,
                                ));
                          }),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FlatButton(
                  padding: const EdgeInsets.all(6.0),
                  color: Color.fromRGBO(41, 52, 98, 1),
                  textColor: Colors.white,
                  child: Text('Abrir a Frase do dia!'),
                  onPressed: () async => _showQuoteOfTheBox(),
                  splashColor: Colors.amber,
                ),
              ),
            )
          ]),
    );
  }
}
