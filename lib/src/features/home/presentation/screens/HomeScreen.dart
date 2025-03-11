import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/persentation/AuthBloc/AuthBloc.dart';
import '../../../auth/persentation/AuthBloc/AuthEvent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001A3F),
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "Welcome Home!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF001A3F),
    );
  }
}
