// lib/pages/auth_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/providers/auth_provider.dart';
import 'package:visionary_project/states/auth_state.dart';
import 'package:visionary_project/widgets/bg_image.dart';

/// A screen that handles user authentication
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

/// State class for AuthScreen
class _AuthScreenState extends ConsumerState<AuthScreen> {
  /// initState() is called after the widget is built for the first time
  @override
  void initState() {
    super.initState();
    // The addPostFrameCallback() method is used to execute a callback after the frame has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // read the authProvider.notifier and call the checkLoginStatus() method
      ref.read(authProvider.notifier).checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    // The ref.listen() method is used to listen to changes in the state of a provider.
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isLoggedIn) {
        // replace the current screen with the VisionBoardScreen
        Navigator.pushReplacementNamed(context, Constants.boardScreen);
      } else if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage ?? 'An error occurred'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    });

    return Scaffold(
        body: Stack(
      children: [
        BackgroundImage(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                Constants.appTitle,
                style: TextStyle(
                    fontSize: 77,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                // Read the authProvider.notifier and call the signIn() method
                onPressed: () => ref.read(authProvider.notifier).signIn(),
                icon: const Icon(FontAwesomeIcons.google),
                label: const Text('Sign in with Google'),
                style: ButtonStyle(
                  // Set the fixed size of the button
                  fixedSize: WidgetStateProperty.all(const Size(350, 60)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
