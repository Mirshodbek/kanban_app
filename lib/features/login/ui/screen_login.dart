import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/features/kanban/ui/screen_kanban.dart';
import 'package:kanban_app/features/login/bloc/bloc_auth.dart';
import 'package:kanban_app/main.dart';
import 'package:kanban_app/widgets/app_loader.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> loginKey;
  late GlobalKey<FormState> passwordKey;

  @override
  void initState() {
    loginKey = GlobalKey<FormState>();
    passwordKey = GlobalKey<FormState>();
    loginController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get validated => [
        loginKey.currentState?.validate(),
        passwordKey.currentState?.validate(),
      ].every((e) => e ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban'),
      ),
      body: BlocListener<BlocAuth, StateBlocAuth>(
        listener: (context, state) {
          if (state is StateAuthLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          if (state is StateAuthError) {
            scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.message,
                ),
              ),
            );
          }
          if (state is StateAuthAuthorized) {

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ScreenKanban(),
              ),
            );
          }
        },
        child: AppLoaderOverlay(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _AppTextFields(
                  formKey: loginKey,
                  controller: loginController,
                  hintText: 'Enter login',
                  onChanged: (_) => loginKey.currentState?.validate(),
                  validator: (value) {
                    if (value == null) return null;
                    if (value.length < 4) {
                      return 'Maximum in 4 characters';
                    }
                  },
                ),
                const SizedBox(height: 20),
                _AppTextFields(
                  formKey: passwordKey,
                  hintText: 'Enter password',
                  controller: passwordController,
                  onChanged: (_) => passwordKey.currentState?.validate(),
                  validator: (value) {
                    if (value == null) return null;
                    if (value.length < 8) {
                      return 'Maximum in 8 characters';
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (validated) {
                      context.read<BlocAuth>().add(
                            EventAuthLogin(
                              username: loginController.text,
                              password: passwordController.text,
                            ),
                          );
                    }
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppTextFields extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;
  final String? hintText;

  const _AppTextFields({
    Key? key,
    this.formKey,
    this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.green,
                ))),
      ),
    );
  }
}
