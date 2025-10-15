import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

Uint8List _int32be(int i) {
  return Uint8List(4)
    ..buffer.asByteData().setUint32(0, i, Endian.big);
}

/*Uint8List _hmac(Hmac hmac, List<int> key, List<int> data) {
  final mac = Hmac(hmac.algorithm, key);
  return mac.convert(data).bytes as Uint8List;
}*/

Uint8List pbkdf2(
    String password,
    Uint8List salt, {
      int iterations = 100000,
      int derivedKeyLength = 32,
    }) {
  final passBytes = utf8.encode(password);
  final hLen = 32;
  final l = (derivedKeyLength / hLen).ceil();
  final r = derivedKeyLength - (l - 1) * hLen;
  final out = BytesBuilder();

  final hmac = Hmac(sha256, passBytes);

  for (var i = 1; i <= l; i++) {
    final block = BytesBuilder();
    block.add(salt);
    block.add(_int32be(i));
    Uint8List ui = hmac.convert(block.toBytes()).bytes as Uint8List;
    final t = Uint8List.fromList(ui);

    for (var j = 1; j < iterations; j++) {
      ui = hmac.convert(ui).bytes as Uint8List; // Uj
      for (var k = 0; k < t.length; k++) {
        t[k] = t[k] ^ ui[k];
      }
    }
    out.add(t);
  }

  final derived = out.toBytes();
  return Uint8List.sublistView(Uint8List.fromList(derived), 0, derivedKeyLength);
}

String generateSaltBase64([int length = 16]) {
  final rand = Random.secure();
  final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
  return base64Encode(bytes);
}

String hashPasswordBase64(String password, {String? saltBase64, int iterations = 100000, int dkLen = 32}) {
  final saltBytes = saltBase64 != null ? base64Decode(saltBase64) : base64Decode(generateSaltBase64());
  final dk = pbkdf2(password, Uint8List.fromList(saltBytes), iterations: iterations, derivedKeyLength: dkLen);
  return base64Encode(dk);
}

bool verifyPassword(String password, String saltBase64, String hashBase64, {int iterations = 100000, int dkLen = 32}) {
  final computed = hashPasswordBase64(password, saltBase64: saltBase64, iterations: iterations, dkLen: dkLen);
  return constantTimeEquals(base64Decode(computed), base64Decode(hashBase64));
}

bool constantTimeEquals(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  var diff = 0;
  for (var i = 0; i < a.length; i++) {
    diff |= a[i] ^ b[i];
  }
  return diff == 0;
}
