# Exemplos de Uso - Validators Brasil

Esta pasta contém exemplos práticos de como usar a biblioteca `validators_brasil` em diferentes cenários.

## Arquivos de Exemplo

### 📁 `main.dart`
Exemplos básicos de todos os validadores disponíveis, incluindo:
- **CPF** - Cadastro de Pessoa Física
- **CNPJ** - Cadastro Nacional da Pessoa Jurídica
- **CEP** - Código de Endereçamento Postal
- **CNH** - Carteira Nacional de Habilitação
- **RENAVAM** - Registro Nacional de Veículos Automotores
- **UF** - Unidade Federativa
- **Chave PIX** - Chave UUID v4 para PIX
- **PIS/PASEP** - Programa de Integração Social/Programa de Formação do Patrimônio do Servidor Público

### 📁 `advanced_examples.dart`
Exemplos avançados com casos de uso práticos:
- Validação de cadastro de pessoa física
- Validação de cadastro de pessoa jurídica
- Validação de dados de veículos
- Classes utilitárias para validação
- Tratamento de erros e múltiplas validações

## Como Executar

Para executar os exemplos, certifique-se de que você tem o Dart instalado e execute:

```bash
# Exemplo básico
dart run example/main.dart

# Exemplos avançados
dart run example/advanced_examples.dart
```

## Validadores Disponíveis

| Validador | Função | Descrição |
|-----------|--------|-----------|
| CPF | `isCPF(String)` | Valida números de CPF brasileiros |
| CNPJ | `isCNPJ(String)` | Valida números de CNPJ brasileiros |
| CEP | `isCEP(String)` | Valida códigos postais brasileiros |
| CNH | `isCNH(String)` | Valida números de carteira de habilitação |
| RENAVAM | `isRenavam(String)` | Valida códigos RENAVAM de veículos |
| UF | `isUF(String)` | Valida códigos de estados brasileiros |
| Chave PIX | `isChavePix(String)` | Valida chaves PIX no formato UUID v4 |
| PIS/PASEP | `isPisPasep(String)` | Valida números PIS/PASEP |

## Formatos Aceitos

### CPF
- `12345678901` (apenas números)
- `123.456.789-01` (formatado)

### CNPJ
- `12345678000195` (apenas números)
- `12.345.678/0001-95` (formatado)

### CEP
- `12345678` (apenas números)
- `12345-678` (formatado)

### CNH
- `12345678901` (apenas números, 11 dígitos)

### RENAVAM
- `12345678901` (apenas números, 11 dígitos)

### UF
- `SP`, `RJ`, `MG` (maiúsculas)
- `sp`, `rj`, `mg` (minúsculas)
- `Sp`, `Rj`, `Mg` (misto - será convertido)

### Chave PIX (UUID v4)
- `123e4567-e89b-12d3-a456-426614174000` (minúsculas)
- Formato: `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

### PIS/PASEP
- `12345678901` (apenas números)
- `123.45678.90-1` (formatado)

## Dicas de Uso

1. **Formatação**: A maioria dos validadores aceita tanto números puros quanto formatados
2. **Case Sensitivity**: UF aceita qualquer combinação de maiúsculas/minúsculas
3. **Chave PIX**: Aceita apenas minúsculas (padrão UUID v4)
4. **Validação em Lote**: Use as classes utilitárias para validar múltiplos campos
5. **Tratamento de Erros**: Sempre verifique o retorno booleano antes de prosseguir

## Casos de Uso Comuns

### Validação de Formulário
```dart
bool validarFormulario(Map<String, String> dados) {
  if (!isCPF(dados['cpf'] ?? '')) return false;
  if (!isCEP(dados['cep'] ?? '')) return false;
  if (!isUF(dados['uf'] ?? '')) return false;
  return true;
}
```

### Validação Condicional
```dart
bool validarPessoa(String documento) {
  // Tenta validar como CPF primeiro, depois como CNPJ
  return isCPF(documento) || isCNPJ(documento);
}
```

### Limpeza de Dados
```dart
String limparDocumento(String documento) {
  return documento.replaceAll(RegExp(r'[^\d]'), '');
}
```

## Contribuindo

Para contribuir com novos exemplos:
1. Crie um novo arquivo `.dart` na pasta `example/`
2. Documente o caso de uso
3. Inclua exemplos de dados válidos e inválidos
4. Atualize este README
