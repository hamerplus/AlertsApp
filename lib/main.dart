
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memes Colombianos',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 253, 194, 0)),
      ),
      home: const MyHomePage(title: 'Sonidos chistoso'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Lista de sonidos de emergencia (debes agregar los archivos en assets/audio/)
  final List<Map<String, String>> emergencySounds = [
    {'label': 'Grito de michael jackson', 'file': 'Descarga Efecto De Sonido De Michael Jackson - Gritos.mp3'},
    {'label': 'Me dice feo', 'file': 'Ella dice que soy feo.mp3'},
    {'label': 'Vende guineo', 'file': 'Idioto... Boca e fa.mp3'},
    {'label': 'Dorian?', 'file': 'Alo con Dorian (cheems).mp3'},
  ];

  void _playSound(String fileName) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audio/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sonidos de memes'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image:DecorationImage(
          image: AssetImage("assets/imagen/premium_photo-1664304287258-f4509f1efb3b.jfif"),
          fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text(
                "presiona para reirte:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black,
                    )
                  ]
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ...emergencySounds.map((sound) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 60),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.white.withOpacity(0.8), // botón semi-transparente
                      ),
                       icon: const Icon(
                         Icons.volume_up, // Icono de sonido
                         color: Color.fromARGB(255, 102, 65, 17),
                      ),
                      label: Text(sound['label']!),
                      onPressed: () => _playSound(sound['file']!),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ),
    );
  }
}