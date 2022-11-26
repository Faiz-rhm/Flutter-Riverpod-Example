import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/src/features/auth/widgets/custom_input.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameTextController = TextEditingController(text: '');
    final passwordTextController = TextEditingController(text: '');


    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInput(
                hint: 'E-mail or Username',
                controller: userNameTextController
              ),
              const SizedBox(height: 16,),
              CustomInput(
                hint: 'Password',
                controller: passwordTextController
              ),
              const SizedBox(height: 16,),
              MaterialButton(
                height: 56,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                color: Colors.black,
                onPressed: () {},
                child: const Text('Login', style: TextStyle(
                  color: Colors.white
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
