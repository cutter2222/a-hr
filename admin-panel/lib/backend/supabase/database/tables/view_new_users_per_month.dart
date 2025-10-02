import '../database.dart';

class ViewNewUsersPerMonthTable extends SupabaseTable<ViewNewUsersPerMonthRow> {
  @override
  String get tableName => 'view_new_users_per_month';

  @override
  ViewNewUsersPerMonthRow createRow(Map<String, dynamic> data) =>
      ViewNewUsersPerMonthRow(data);
}

class ViewNewUsersPerMonthRow extends SupabaseDataRow {
  ViewNewUsersPerMonthRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewNewUsersPerMonthTable();

  DateTime? get month => getField<DateTime>('month');
  set month(DateTime? value) => setField<DateTime>('month', value);

  double? get newUsers => getField<double>('new_users');
  set newUsers(double? value) => setField<double>('new_users', value);
}
