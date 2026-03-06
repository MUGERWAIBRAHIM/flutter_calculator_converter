// filepath: c:\Users\IBRA\Desktop\MESOB_CALC\calc\lib\features\calculator\presentation\calculator_logic.dart
class CalculatorLogic {
  String _expression = "";
  String _result = "0";

  String get expression => _expression;
  String get result => _result;

  void clear() {
    _expression = "";
    _result = "0";
  }

  void input(String value) {
    _expression += value;
  }

  void toggleSign() {
    if (_expression.startsWith("-")) {
      _expression = _expression.substring(1);
    } else {
      _expression = "-$_expression";
    }
  }

  void percentage() {
    final value = double.tryParse(_expression);
    if (value != null) {
      _expression = (value / 100).toString();
    }
  }

  void evaluate() {
    try {
      final exp = _expression
          .replaceAll("×", "*")
          .replaceAll("÷", "/")
          .replaceAll("−", "-"); // Ensure consistent minus
      final result = _evaluateExpression(exp);
      _result = result.toString();
    } catch (_) {
      _result = "Error";
    }
  }

  double _evaluateExpression(String exp) {
    // Simple recursive evaluator for +, -, *, / with precedence
    // Tokenize the expression
    final tokens = _tokenize(exp);
    return _parseExpression(tokens, 0).value;
  }

  List<String> _tokenize(String exp) {
    final tokens = <String>[];
    final buffer = StringBuffer();
    for (int i = 0; i < exp.length; i++) {
      final char = exp[i];
      if ('0123456789.'.contains(char)) {
        buffer.write(char);
      } else {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }
        tokens.add(char);
      }
    }
    if (buffer.isNotEmpty) tokens.add(buffer.toString());
    return tokens;
  }

  _ParseResult _parseExpression(List<String> tokens, int index) {
    var result = _parseTerm(tokens, index);
    while (result.index < tokens.length &&
        (tokens[result.index] == '+' || tokens[result.index] == '-')) {
      final op = tokens[result.index];
      final next = _parseTerm(tokens, result.index + 1);
      if (op == '+') {
        result = _ParseResult(result.value + next.value, next.index);
      } else {
        result = _ParseResult(result.value - next.value, next.index);
      }
    }
    return result;
  }

  _ParseResult _parseTerm(List<String> tokens, int index) {
    var result = _parseFactor(tokens, index);
    while (result.index < tokens.length &&
        (tokens[result.index] == '*' || tokens[result.index] == '/')) {
      final op = tokens[result.index];
      final next = _parseFactor(tokens, result.index + 1);
      if (op == '*') {
        result = _ParseResult(result.value * next.value, next.index);
      } else if (op == '/' && next.value != 0) {
        result = _ParseResult(result.value / next.value, next.index);
      } else {
        throw Exception('Division by zero');
      }
    }
    return result;
  }

  _ParseResult _parseFactor(List<String> tokens, int index) {
    if (tokens[index] == '(') {
      final result = _parseExpression(tokens, index + 1);
      if (result.index < tokens.length && tokens[result.index] == ')') {
        return _ParseResult(result.value, result.index + 1);
      }
      throw Exception('Mismatched parentheses');
    } else {
      return _ParseResult(double.parse(tokens[index]), index + 1);
    }
  }
}

class _ParseResult {
  final double value;
  final int index;
  _ParseResult(this.value, this.index);
}