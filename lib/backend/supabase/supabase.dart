import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://dhromlfgjzjbnzkwvfkm.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRocm9tbGZnanpqYm56a3d2ZmttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEzMTM4MjAsImV4cCI6MjAyNjg4OTgyMH0.jKa4da5sIVyAmrvgoPTEy0hQlRldi-g8rDwokZA56iY';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
