import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        
      ),
      home: const MyHomePage(title: 'NemehHasah'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // for audio
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }


  // for counter
  int _counter = 0; // initial value for counter

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _audioPlayer.play(AssetSource('sounds/click1.wav'));
  } 
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _audioPlayer.play(AssetSource('sounds/click2.wav'));
  }
  void _resetCounter() {
    setState(() { _counter = 0; });
    _audioPlayer.play(AssetSource('sounds/reset.wav'));
  }

  // for opening URL
  final Uri _url = Uri.parse('https://github.com/xicko'); // parsing the URL
  Future<void> _launchUrl() async {
     if (!await launchUrl(_url)) {
       throw Exception('Couldn\'t launch');
     }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300
          )
          ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Та товчийг',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.indigo,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500
              ),
            ),

            Text(
              ' $_counter ',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.indigo,
                fontStyle: FontStyle.normal,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 96,
              ),
            ),

            Text(
              'удаа дарсан байна.',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.indigo,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _launchUrl,
              //tooltip: 'Reset',
              child: const Icon(Icons.open_in_browser_rounded),
            ),
          ],
        ),
      ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 20,
        children: [          
          FloatingActionButton(
            onPressed: _resetCounter,
            tooltip: 'Reset',
            child: const Icon(Icons.refresh_rounded),
          ),

          FloatingActionButton.large(
            onPressed: _incrementCounter,
            tooltip: 'Nemeh',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton.large(
            onPressed: _decrementCounter,
            tooltip: 'Hasah',
            child: const Icon(Icons.remove),
          ),
        ]
      )
      
    );
  }
}