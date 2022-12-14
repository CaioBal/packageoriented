import 'package:core/app/core_services.dart';
import 'package:flutter/material.dart';
import 'package:login/app/login_controller.dart';
import 'package:shared_dashboard_login/shared_dashboard_login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: MyAppBar(appText: "Login"),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: userController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Usuário"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  obscureText: true,
                  controller: passController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Senha"),
                ),
              ),
              ElevatedButton(
                  onPressed: () => {
                        if (LoginController()
                            .login(userController.text, passController.text))
                          {
                            navigatorKey.currentState?.pushNamed('/dashboard'),
                          }
                      },
                  child: const Text("Entrar")),
            ],
          ),
        ),
      ),
    );
  }
}
