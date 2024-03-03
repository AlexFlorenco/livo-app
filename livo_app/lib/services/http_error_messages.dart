enum ResultCodes {
  success,
  passwordsDoNotMatch,
  invalidForm,
  incorrectData,
  emailAlredyExists,
  offlineServer,
  unknownError,
}

class HTTPErrorMessages {
  static String? describeResultCodes(ResultCodes result) {
    switch (result) {
      case ResultCodes.success:
        return null;
      case ResultCodes.passwordsDoNotMatch:
        return 'As senhas não coincidem';
      case ResultCodes.invalidForm:
        return 'Formulário inválido';
      case ResultCodes.incorrectData:
        return 'Dados incorretos';
      case ResultCodes.emailAlredyExists:
        return 'E-mail já existe';
      case ResultCodes.offlineServer:
        return 'Servidor offline';
      case ResultCodes.unknownError:
        return 'Erro desconhecido';
    }
  }
}
