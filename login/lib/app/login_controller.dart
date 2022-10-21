class LoginController {
  bool login(String user, String pass) {
    if (user == "admin" && pass == "123") {
      return true;
    } else {
      throw Exception("Usuário ou senha incorretos");
    }
  }
}
