import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthProvider, bool>((ref) => AuthProvider());

class AuthProvider extends StateNotifier<bool> {
  AuthProvider(): super(false);

  void login() {

  }

}
