import 'package:flutter/material.dart';
import 'package:flutter_state/utils/output_state.dart';
import 'package:flutter_state/utils/state_blue.dart';
import 'package:flutter_state/utils/state_red.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  String _outputText = '';
  Color _outputColor = const Color(0xFFC62828);
  OutputState? _outputState;

  @override
  void initState() {
    super.initState();

    _outputState = StateRed();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _changeRed() {
    _outputState = StateRed();
    setState(() {
      _outputColor = _outputState!.getColor();
      _outputText = _outputState!.getText();
    });
  }

  void _changeBlue() {
    _outputState = StateBlue();
    setState(() {
      _outputColor = _outputState!.getColor();
      _outputText = _outputState!.getText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _changeRed,
                  child: Text('赤色'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _changeBlue,
                  child: Text('青色'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _outputText,
              style: TextStyle(
                color: _outputColor,
              )
            ),
          ],
        ),
      ),
    );
  }
}
