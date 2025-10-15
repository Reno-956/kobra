import 'dart:developer';
import 'dart:io';
import 'package:due_kasir/model/venta_model.dart';
import 'package:due_kasir/utils/env.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart';

import '../../service/database.dart';
import '../../widget/peticion_generador.dart';

class VentaSincro{
  static Future<bool> procesarVenta(VentaModel venta) async {
    try {
      final newItem = venta;
      final numeroFactura = venta.id.toString();
      final json = null;

      const apiUrl = Environment.urlApi;
      const apiKey = Environment.apiKey;

      final output = await getDownloadsDirectory();
      final file = File("${output?.path}/$numeroFactura.xml");

      final resultado = await enviarFacturaAFepApi(
        url: apiUrl,
        apiKey: apiKey,
        jsonBody: json,
      );

      final statusCode = resultado['statusCode'];
      final data = resultado['data'];

      if (statusCode == 200) {
        final rawXml = data['xmlFirmado'] ?? '';
        final document = XmlDocument.parse(rawXml);
        final xmlFormateado = document.toXmlString(pretty: true, indent: '  ');
        await file.writeAsString(xmlFormateado);

        venta.esSincronizado = true;
        await Database().actualizarVenta(venta);
        log("Venta ${venta.id} sincronizada correctamente");
        return true;
      } else {
        log('Error al sincronizar venta ${venta.id} ($statusCode)');
        log('Detalles: ${data['error'] ?? 'Sin detalles'}');
        return false;
      }
    } catch (e) {
      log('Error en procesarVenta: $e');
      return false;
    }
  }
}
