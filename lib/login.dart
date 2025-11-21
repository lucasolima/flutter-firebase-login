import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginPage = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isLoginPage) ? Colors.black : Colors.brown[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (isLoginPage) ? Colors.red : Colors.orangeAccent,
        title: Text(
          (isLoginPage) ? 'Tela de Login' : 'Tela de Cadastro',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  (isLoginPage)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  size: 110,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Por favor, insira seu email';
                    }
                    if (value.length < 8) {
                      return 'O email deve ter pelo menos 8 caracteres';
                    }
                    if (!value.contains('@')) {
                      return 'Por favor, insira um email válido';
                    }
                    if (!value.contains('.')) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Por favor, insira sua senha';
                    }
                    if (value.length < 8) {
                      return 'A senha deve ter pelo menos 8 caracteres';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5),
                Visibility(
                  visible: !isLoginPage,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String? value) {
                          if (value == null) {
                            return 'Por favor, confirme sua senha';
                          }
                          if (value.length < 8) {
                            return 'A senha deve ter pelo menos 8 caracteres';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirme a Senha",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        validator: (String? value) {
                          if (value == null) {
                            return 'Por favor, insira seu nome completo';
                          }
                          if (value.length < 3) {
                            return 'O nome deve ter pelo menos 3 caracteres';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Nome Completo",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: SizedBox(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (isLoginPage)
                            ? Colors.red
                            : Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        (isLoginPage) ? "Entrar" : "Cadastre-se",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLoginPage = !isLoginPage;
                    });
                  },
                  child: Text(
                    (isLoginPage) ? "Cadastre-se" : "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}