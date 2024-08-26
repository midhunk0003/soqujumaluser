import 'package:flutter/material.dart';

class FaqProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _questions = [
    {
      'question': "1Question",
      'answer':
          '1Lörem ipsum fädide krov åsk nätdeklarant mir. Tetravis. San sar teska pertotal. Kvasin växtmjölk lähäde sefäpp. Satonera antining pande kament.Tekont bir intrafäde, om jågon pronde. Betest nånannanism och dungar teläheten ultraskade. Carpa sudoku ifall fasm yns',
      'isVisible': false,
    },
    {
      'question': "2Question",
      'answer':
          '2Lörem ipsum fädide krov åsk nätdeklarant mir. Tetravis. San sar teska pertotal. Kvasin växtmjölk lähäde sefäpp. Satonera antining pande kament.Tekont bir intrafäde, om jågon pronde. Betest nånannanism och dungar teläheten ultraskade. Carpa sudoku ifall fasm yns',
      'isVisible': false,
    },
    {
      'question': "3Question",
      'answer':
          '345Lörem ipsum fädide krov åsk nätdeklarant mir. Tetravis. San sar teska pertotal. Kvasin växtmjölk lähäde sefäpp. Satonera antining pande kament.Tekont bir intrafäde, om jågon pronde. Betest nånannanism och dungar teläheten ultraskade. Carpa sudoku ifall fasm yns',
      'isVisible': false,
    },
    {
      'question': "3Question",
      'answer':
          '345Lörem ipsum fädide krov åsk nätdeklarant mir. Tetravis. San sar teska pertotal. Kvasin växtmjölk lähäde sefäpp. Satonera antining pande kament.Tekont bir intrafäde, om jågon pronde. Betest nånannanism och dungar teläheten ultraskade. Carpa sudoku ifall fasm yns',
      'isVisible': false,
    },
    {
      'question': "3Question",
      'answer':
          '34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir34567Lörem ipsum fädide krov åsk nätdeklarant mir. Tetravis. San sar teska pertotal. Kvasin växtmjölk lähäde sefäpp. Satonera antining pande kament.Tekont bir intrafäde, om jågon pronde. Betest nånannanism och dungar teläheten ultraskade. Carpa sudoku ifall fasm yns',
      'isVisible': false,
    },
  ];

  List<Map<String, dynamic>> get questions => _questions;

  void toogleVisibility(int index) {
    _questions[index]['isVisible'] = !_questions[index]['isVisible'];
    notifyListeners();
  }
}
