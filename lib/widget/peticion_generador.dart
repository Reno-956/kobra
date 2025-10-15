import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> enviarFacturaAFepApi({
required String url,
required String apiKey,
required Map<String, dynamic> jsonBody,
}) async {

  final headers = {
    'Content-Type': 'application/json',
    'Ocp-Apim-Subscription-Key': apiKey,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(jsonBody),
    );

    final responseData = jsonDecode(response.body);
    final statusCode = response.statusCode;

    return {
      'statusCode': statusCode,
      'data': responseData,
    };
    if (statusCode == 200) {

      if (responseData is Map<String, dynamic>) {
        return responseData;
      } else {
        throw Exception("Respuesta no válida del servidor");
      }
    } else {
      throw Exception(
        "Error HTTP ${response.statusCode}: ${response.reasonPhrase}");
    }
  } catch (e) {
    log("Error al enviar petición: $e");
    rethrow;
  }
}
