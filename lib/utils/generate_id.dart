import 'dart:convert';
import 'package:crypto/crypto.dart';

String normalizeAddressKey(String key) {
  return key
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

String generateId(String key) {
  final bytes = utf8.encode(key);
  final digest = md5.convert(bytes);

  return digest.toString();
}