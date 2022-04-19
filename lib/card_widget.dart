import 'dart:math';

import 'package:cartao_exemplo/card_animation.dart';
import 'package:cartao_exemplo/credit_card_back.dart';
import 'package:cartao_exemplo/credit_card_front.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fromAnimation;
  late Animation<double> _backAnimation;
  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this
    );
    _setupAnimation();
  }

  void _setupAnimation(){

    bool rotateToLeft = isFrontVisible;

    _fromAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.0, 
          end: rotateToLeft ? (pi / 2) : (-pi / 2),
          ).chain(CurveTween(curve: Curves.linear)),
        weight: 50,
        ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(
          rotateToLeft ? (-pi / 2) : (pi / 2)), 
        weight: 50,
        ),
      ]
    ).animate(_controller);

    _backAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)
        ), 
        weight: 50,
        ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: rotateToLeft ? (-pi / 2) : (pi / 2),
          end: 0,
          ).chain(
            CurveTween(curve: Curves.linear)
          ),
        weight: 50,  
        )
      ]
    ).animate(_controller);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''),),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Stack(
              children: [
                 CardAnimation(
                   animation: _fromAnimation,
                   child: const CreditCardFront()
                   ),
                 CardAnimation(
                   animation: _backAnimation,
                   child: const CreditCardBack()
                   ),
                 ],
               ),
            TextButton(onPressed: () {
              setState(() {
                if(isFrontVisible){
                  _controller.forward();
                  isFrontVisible = false;
                }else {
                  _controller.reverse();
                  isFrontVisible = true;
                }
              });
            }, 
            child: const Text('Virar'))
          ],
        ),
      ),
    );
  }
}