import 'package:due_kasir/controller/selling/events.dart';
import 'package:due_kasir/controller/selling/service.dart';
import 'package:due_kasir/controller/venta_controller.dart';
import 'package:due_kasir/controller/usuario_controller.dart';
import 'package:due_kasir/service/database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Database>(() => Database());
  getIt.registerLazySingleton<UsuarioController>(() => UsuarioController());
  getIt.registerLazySingleton<CartService>(() => CartService());
  getIt.registerLazySingleton<SellingController>(() =>
      SellingController(getIt.get<CartService>())..dispatch(CartStarted()));
}
