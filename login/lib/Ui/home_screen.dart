import 'package:firebaseapp/services/login_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final username;
  const HomeScreen({
    super.key,
    required this.username,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = Authentication();
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isloading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 243, 239),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 240, 243, 239),
          centerTitle: true,
          title: const Text(
            'Home Screen',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _auth.signout(context);
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: _isloading
              ? const CircularProgressIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(widget.username.photoURL),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${widget.username.displayName}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${widget.username.email}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
