import 'package:due_kasir/controller/cliente_controller.dart';
import 'package:due_kasir/model/cliente_model.dart';
import 'package:due_kasir/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

class CustomerForm extends HookWidget {
  CustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    final customerFormKey = useMemoized(GlobalKey<FormState>.new);
    final cliente = clienteController.customerSelected.watch(context);
    final editingNombre = useTextEditingController(text: cliente?.nombre ?? '');
    final editingTelefono =
        useTextEditingController(text: (cliente?.telefono ?? '').toString());
    final editingIdentificacion =
        useTextEditingController(text: cliente?.identificacion ?? '');
    final editingDireccion =
        useTextEditingController(text: cliente?.direccion ?? '');
    //final status = useState(cliente?.estado ?? TipoEstado.act.message);
    final editingCorreo =
        useTextEditingController(text: (cliente?.correo ?? '').toString());
    //final editingTipoReceptor = useState(cliente?.tipoReceptor ?? '01');
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: customerFormKey,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShadButton.ghost(
                        child: const Text('Cerrar'),
                        onPressed: () => context.pop()),
                  ),
                  ShadInputFormField(
                    controller: editingIdentificacion,
                    validator: (val) => val.isEmpty == true
                        ? 'Identificación es requerido'
                        : null,
                    label: const Text('Identificación'),
                    placeholder: const Text('Ej: CI/RUC'),
                  ),
                  ShadInputFormField(
                    controller: editingNombre,
                    validator: (val) => val.isEmpty == true
                        ? 'Razon Social/Nombre es requerido'
                        : null,
                    label: const Text('Razon Social/Nombre'),
                    placeholder: const Text('Ej: Cliente'),
                  ),
                  ShadInputFormField(
                    controller: editingTelefono,
                    label: const Text('Teléfono'),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    placeholder: const Text('Ej: 02222222'),
                  ),
                  ShadInputFormField(
                    controller: editingCorreo,
                    validator: (val) =>
                        val.isEmpty == true ? 'Correo is requirido' : null,
                    label: const Text('Correo'),
                    placeholder: const Text('usuario@ejemplo.com'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ShadInputFormField(
                    controller: editingDireccion,
                    label: const Text('Dirección'),
                    placeholder: const Text('Ej: Calle A'),
                  ),
                  /*Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tipo Receptor',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ShadSelect<String>(
                              initialValue: cliente?.tipoReceptor,
                              placeholder:
                              const Text('Selecciona uno'),
                              options: [
                                ...tipoReceptorData.entries.map(
                                      (e) => ShadOption(
                                    value: e.key,
                                    child: Text(e.value),
                                  ),
                                ),
                              ],
                              onChanged: (String? value) =>
                              editingTipoReceptor.value = value!,
                              selectedOptionBuilder: (context, value) =>
                                  Text(tipoReceptorData[value]!),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Estado',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ShadSelect<String>(
                                  initialValue: cliente?.estado,
                                  placeholder:
                                      const Text('Selecciona el estado'),
                                  options: TipoEstado.values.map((e) {
                                    return ShadOption(
                                      value: e.message,
                                      child: Text(e.message),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      status.value = value;
                                    }
                                  },
                                  selectedOptionBuilder: (context, value) {
                                    final selectedEnum = TipoEstado.values.firstWhere(
                                          (e) => e.message == value,
                                      orElse: () => TipoEstado.act,
                                    );
                                    return Text(selectedEnum.message);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),*/
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (cliente != null)
                          ShadButton.destructive(
                            child: const Text('Borrar'),
                            onPressed: () {
                              Database()
                                  .borrarCliente(cliente.id!)
                                  .whenComplete(() async {
                                await clienteController.clientes.refresh();
                                if (context.mounted) Navigator.pop(context);
                              });
                            },
                          ),
                        ShadButton(
                          child: const Text('Guardar cambios'),
                          onPressed: () {
                            if (customerFormKey.currentState!.validate()) {
                              if (cliente != null) {
                                final updateCustomer = ClienteModel(
                                  id: cliente.id,
                                  nombre: editingNombre.text,
                                  identificacion: editingIdentificacion.text,
                                  telefono: editingTelefono.text,
                                  correo: editingCorreo.text,
                                  direccion: editingDireccion.text,
                                );

                                Database()
                                    .actualizarCliente(updateCustomer)
                                    .whenComplete(() {
                                  Future.delayed(Durations.short1).then((_) {
                                    clienteController.clientes.refresh();
                                    if (context.mounted) context.pop();
                                  });
                                });
                              } else {
                                final newCustomer = ClienteModel(
                                  id: DateTime.now().microsecondsSinceEpoch,
                                  nombre: editingNombre.text,
                                  identificacion: editingIdentificacion.text,
                                  telefono: editingTelefono.text,
                                  correo: editingCorreo.text,
                                  direccion: editingDireccion.text,
                                  fechaCreacion: DateTime.now(),
                                );

                                Database()
                                    .agregarCliente(newCustomer)
                                    .whenComplete(() {
                                  clienteController.clientes.refresh();
                                  if (context.mounted) context.pop();
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
