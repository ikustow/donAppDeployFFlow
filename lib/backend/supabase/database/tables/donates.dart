import '../database.dart';

class DonatesTable extends SupabaseTable<DonatesRow> {
  @override
  String get tableName => 'donates';

  @override
  DonatesRow createRow(Map<String, dynamic> data) => DonatesRow(data);
}

class DonatesRow extends SupabaseDataRow {
  DonatesRow(super.data);

  @override
  SupabaseTable get table => DonatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  int? get value => getField<int>('value');
  set value(int? value) => setField<int>('value', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);
}
