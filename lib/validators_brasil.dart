/// Validates a Brazilian CPF number.
///
/// Returns `true` if the given [cpf] is valid, otherwise returns `false`.
bool isCPF(String cpf) {
  cpf = cpf.replaceAll(RegExp(r'[\.\-\/]+'), '');

  if (cpf.isEmpty ||
      cpf.length != 11 ||
      RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) {
    return false;
  }

  cpf = cpf.replaceAll(RegExp(r'\D'), '');

  int sum = 0;
  int remainder;

  for (int i = 1; i <= 9; i++) {
    sum += int.parse(cpf[i - 1]) * (11 - i);
  }
  remainder = (sum * 10) % 11;
  if (remainder == 10 || remainder == 11) remainder = 0;
  if (remainder != int.parse(cpf[9])) return false;

  sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += int.parse(cpf[i - 1]) * (12 - i);
  }
  remainder = (sum * 10) % 11;
  if (remainder == 10 || remainder == 11) remainder = 0;
  if (remainder != int.parse(cpf[10])) return false;

  return true;
}

/// Validates a Brazilian CNPJ number.
///
/// Returns `true` if the given [cnpj] is valid, otherwise returns `false`.
bool isCNPJ(String cnpj) {
  cnpj = cnpj.replaceAll(RegExp(r'[\.\-\/]+'), '');
  if (cnpj.length != 14 || !RegExp(r'^\d+$').hasMatch(cnpj)) {
    return false;
  }

  cnpj = cnpj.replaceAll(RegExp(r'\D'), '');

  int sum = 0;
  int weight = 5;

  for (int i = 0; i < 12; i++) {
    sum += int.parse(cnpj[i]) * weight--;
    if (weight < 2) weight = 9;
  }

  int firstCheckDigit = (sum * 10) % 11;
  if (firstCheckDigit == 10) firstCheckDigit = 0;

  if (firstCheckDigit != int.parse(cnpj[12])) {
    return false;
  }

  sum = 0;
  weight = 6;

  for (int i = 0; i < 13; i++) {
    sum += int.parse(cnpj[i]) * weight--;
    if (weight < 2) weight = 9;
  }

  int secondCheckDigit = (sum * 10) % 11;
  if (secondCheckDigit == 10) secondCheckDigit = 0;

  return secondCheckDigit == int.parse(cnpj[13]);
}

/// Validates a Brazilian CEP (postal code).
///
/// Returns `true` if the given [cep] is valid, otherwise returns `false`.
bool isCEP(String cep) {
  return RegExp(r'^\d{5}-?\d{3}$').hasMatch(cep);
}

/// Validates a Brazilian CNH (driver's license) number.
///
/// Returns `true` if the given [cnh] is valid, otherwise returns `false`.
bool isCNH(String cnh) {
  cnh = cnh.replaceAll(RegExp(r'[\.\-\/]+'), '');
  if (cnh.isEmpty ||
      cnh.length != 11 ||
      RegExp(r'^(\d)\1{10}$').hasMatch(cnh)) {
    return false;
  }

  cnh = cnh.replaceAll(RegExp(r'\D'), '');
  if (cnh.length != 11) {
    return false;
  }

  int factor = 9;
  int sumDv1 = 0;
  int aux = 0;
  int dv1 = int.parse(cnh[9]);
  int dv2 = int.parse(cnh[10]);

  for (int i = 0; i <= 8; i++) {
    sumDv1 += int.parse(cnh[i]) * factor;
    factor--;
  }

  int dv1Valid = sumDv1 % 11;
  if (dv1Valid >= 10) {
    dv1Valid = 0;
    aux = 2;
  }

  if (dv1 != dv1Valid) return false;

  int sumDv2 = 0;
  factor = 1;
  for (int i = 0; i <= 8; i++) {
    sumDv2 += int.parse(cnh[i]) * factor;
    factor++;
  }

  int dv2Valid = sumDv2 % 11;
  dv2Valid = dv2Valid >= 10 ? 0 : dv2Valid - aux;

  if (dv2 != dv2Valid) return false;

  return true;
}

/// Validates a Brazilian RENAVAM (vehicle registration) number.
///
/// Returns `true` if the given [renavam] is valid, otherwise returns `false`.
bool isRenavam(String renavam) {
  if (renavam.isEmpty ||
      renavam.length != 11 ||
      RegExp(r'\D').hasMatch(renavam)) {
    return false;
  }

  renavam = renavam.replaceAll(RegExp(r'\D'), '');

  List<int> valueArr = renavam.split('').map(int.parse).toList();
  int factor = 2;
  int sum = 0;
  int dig = valueArr[10];

  for (int i = 0; i <= 9; i++) {
    sum += valueArr[9 - i] * factor;
    factor = (factor == 9) ? 2 : factor + 1;
  }

  int digValid = 11 - (sum % 11);

  return dig == (digValid >= 10 ? 0 : digValid);
}

/// Validates if the given [uf] is a valid Brazilian state abbreviation (UF).
///
/// Returns `true` if [uf] is a valid UF, otherwise returns `false`.
bool isUF(String uf) {
  const validUFs = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO',
  ];
  return validUFs.contains(uf.toUpperCase());
}

/// Validates a Brazilian Pix key in UUID format.
///
/// Returns `true` if the given [chave] matches the Pix UUID pattern, otherwise returns `false`.
bool isChavePix(String chave) {
  return RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  ).hasMatch(chave);
}

/// Validates a Brazilian PIS/PASEP number.
///
/// Returns `true` if the given [pis] is valid, otherwise returns `false`.
bool isPisPasep(String pis) {
  pis = pis.replaceAll(RegExp(r'\D'), '');
  if (pis.length != 11) {
    return false;
  }

  int sum = 0;
  int weight = 3;

  for (int i = 0; i < 10; i++) {
    sum += int.parse(pis[i]) * weight--;
    if (weight < 2) weight = 9;
  }

  int checkDigit = (sum * 10) % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(pis[10]);
}
