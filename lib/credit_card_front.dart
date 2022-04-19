import 'package:flutter/material.dart';

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width *.9,
      height: 220,
        child: Expanded(
          child: SizedBox(
            height: 220,
            child: Image.network('http://d2r9epyceweg5n.cloudfront.net/stores/001/356/449/products/51-f8d6de06270d6e9a6716010470321913-640-0.png'),
          ),
        )
      );
    }
  }