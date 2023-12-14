double calculateIMC(
  double altura,
  double peso,
  double imc,
) {
  double imc = peso / (altura * altura);
  imc = double.parse(imc.toStringAsFixed(2));
  return imc;
}
