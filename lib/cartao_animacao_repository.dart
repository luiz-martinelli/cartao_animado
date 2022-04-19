import 'package:cartao_exemplo/index.dart';

class CartaoAnimacaoRepository {
  final CartaoAnimacaoProvider _cartaoAnimacaoProvider = CartaoAnimacaoProvider();

  CartaoAnimacaoRepository();

  void test(bool isError) {
    _cartaoAnimacaoProvider.test(isError);
  }
}