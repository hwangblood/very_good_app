extension StrFormat on String {
  String get firstCapital {
    // ignore: omit_local_variable_types, prefer_final_locals
    List<String> values = split('');
    values[0] = values[0].toUpperCase();
    return values.join();
  }
}
