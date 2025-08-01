bool isCPF(String cpf) {
  if (cpf.length != 11 || !RegExp(r'^\d+$').hasMatch(cpf)) {
    return false;
  }

  int sum = 0;
  int weight = 10;

  for (int i = 0; i < 9; i++) {
    sum += int.parse(cpf[i]) * weight--;
  }

  int firstCheckDigit = (sum * 10) % 11;
  if (firstCheckDigit == 10) firstCheckDigit = 0;

  if (firstCheckDigit != int.parse(cpf[9])) {
    return false;
  }

  sum = 0;
  weight = 11;

  for (int i = 0; i < 10; i++) {
    sum += int.parse(cpf[i]) * weight--;
  }

  int secondCheckDigit = (sum * 10) % 11;
  if (secondCheckDigit == 10) secondCheckDigit = 0;

  return secondCheckDigit == int.parse(cpf[10]);
}

bool isCNPJ(String cnpj) {
  if (cnpj.length != 14 || !RegExp(r'^\d+$').hasMatch(cnpj)) {
    return false;
  }

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

bool isCEP(String cep) {
  return RegExp(r'^\d{5}-?\d{3}$').hasMatch(cep);
}

bool isCNH(String cnh) {
  cnh = cnh.replaceAll(RegExp(r'[\.\-\/]+'), '');
  if (cnh.isEmpty ||
      cnh.length != 11 ||
      RegExp(r'^(\d)\1{10}$').hasMatch(cnh)) {
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

bool isRenavam(String renavam) {
  if (renavam.length != 11 || !RegExp(r'^\d+$').hasMatch(renavam)) {
    return false;
  }

  int sum = 0;
  int weight = 2;

  for (int i = renavam.length - 2; i >= 0; i--) {
    sum += int.parse(renavam[i]) * weight++;
    if (weight > 9) weight = 2;
  }

  int checkDigit = (sum * 10) % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(renavam[10]);
}

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

bool isChavePix(String chave) {
  return RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  ).hasMatch(chave);
}

bool isPisPasep(String pis) {
  if (pis.length != 11 || !RegExp(r'^\d+$').hasMatch(pis)) {
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

bool isRG(String rg) {
  if (rg.length < 8 || rg.length > 10 || !RegExp(r'^\d+$').hasMatch(rg)) {
    return false;
  }

  int sum = 0;
  int weight = rg.length - 1;

  for (int i = 0; i < rg.length - 1; i++) {
    sum += int.parse(rg[i]) * weight--;
    if (weight < 2) weight = rg.length - 1;
  }

  int checkDigit = sum % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(rg[rg.length - 1]);
}

bool isTituloEleitoral(String titulo) {
  if (titulo.length != 12 || !RegExp(r'^\d+$').hasMatch(titulo)) {
    return false;
  }

  int sum = 0;
  int weight = 2;

  for (int i = titulo.length - 2; i >= 0; i--) {
    sum += int.parse(titulo[i]) * weight++;
    if (weight > 9) weight = 2;
  }

  int checkDigit = (sum * 10) % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(titulo[11]);
}

bool isCertidaoDeNascimento(String certidao) {
  if (certidao.length != 15 || !RegExp(r'^\d+$').hasMatch(certidao)) {
    return false;
  }

  int sum = 0;
  int weight = 2;

  for (int i = certidao.length - 2; i >= 0; i--) {
    sum += int.parse(certidao[i]) * weight++;
    if (weight > 9) weight = 2;
  }

  int checkDigit = (sum * 10) % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(certidao[14]);
}

bool isCNS(String cns) {
  if (cns.length != 15 || !RegExp(r'^\d+$').hasMatch(cns)) {
    return false;
  }

  int sum = 0;
  int weight = 2;

  for (int i = cns.length - 2; i >= 0; i--) {
    sum += int.parse(cns[i]) * weight++;
    if (weight > 9) weight = 2;
  }

  int checkDigit = (sum * 10) % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(cns[14]);
}

bool isNIF(String nif) {
  if (nif.length != 9 || !RegExp(r'^\d+$').hasMatch(nif)) {
    return false;
  }

  int sum = 0;
  int weight = 2;

  for (int i = nif.length - 2; i >= 0; i--) {
    sum += int.parse(nif[i]) * weight++;
    if (weight > 9) weight = 2;
  }

  int checkDigit = (sum * 10) % 11;
  if (checkDigit == 10) checkDigit = 0;

  return checkDigit == int.parse(nif[8]);
}
