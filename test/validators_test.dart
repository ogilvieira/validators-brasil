import 'package:test/test.dart';
import 'package:validators_brasil/validators_brasil.dart';

void main() {
  group('isChavePix', () {
    test('valid Pix key (UUID v4)', () {
      expect(
        isChavePix('123e4567-e89b-12d3-a456-426614174000'),
        isTrue,
      );
      expect(
        isChavePix('abcdef12-3456-7890-abcd-ef1234567890'),
        isTrue,
      );
      expect(
        isChavePix('00000000-0000-0000-0000-000000000000'),
        isTrue,
      );
    });

    test('invalid Pix key (wrong format)', () {
      expect(
        isChavePix('123e4567e89b12d3a456426614174000'), // missing hyphens
        isFalse,
      );
      expect(
        isChavePix('123e4567-e89b-12d3-a456-42661417400'), // too short
        isFalse,
      );
      expect(
        isChavePix('123e4567-e89b-12d3-a456-4266141740000'), // too long
        isFalse,
      );
      expect(
        isChavePix('g23e4567-e89b-12d3-a456-426614174000'), // invalid hex char
        isFalse,
      );
      expect(
        isChavePix(''), // empty string
        isFalse,
      );
    });

    test('invalid Pix key (uppercase letters)', () {
      expect(
        isChavePix('123E4567-E89B-12D3-A456-426614174000'),
        isFalse,
      );
    });
  });

  group('isCPF', () {
    test('valid CPF', () {
      expect(isCPF('16878801079'), isTrue);
      expect(isCPF('168.788.010-79'), isTrue);
      expect(isCPF('665.153.040-21'), isTrue);
    });

    test('invalid CPF', () {
      expect(isCPF('168.788.010-79a'), isFalse);
      expect(isCPF('168.788.010-10'), isFalse);
      expect(isCPF('11111111111'), isFalse);
      expect(isCPF(''), isFalse);
      expect(isCPF('5299822472'), isFalse); // too short
      expect(isCPF('529982247251'), isFalse); // too long
      expect(isCPF('52998224A25'), isFalse); // non-digit
    });
  });

  group('isCNPJ', () {
    test('valid CNPJ', () {
      expect(isCNPJ('00933180000164'), isTrue);
      expect(isCNPJ('00.933.180/0001-64'), isTrue);
      expect(isCNPJ('93350666000150'), isTrue);
      expect(isCNPJ('73312680000152'), isTrue);
    });

    test('invalid CNPJ', () {
      expect(isCNPJ('00933180000164a'), isFalse);
      expect(isCNPJ('001112220000133'), isFalse);
      expect(isCNPJ('11222333000180'), isFalse);
      expect(isCNPJ('73312680000153'), isFalse);
      expect(isCNPJ('11111111111111'), isFalse);
      expect(isCNPJ(''), isFalse);
      expect(isCNPJ('1122233300018'), isFalse); // too short
      expect(isCNPJ('112223330001811'), isFalse); // too long
      expect(isCNPJ('11222333A00181'), isFalse); // non-digit
    });
  });

  group('isCEP', () {
    test('valid CEP', () {
      expect(isCEP('12345-678'), isTrue);
      expect(isCEP('12345678'), isTrue);
    });

    test('invalid CEP', () {
      expect(isCEP('1234-567'), isFalse);
      expect(isCEP('1234567'), isFalse);
      expect(isCEP(''), isFalse);
      expect(isCEP('12345-6789'), isFalse);
      expect(isCEP('12345-67A'), isFalse);
    });
  });

  group('isCNH', () {
    test('valid CNH', () {
      expect(isCNH('02650306461'), isTrue);
    });

    test('invalid CNH', () {
      expect(isCNH('02650306461A'), isFalse);
      expect(isCNH('02650306460'), isFalse);
      expect(isCNH('11111111111'), isFalse);
      expect(isCNH(''), isFalse);
      expect(isCNH('0265030646'), isFalse); // too short
      expect(isCNH('026503064611'), isFalse); // too long
      expect(isCNH('0265030646A'), isFalse); // non-digit
    });
  });

  group('isRenavam', () {
    test('valid Renavam', () {
      expect(isRenavam('00197073212'), isTrue);
      expect(isRenavam('71199648424'), isTrue);
      expect(isRenavam('62185388230'), isTrue);
    });

    test('invalid Renavam', () {
      expect(isRenavam('00197073212a'), isFalse);
      expect(isRenavam('33333333333'), isFalse);
      expect(isRenavam(''), isFalse);
      expect(isRenavam('71199648420'), isFalse); // too short
      expect(isRenavam('639884962000'), isFalse); // too long
      expect(isRenavam('6398849620A'), isFalse); // non-digit
    });
  });

  group('isUF', () {
    test('valid UF', () {
      expect(isUF('SP'), isTrue);
      expect(isUF('rj'), isTrue);
      expect(isUF('Df'), isTrue);
    });

    test('invalid UF', () {
      expect(isUF('XX'), isFalse);
      expect(isUF(''), isFalse);
      expect(isUF('S'), isFalse);
      expect(isUF('SaoPaulo'), isFalse);
    });
  });

  group('isPisPasep', () {
    test('valid PIS/PASEP', () {
      expect(isPisPasep('995.31693.11-1'), isTrue);
      expect(isPisPasep('99531693111'), isTrue);
      expect(isPisPasep('14035492716'), isTrue);
    });

    test('invalid PIS/PASEP', () {
      expect(isPisPasep('9953169311a'), isFalse);
      expect(isPisPasep('995.31693.11-b'), isFalse);
      expect(isPisPasep(''), isFalse);
      expect(isPisPasep('1206512341'), isFalse); // too short
      expect(isPisPasep('120651234100'), isFalse); // too long
      expect(isPisPasep('1206512341A'), isFalse); // non-digit
    });
  });
}
