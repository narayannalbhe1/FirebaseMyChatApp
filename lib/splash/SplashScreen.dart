import 'package:firebase_mychat/intro/OnBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _colorAnimation = ColorTween(
      begin: Colors.blue[200],
      end: Colors.blue[800],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start animation
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });

    // Navigate after animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _colorAnimation.value,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo with scale animation
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.forum,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // App name with fade animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    "Talk With Friends",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Tagline with fade animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    "Connect with your community",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Loading indicator
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.8)),
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}