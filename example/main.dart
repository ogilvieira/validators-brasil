import 'package:validators_brasil/validators.dart';

void main() {
  print('=== Exemplos de Uso dos Validadores Brasil ===\n');

  // ===== CPF =====
  print('📄 Validação de CPF:');
  var cpfValidos = ['16878801079', '168.788.010-79', '665.153.040-21'];
  var cpfInvalidos = ['168.788.010-10', '11111111111', '52998224A25'];

  print('  ✅ CPFs válidos:');
  for (var cpf in cpfValidos) {
    print('    $cpf: ${isCPF(cpf)}');
  }

  print('  ❌ CPFs inválidos:');
  for (var cpf in cpfInvalidos) {
    print('    $cpf: ${isCPF(cpf)}');
  }
  print('');

  // ===== CNPJ =====
  print('🏢 Validação de CNPJ:');
  var cnpjValidos = ['00933180000164', '00.933.180/0001-64', '93350666000150'];
  var cnpjInvalidos = ['00933180000164a', '11111111111111', '11222333A00181'];

  print('  ✅ CNPJs válidos:');
  for (var cnpj in cnpjValidos) {
    print('    $cnpj: ${isCNPJ(cnpj)}');
  }

  print('  ❌ CNPJs inválidos:');
  for (var cnpj in cnpjInvalidos) {
    print('    $cnpj: ${isCNPJ(cnpj)}');
  }
  print('');

  // ===== CEP =====
  print('📮 Validação de CEP:');
  var cepValidos = ['12345-678', '12345678'];
  var cepInvalidos = ['1234-567', '12345-67A', ''];

  print('  ✅ CEPs válidos:');
  for (var cep in cepValidos) {
    print('    $cep: ${isCEP(cep)}');
  }

  print('  ❌ CEPs inválidos:');
  for (var cep in cepInvalidos) {
    print('    $cep: ${isCEP(cep)}');
  }
  print('');

  // ===== CNH =====
  print('🚗 Validação de CNH (Carteira Nacional de Habilitação):');
  var cnhValidos = ['02650306461'];
  var cnhInvalidos = ['02650306460', '11111111111', '0265030646A'];

  print('  ✅ CNHs válidas:');
  for (var cnh in cnhValidos) {
    print('    $cnh: ${isCNH(cnh)}');
  }

  print('  ❌ CNHs inválidas:');
  for (var cnh in cnhInvalidos) {
    print('    $cnh: ${isCNH(cnh)}');
  }
  print('');

  // ===== RENAVAM =====
  print('🚙 Validação de RENAVAM:');
  var renavamValidos = ['00197073212', '71199648424', '62185388230'];
  var renavamInvalidos = ['33333333333', '6398849620A', '639884962000'];

  print('  ✅ RENAVAMs válidos:');
  for (var renavam in renavamValidos) {
    print('    $renavam: ${isRenavam(renavam)}');
  }

  print('  ❌ RENAVAMs inválidos:');
  for (var renavam in renavamInvalidos) {
    print('    $renavam: ${isRenavam(renavam)}');
  }
  print('');

  // ===== UF =====
  print('🗺️ Validação de UF (Unidade Federativa):');
  var ufValidos = ['SP', 'rj', 'Df', 'MG', 'RS'];
  var ufInvalidos = ['XX', 'S', 'SaoPaulo', ''];

  print('  ✅ UFs válidas:');
  for (var uf in ufValidos) {
    print('    $uf: ${isUF(uf)}');
  }

  print('  ❌ UFs inválidas:');
  for (var uf in ufInvalidos) {
    print('    $uf: ${isUF(uf)}');
  }
  print('');

  // ===== CHAVE PIX =====
  print('💳 Validação de Chave PIX (UUID v4):');
  var pixValidos = [
    '123e4567-e89b-12d3-a456-426614174000',
    'abcdef12-3456-7890-abcd-ef1234567890',
    '00000000-0000-0000-0000-000000000000'
  ];
  var pixInvalidos = [
    '123e4567e89b12d3a456426614174000', // sem hífens
    '123E4567-E89B-12D3-A456-426614174000', // maiúsculas
    'g23e4567-e89b-12d3-a456-426614174000' // caractere inválido
  ];

  print('  ✅ Chaves PIX válidas:');
  for (var pix in pixValidos) {
    print('    $pix: ${isChavePix(pix)}');
  }

  print('  ❌ Chaves PIX inválidas:');
  for (var pix in pixInvalidos) {
    print('    $pix: ${isChavePix(pix)}');
  }
  print('');

  // ===== PIS/PASEP =====
  print('💼 Validação de PIS/PASEP:');
  var pisValidos = ['995.31693.11-1', '99531693111', '14035492716'];
  var pisInvalidos = ['9953169311a', '995.31693.11-b', '1206512341A'];

  print('  ✅ PIS/PASEPs válidos:');
  for (var pis in pisValidos) {
    print('    $pis: ${isPisPasep(pis)}');
  }

  print('  ❌ PIS/PASEPs inválidos:');
  for (var pis in pisInvalidos) {
    print('    $pis: ${isPisPasep(pis)}');
  }
  print('');

  // ===== DEMONSTRAÇÃO DE USO EM FORMULÁRIO =====
  print('📝 Exemplo de uso em validação de formulário:\n');

  void validarDados(Map<String, String> dados) {
    print('Validando dados do usuário:');

    if (dados['cpf'] != null) {
      var cpfValido = isCPF(dados['cpf']!);
      print(
          '  CPF (${dados['cpf']}): ${cpfValido ? "✅ Válido" : "❌ Inválido"}');
    }

    if (dados['cnpj'] != null) {
      var cnpjValido = isCNPJ(dados['cnpj']!);
      print(
          '  CNPJ (${dados['cnpj']}): ${cnpjValido ? "✅ Válido" : "❌ Inválido"}');
    }

    if (dados['cep'] != null) {
      var cepValido = isCEP(dados['cep']!);
      print(
          '  CEP (${dados['cep']}): ${cepValido ? "✅ Válido" : "❌ Inválido"}');
    }

    if (dados['uf'] != null) {
      var ufValido = isUF(dados['uf']!);
      print('  UF (${dados['uf']}): ${ufValido ? "✅ Válido" : "❌ Inválido"}');
    }

    if (dados['pix'] != null) {
      var pixValido = isChavePix(dados['pix']!);
      print(
          '  Chave PIX (${dados['pix']}): ${pixValido ? "✅ Válido" : "❌ Inválido"}');
    }
  }

  // Exemplo 1: Dados válidos
  print('Exemplo 1 - Dados válidos:');
  validarDados({
    'cpf': '168.788.010-79',
    'cep': '12345-678',
    'uf': 'SP',
    'pix': '123e4567-e89b-12d3-a456-426614174000'
  });

  print('');

  // Exemplo 2: Dados inválidos
  print('Exemplo 2 - Dados inválidos:');
  validarDados({
    'cpf': '111.111.111-11',
    'cnpj': '11.111.111/0001-11',
    'cep': '1234-567',
    'uf': 'XX',
    'pix': '123E4567-E89B-12D3-A456-426614174000'
  });
}
