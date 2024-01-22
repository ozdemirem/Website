import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'W E L L N E S S   R O U T E',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(118, 255, 166, 0)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const MyHomePage(title: 'W E L L N E S S   R O U T E'),
        '/healthyRecipes': (context) => HealthyRecipesPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String feedbackText = '';

  void _navigateToLoginScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void _navigateToMenuItem(String menuItem) {
    switch (menuItem) {
      case 'Healthy Recipes':
        Navigator.pushNamed(context, '/healthyRecipes');
        break;
    }
    Navigator.of(context).pop();
  }

  void _navigateToFeedbackScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback'),
          content: Column(
            children: [
              Text('Please provide your feedback:'),
              SizedBox(height: 8),
              TextField(
                maxLines: 3,
                onChanged: (text) {
                  setState(() {
                    feedbackText = text;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                print('Feedback submitted: $feedbackText');
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('MENU'),
                  content: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Height'),
                        child: Text('Height'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Weight'),
                        child: Text('Weight'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Body Mass Index'),
                        child: Text('Body Mass Index'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Healthy Recipes'),
                        child: Text('Healthy Recipes'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Exercises'),
                        child: Text('Exercises'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Meditations'),
                        child: Text('Meditations'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Articles'),
                        child: Text('Articles'),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => _navigateToMenuItem('Water Reminder'),
                        child: Text('Water Reminder'),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/resimm.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _navigateToLoginScreen,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _playSound();
          _navigateToFeedbackScreen();
        },
        tooltip: 'Feedback',
        child: Icon(Icons.feedback),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class HealthyRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Recipes'),
      ),
      body: Center(
        child: Text('This is the Healthy Recipes Page'),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void _playSound() {
  AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.play('assets/mzk.mp3', isLocal: true);
}
