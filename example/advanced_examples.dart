import 'package:validators_brasil/validators_brasil.dart';

/// Exemplo de uma classe para validação de cadastro de pessoa física
class ValidadorPessoaFisica {
  static Map<String, dynamic> validarCadastro({
    required String cpf,
    required String cep,
    required String uf,
    String? cnh,
    String? pis,
    String? chavePix,
  }) {
    Map<String, dynamic> resultado = {
      'valido': true,
      'erros': <String>[],
    };

    // Validar CPF (obrigatório)
    if (!isCPF(cpf)) {
      resultado['valido'] = false;
      resultado['erros'].add('CPF inválido: $cpf');
    }

    // Validar CEP (obrigatório)
    if (!isCEP(cep)) {
      resultado['valido'] = false;
      resultado['erros'].add('CEP inválido: $cep');
    }

    // Validar UF (obrigatório)
    if (!isUF(uf)) {
      resultado['valido'] = false;
      resultado['erros'].add('UF inválida: $uf');
    }

    // Validar CNH (opcional)
    if (cnh != null && cnh.isNotEmpty && !isCNH(cnh)) {
      resultado['valido'] = false;
      resultado['erros'].add('CNH inválida: $cnh');
    }

    // Validar PIS (opcional)
    if (pis != null && pis.isNotEmpty && !isPisPasep(pis)) {
      resultado['valido'] = false;
      resultado['erros'].add('PIS/PASEP inválido: $pis');
    }

    // Validar Chave PIX (opcional)
    if (chavePix != null && chavePix.isNotEmpty && !isChavePix(chavePix)) {
      resultado['valido'] = false;
      resultado['erros'].add('Chave PIX inválida: $chavePix');
    }

    return resultado;
  }
}

/// Exemplo de uma classe para validação de cadastro de pessoa jurídica
class ValidadorPessoaJuridica {
  static Map<String, dynamic> validarCadastro({
    required String cnpj,
    required String cep,
    required String uf,
    String? chavePix,
  }) {
    Map<String, dynamic> resultado = {
      'valido': true,
      'erros': <String>[],
    };

    // Validar CNPJ (obrigatório)
    if (!isCNPJ(cnpj)) {
      resultado['valido'] = false;
      resultado['erros'].add('CNPJ inválido: $cnpj');
    }

    // Validar CEP (obrigatório)
    if (!isCEP(cep)) {
      resultado['valido'] = false;
      resultado['erros'].add('CEP inválido: $cep');
    }

    // Validar UF (obrigatório)
    if (!isUF(uf)) {
      resultado['valido'] = false;
      resultado['erros'].add('UF inválida: $uf');
    }

    // Validar Chave PIX (opcional)
    if (chavePix != null && chavePix.isNotEmpty && !isChavePix(chavePix)) {
      resultado['valido'] = false;
      resultado['erros'].add('Chave PIX inválida: $chavePix');
    }

    return resultado;
  }
}

/// Exemplo de validação de dados de veículos
class ValidadorVeiculo {
  static Map<String, dynamic> validarDados({
    required String renavam,
    String? proprietarioCpf,
    String? proprietarioCnpj,
    String? condutorCnh,
  }) {
    Map<String, dynamic> resultado = {
      'valido': true,
      'erros': <String>[],
    };

    // Validar RENAVAM (obrigatório)
    if (!isRenavam(renavam)) {
      resultado['valido'] = false;
      resultado['erros'].add('RENAVAM inválido: $renavam');
    }

    // Validar proprietário (deve ser CPF ou CNPJ)
    bool temProprietarioValido = false;
    if (proprietarioCpf != null && proprietarioCpf.isNotEmpty) {
      if (isCPF(proprietarioCpf)) {
        temProprietarioValido = true;
      } else {
        resultado['erros']
            .add('CPF do proprietário inválido: $proprietarioCpf');
      }
    }

    if (proprietarioCnpj != null && proprietarioCnpj.isNotEmpty) {
      if (temProprietarioValido) {
        resultado['erros']
            .add('Informe apenas CPF ou CNPJ do proprietário, não ambos');
      } else if (isCNPJ(proprietarioCnpj)) {
        temProprietarioValido = true;
      } else {
        resultado['erros']
            .add('CNPJ do proprietário inválido: $proprietarioCnpj');
      }
    }

    if (!temProprietarioValido) {
      resultado['valido'] = false;
      resultado['erros']
          .add('É necessário informar CPF ou CNPJ válido do proprietário');
    }

    // Validar CNH do condutor (opcional)
    if (condutorCnh != null && condutorCnh.isNotEmpty && !isCNH(condutorCnh)) {
      resultado['valido'] = false;
      resultado['erros'].add('CNH do condutor inválida: $condutorCnh');
    }

    if (resultado['erros'].isNotEmpty) {
      resultado['valido'] = false;
    }

    return resultado;
  }
}

void main() {
  print('=== Exemplos Práticos de Validação ===\n');

  // ===== CADASTRO PESSOA FÍSICA =====
  print('👤 Validação de Cadastro - Pessoa Física\n');

  // Exemplo 1: Cadastro válido
  var resultadoPF1 = ValidadorPessoaFisica.validarCadastro(
    cpf: '168.788.010-79',
    cep: '12345-678',
    uf: 'SP',
    cnh: '02650306461',
    pis: '99531693111',
    chavePix: '123e4567-e89b-12d3-a456-426614174000',
  );

  print('Exemplo 1 - Todos os dados válidos:');
  print('  Válido: ${resultadoPF1['valido']}');
  if (resultadoPF1['erros'].isNotEmpty) {
    print('  Erros: ${resultadoPF1['erros']}');
  }
  print('');

  // Exemplo 2: Cadastro com erros
  var resultadoPF2 = ValidadorPessoaFisica.validarCadastro(
    cpf: '111.111.111-11', // CPF inválido
    cep: '1234-567', // CEP inválido
    uf: 'XX', // UF inválida
    cnh: '11111111111', // CNH inválida
    chavePix: '123E4567-E89B-12D3', // PIX inválido
  );

  print('Exemplo 2 - Dados com erros:');
  print('  Válido: ${resultadoPF2['valido']}');
  print('  Erros:');
  for (var erro in resultadoPF2['erros']) {
    print('    - $erro');
  }
  print('');

  // ===== CADASTRO PESSOA JURÍDICA =====
  print('🏢 Validação de Cadastro - Pessoa Jurídica\n');

  // Exemplo 1: Cadastro válido
  var resultadoPJ1 = ValidadorPessoaJuridica.validarCadastro(
    cnpj: '00.933.180/0001-64',
    cep: '01234-567',
    uf: 'RJ',
    chavePix: 'abcdef12-3456-7890-abcd-ef1234567890',
  );

  print('Exemplo 1 - Dados válidos:');
  print('  Válido: ${resultadoPJ1['valido']}');
  if (resultadoPJ1['erros'].isNotEmpty) {
    print('  Erros: ${resultadoPJ1['erros']}');
  }
  print('');

  // ===== CADASTRO DE VEÍCULO =====
  print('🚗 Validação de Dados de Veículo\n');

  // Exemplo 1: Veículo de pessoa física
  var resultadoVeiculo1 = ValidadorVeiculo.validarDados(
    renavam: '00197073212',
    proprietarioCpf: '665.153.040-21',
    condutorCnh: '02650306461',
  );

  print('Exemplo 1 - Veículo de pessoa física:');
  print('  Válido: ${resultadoVeiculo1['valido']}');
  if (resultadoVeiculo1['erros'].isNotEmpty) {
    print('  Erros: ${resultadoVeiculo1['erros']}');
  }
  print('');

  // Exemplo 2: Veículo de pessoa jurídica
  var resultadoVeiculo2 = ValidadorVeiculo.validarDados(
    renavam: '71199648424',
    proprietarioCnpj: '93350666000150',
  );

  print('Exemplo 2 - Veículo de pessoa jurídica:');
  print('  Válido: ${resultadoVeiculo2['valido']}');
  if (resultadoVeiculo2['erros'].isNotEmpty) {
    print('  Erros: ${resultadoVeiculo2['erros']}');
  }
  print('');

  // Exemplo 3: Dados com erros
  var resultadoVeiculo3 = ValidadorVeiculo.validarDados(
    renavam: '33333333333', // RENAVAM inválido
    proprietarioCpf: '111.111.111-11', // CPF inválido
    proprietarioCnpj: '11.111.111/0001-11', // CNPJ inválido (conflito com CPF)
    condutorCnh: '11111111111', // CNH inválida
  );

  print('Exemplo 3 - Dados com múltiplos erros:');
  print('  Válido: ${resultadoVeiculo3['valido']}');
  print('  Erros:');
  for (var erro in resultadoVeiculo3['erros']) {
    print('    - $erro');
  }
  print('');

  // ===== FUNÇÃO UTILITÁRIA =====
  print('🔧 Função Utilitária para Validação Rápida\n');

  void validacaoRapida(String tipo, String valor) {
    bool resultado = false;

    switch (tipo.toLowerCase()) {
      case 'cpf':
        resultado = isCPF(valor);
        break;
      case 'cnpj':
        resultado = isCNPJ(valor);
        break;
      case 'cep':
        resultado = isCEP(valor);
        break;
      case 'cnh':
        resultado = isCNH(valor);
        break;
      case 'renavam':
        resultado = isRenavam(valor);
        break;
      case 'uf':
        resultado = isUF(valor);
        break;
      case 'pix':
        resultado = isChavePix(valor);
        break;
      case 'pis':
        resultado = isPisPasep(valor);
        break;
      default:
        print('  Tipo de validação não reconhecido: $tipo');
        return;
    }

    print('  $tipo: $valor → ${resultado ? "✅ Válido" : "❌ Inválido"}');
  }

  print('Exemplos de validação rápida:');
  validacaoRapida('CPF', '168.788.010-79');
  validacaoRapida('CNPJ', '00.933.180/0001-64');
  validacaoRapida('CEP', '12345-678');
  validacaoRapida('UF', 'SP');
  validacaoRapida('CNH', '02650306461');
  validacaoRapida('RENAVAM', '00197073212');
  validacaoRapida('PIX', '123e4567-e89b-12d3-a456-426614174000');
  validacaoRapida('PIS', '99531693111');
}
