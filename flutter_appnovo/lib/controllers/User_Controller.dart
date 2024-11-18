import 'package:supabase_flutter/supabase_flutter.dart';

class UserController {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Cadastro de usuário
  Future<void> signUp(String email, String password) async {
    final response = await _supabase.auth.signUp(email, password);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  // Login de usuário
  Future<void> signIn(String email, String password) async {
    final response =
        await _supabase.auth.signIn(email: email, password: password);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  // Logout do usuário
  Future<void> signOut() async {
    final response = await _supabase.auth.signOut();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  // Recuperação de senha
  Future<void> resetPassword(String email) async {
    final response = await _supabase.auth.api.resetPasswordForEmail(email);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }
}
