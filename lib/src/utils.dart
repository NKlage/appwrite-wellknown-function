/// Checks if the specified [keys] are included in the [obj]
///
/// Returns void if successful, otherwise throws an [Exception] with further
/// information.
void throwIfMissing(Map<String, dynamic> obj, List<String> keys) {
  final missing = <String>[];
  for (final key in keys) {
    if (!obj.containsKey(key) || obj[key] == null) {
      missing.add(key);
    }
  }
  if (missing.isNotEmpty) {
    throw Exception('Missing required fields: ${missing.join(', ')}');
  }
}
