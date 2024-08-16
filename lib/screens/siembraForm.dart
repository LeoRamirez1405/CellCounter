import 'package:cell_counter/model.dart';
import 'package:cell_counter/screens/siembraResult.dart';
import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:flutter/material.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
// import 'package:cell_counter/widgets/sidebar.dart';

class SiembraForm extends StatefulWidget {
  List<Sample> samplesList;

  SiembraForm({super.key, required this.samplesList});

  @override
  _SiembraFormState createState() => _SiembraFormState();
}

class _SiembraFormState extends State<SiembraForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers to capture form data
  final TextEditingController _concentracionController =
      TextEditingController();
  final TextEditingController _volController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Siembra",
      body: Center(
        child: Container(
          //width: 350,
          padding: const EdgeInsets.all(40),

          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            form(_formKey),
            const SizedBox(
              height: 20,
            ),
            GenericButtonOnPress(
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(
                    context,
                    'siembraResult',
                    arguments: {
                      'samplesList': widget.samplesList,
                      'concentracion':
                          double.parse(_concentracionController.text),
                      'vol': double.parse(_volController.text),
                    },
                  );
                }
              },
              inv: true,
              name: "Continuar",
              iconData: Icons.navigate_next,
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
        TextFormField(
            controller: _concentracionController,
            keyboardType: TextInputType.datetime,
            autocorrect: false,
            decoration: Input_Decorations(
                '',
                "Concentración de células para sembrar",
                const Icon(Icons.grid_view_rounded)),
            validator: (value) {
              return (value != null && value != "" && double.parse(value) > 0)
                  ? null
                  : "Valor inválido";
            }),
        TextFormField(
          controller: _volController,
          decoration: Input_Decorations(
              '', 'Volumen de siembra', const Icon(Icons.balance_rounded)),
          validator: (value) {
            return (value != null && value != "" && double.parse(value) > 0)
                ? null
                : "Valor inválido";
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
