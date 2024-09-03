import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:flutter/material.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
// import 'package:cell_counter/widgets/sidebar.dart';

class CounterForm extends StatefulWidget {
  const CounterForm({super.key});

  @override
  _CounterFormState createState() => _CounterFormState();
}

class _CounterFormState extends State<CounterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers to capture form data
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _samplesController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _dilutionController = TextEditingController();
  final TextEditingController _quadrantsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Información sobre el conteo",
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            form(_formKey),
            const SizedBox(
              height: 60,
            ),
            GenericButtonOnPress(
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(
                    context,
                    'counter',
                    arguments: {
                      'date': _dateController.text,
                      'name': _nameController.text,
                      'samples': int.parse(_samplesController.text),
                      'volume': double.parse(
                          _volumeController.text.replaceAll(RegExp(r','), '.')),
                      'dilution': double.parse(_dilutionController.text),
                      'quadrants': int.parse(_quadrantsController.text),
                    },
                  );
                }
              },
              inv: true,
              name: "Continuar",
              iconData: Icons.navigate_next,
              // routeToNav: "counter",
            )
          ]),
        ),
      ),
    );
  }

  Form form(GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: primary_en, // Color de la barra superior
                      // accentColor: Colors.blue, // Color de los botones de acción
                      colorScheme: ColorScheme.light(
                          primary:
                              primary_en), // Color de los días seleccionados
                      buttonTheme: ButtonThemeData(
                        textTheme: ButtonTextTheme
                            .primary, // Color del texto de los botones
                      ),
                    ),
                    child: child!,
                  );
                });

            if (pickedDate != null) {
              setState(() {
                _dateController.text =
                    "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
              });
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: _dateController,
              keyboardType: TextInputType.datetime,
              autocorrect: false,
              decoration: Input_Decorations(
                  'dia-mes-año', 'Fecha', const Icon(Icons.date_range)),
            ),
          ),
        ),
        TextFormField(
          controller: _nameController,
          decoration: Input_Decorations('', 'Nombre', const Icon(Icons.abc)),
          validator: (value) {
            return (value != null && value != "" && value.length <= 20)
                ? null
                : "El nombre debe tener menos de 20 caracteres";
          },
        ),
        TextFormField(
          controller: _samplesController,
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
              '', 'Cantidad de muestras', const Icon(Icons.numbers)),
          validator: (value) {
            return (value != null && value != "" && int.parse(value) > 0)
                ? null
                : "Valor Inválido";
          },
        ),
        TextFormField(
          controller: _volumeController,
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations('', 'Volumen en mL (homogenado)',
              const Icon(Icons.numbers_rounded)),
          validator: (value) {
            return (value != null &&
                    value != "" &&
                    double.parse(value.replaceAll(RegExp(r','), '.')) > 0)
                ? null
                : "Valor Inválido";
          },
        ),
        TextFormField(
          controller: _dilutionController,
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
            '',
            'Dilución',
            const Icon(Icons.numbers_rounded),
            prefix: "1:",
          ),
          validator: (value) {
            return (value != null && value != "" && int.parse(value) > 0)
                ? null
                : "Valor Inválido";
          },
        ),
        TextFormField(
          controller: _quadrantsController,
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
              '', 'No. de Cuadrantes', const Icon(Icons.numbers)),
          validator: (value) {
            return (value != null &&
                    value != "" &&
                    int.parse(value) > 0 &&
                    int.parse(value) <= 5)
                ? null
                : "Valor Inválido";
          },
        ),
        const SizedBox(width: 30),
      ]),
    );
  }

  InputDecoration Input_Decorations(
      String hintText, String labelText, Icon icon,
      {String prefix = ""}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(116, 84, 11, 11),
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 98, 11, 11), width: 2)),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: icon,
        prefix: Text(prefix));
  }
}
