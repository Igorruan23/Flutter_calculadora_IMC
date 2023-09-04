class calcularIMC {
  double _resultado = 0;
  String _classificacao = "";

  calcula(var peso, var altura) {
    if (peso > 0 && altura > 0) {
      _resultado = peso / (altura * 2);
      switch (_resultado) {
        case < 16:
          _classificacao = "Magreza grave";

        case < 17:
          _classificacao = "Magreza moderada";

        case < 18.5:
          _classificacao = "Magreza leve";

        case < 25:
          _classificacao = "Saudável";

        case < 30:
          _classificacao = "Sobrepeso";

        case < 35:
          _classificacao = "Obesidade grau I";

        case < 40:
          _classificacao = "Obesidade grau II(severa)";

        case > 40:
          _classificacao = "Obesidade grau III(Mórbida)";
      }
    }
  }

  String get classificacao => _classificacao;

  double get resultado => _resultado;
}
