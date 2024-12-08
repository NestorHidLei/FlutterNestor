import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';  
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormularioPage(),
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario Personalizado')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          child: ListView(
            children: [
              // Campo de texto
              FormBuilderTextField(
                name: 'nombre',
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(3),
                ]),
              ),
              const SizedBox(height: 10),

              // Campo de correo electrónico
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 10),

              // Campo de contraseña
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(8),
                ]),
              ),
              const SizedBox(height: 10),

              // Campo de fecha
              FormBuilderDateTimePicker(
                name: 'fecha',
                inputType: InputType.date,
                decoration: const InputDecoration(labelText: 'Fecha'),
                format: DateFormat('yyyy-MM-dd'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 10),

              // Campo de teléfono (Ajustado)
              FormBuilderTextField(
                name: 'telefono',
                decoration: const InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),  // Valida que sean números
                  FormBuilderValidators.minLength(9), // Asegura al menos 10 caracteres
                  FormBuilderValidators.maxLength(9), // Asegura no más de 10 caracteres
                ]),
              ),
              const SizedBox(height: 10),

              // Campo numérico
              FormBuilderTextField(
                name: 'cantidad',
                decoration: const InputDecoration(labelText: 'Cantidad'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              const SizedBox(height: 10),

              // Botón de envío
              ElevatedButton(
                onPressed: () {
                  if (_fbKey.currentState?.saveAndValidate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulario válido')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error en el formulario')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
