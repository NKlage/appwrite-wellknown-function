/// check for missing keys in map
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
