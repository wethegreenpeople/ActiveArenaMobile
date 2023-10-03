abstract class Constants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANON',
    defaultValue: '',
  );

  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: '',
  );
}
