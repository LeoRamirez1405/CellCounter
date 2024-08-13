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

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Información sobre el conteo",
      body: Center(
        child: Container(
          //width: 350,
          padding: const EdgeInsets.all(40),

          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            form(_formKey),
            const SizedBox(
              height: 20,
            ),
            GenericButton(
              // onPressed: () {
              //   if (_formKey.currentState!.validate()) {
              //     Navigator.pushNamed(context, 'counter');
              //   }
              // },
              inv: true,
              name: "Continuar",
              iconData: Icons.navigate_next,
              routeToNav: "counter",
            )
          ]),
        ),
      ),
    );
  }

  Form form(GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          keyboardType: TextInputType.datetime,
          autocorrect: false,
          decoration: Input_Decorations(
              'dia-mes-año', 'Fecha', const Icon(Icons.date_range)),
        ),
        TextFormField(
          decoration: Input_Decorations('', 'Nombre', const Icon(Icons.abc)),
          validator: (value) {
            return (value != null && value.length >= 20)
                ? null
                : "La contraseña debe tener menos de 20 caracteres";
          },
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
              '', 'Cantidad de muestras', const Icon(Icons.numbers)),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
              '', 'Volumen(homogenado)', const Icon(Icons.numbers_rounded)),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
              '', 'Dilución', const Icon(Icons.numbers_rounded)),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          decoration: Input_Decorations(
              '', 'No. de Cuadrantes', const Icon(Icons.numbers)),
        ),
        const SizedBox(width: 30),
      ]),
    );
  }
}

Form form() {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(children: [
      TextFormField(
        keyboardType: TextInputType.datetime,
        autocorrect: false,
        decoration: Input_Decorations(
            'dia-mes-año', 'Fecha', const Icon(Icons.date_range)),
      ),
      TextFormField(
        decoration: Input_Decorations('', 'Nombre', const Icon(Icons.abc)),
        validator: (value) {
          return (value != null && value.length >= 20)
              ? null
              : "La contraseña debe tener menos de 20 caracteres";
        },
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        decoration: Input_Decorations(
            '', 'Cantidad de muestras', const Icon(Icons.numbers)),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        decoration: Input_Decorations(
            '', 'Volumen(homogenado)', const Icon(Icons.numbers_rounded)),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        decoration: Input_Decorations(
            '', 'Dilución', const Icon(Icons.numbers_rounded)),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        autocorrect: false,
        decoration: Input_Decorations(
            '', 'No. de Cuadrantes', const Icon(Icons.numbers)),
      ),
      const SizedBox(width: 30),
    ]),
  );
}

InputDecoration Input_Decorations(
    String hintText, String labelText, Icon icon) {
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
  );
}
