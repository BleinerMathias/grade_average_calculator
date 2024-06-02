import 'package:flutter/material.dart';

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _grade1Controller = TextEditingController();
  final TextEditingController _grade2Controller = TextEditingController();
  final TextEditingController _grade3Controller = TextEditingController();

  String _name = '';
  String _email = '';
  String _grades = '';
  String _average = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tarefa Final DM1 2024.1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CALCULADOR DE MÉDIA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildGradeInput(_grade1Controller, 'Nota 1'),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildGradeInput(_grade2Controller, 'Nota 2'),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildGradeInput(_grade3Controller, 'Nota 3'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _calculateAverage,
                  child: const Text(
                    'CALCULA MÉDIA',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Resultado:',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Nome: $_name',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Email: $_email',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Notas: $_grades',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Média: $_average',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _clearFields,
                  child: const Text(
                    'APAGA OS CAMPOS',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildGradeInput(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Insira a $label';
        }
        return null;
      },
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'É necessário informar o nome do aluno';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'É necessário informar o email do aluno';
    }
    return null;
  }

  void _calculateAverage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _name = _nameController.text;
        _email = _emailController.text;
        double grade1 = double.parse(_grade1Controller.text);
        double grade2 = double.parse(_grade2Controller.text);
        double grade3 = double.parse(_grade3Controller.text);
        _grades = '${_grade1Controller.text} - ${_grade2Controller.text} - ${_grade3Controller.text}';
        _average = ((grade1 + grade2 + grade3) / 3).toStringAsFixed(1);
      });
    }
  }

  void _clearFields() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _grade1Controller.clear();
      _grade2Controller.clear();
      _grade3Controller.clear();
      _name = '';
      _email = '';
      _grades = '';
      _average = '';
    });
  }
}
