import 'package:flutter/material.dart';

class AnimatedSnackbar extends StatefulWidget {
  @override
  _AnimatedSnackbarState createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<AnimatedSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isSnackbarVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen (bottom)
      end: const Offset(0, 0), // End on-screen (center)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _showSnackbar() {
    setState(() {
      _isSnackbarVisible = true;
      _animationController.forward();
    });
  }

  void _hideSnackbar() {
    _animationController.reverse().then((_) {
      setState(() {
        _isSnackbarVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Snackbar')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (_isSnackbarVisible) {
              _hideSnackbar();
            } else {
              _showSnackbar();
            }
          },
          child: Text(_isSnackbarVisible ? 'Hide Snackbar' : 'Show Snackbar'),
        ),
      ),
      bottomNavigationBar: _isSnackbarVisible
          ? SlideTransition(
              position: _slideAnimation,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'This is an animated snackbar!',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: _hideSnackbar,
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}