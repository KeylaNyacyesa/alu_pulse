import 'package:flutter/material.dart';

import 'main_navigation.dart';
import 'sign_in_page.dart';

/// A simple model describing one of the degree programs a student can pick.
class Degree {
  final String code;
  final String name;
  final IconData icon;

  const Degree({required this.code, required this.name, required this.icon});
}

/// SignUpPage lets a new student create an ALU Pulse account.
/// In addition to name, email and password, the student must choose the
/// degree program they are studying: BSE, BEL or BIT.
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Shared color palette (matches the rest of the app).
  static const Color darkBlue = Color(0xFF071222);
  static const Color cardBlue = Color(0xFF101E33);
  static const Color yellow = Color(0xFFFFBE22);
  static const Color softText = Color(0xFFB9C2D3);

  /// The three ALU undergraduate degree programs the user can choose from.
  static const List<Degree> degrees = [
    Degree(
      code: 'BSE',
      name: 'Software Engineering',
      icon: Icons.code,
    ),
    Degree(
      code: 'BEL',
      name: 'Entrepreneurial Leadership',
      icon: Icons.lightbulb_outline,
    ),
    Degree(
      code: 'IBT',
      name: 'International Business & Trade',
      icon: Icons.public,
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  /// The currently selected degree code (e.g. 'BSE'). Null until the user picks.
  String? _selectedDegree;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Validates the form (including the degree choice) and opens the home page.
  void _createAccount() {
    final formIsValid = _formKey.currentState!.validate();

    // A degree must be selected — show a message if it has not been.
    if (_selectedDegree == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please choose your degree program'),
          backgroundColor: cardBlue,
        ),
      );
      return;
    }

    if (formIsValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigation()),
      );
    }
  }

  /// Returns to the Sign In screen for users who already have an account.
  void _goToSignIn() {
    // If we were pushed from Sign In, just pop back; otherwise replace.
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        backgroundColor: darkBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _goToSignIn,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Join ALU Pulse and never miss a moment on campus',
                      style: TextStyle(color: softText, fontSize: 14),
                    ),
                    const SizedBox(height: 30),
                    _buildLabel('Full Name'),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _nameController,
                      hint: 'e.g. Aline Umuhoza',
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('ALU Email'),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _emailController,
                      hint: 'you@alustudent.com',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('Password'),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _passwordController,
                      hint: 'Create a password',
                      icon: Icons.lock_outline,
                      obscure: _obscurePassword,
                      suffix: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: softText,
                        ),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please create a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildLabel('What are you studying?'),
                    const SizedBox(height: 12),
                    _buildDegreeSelector(),
                    const SizedBox(height: 30),
                    _buildPrimaryButton('Create Account', _createAccount),
                    const SizedBox(height: 22),
                    _buildSignInPrompt(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Small label shown above each input field / section.
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: softText,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Reusable styled text field used for name, email and password.
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: softText, fontSize: 14),
        prefixIcon: Icon(icon, color: softText),
        suffixIcon: suffix,
        filled: true,
        fillColor: cardBlue,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: yellow, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.4),
        ),
      ),
    );
  }

  /// Degree selector: three tappable cards for BSE, BEL and BIT.
  /// The selected card is highlighted with the yellow accent color.
  Widget _buildDegreeSelector() {
    return Column(
      children: degrees.map((degree) {
        final bool isSelected = _selectedDegree == degree.code;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              setState(() => _selectedDegree = degree.code);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isSelected ? yellow.withOpacity(0.12) : cardBlue,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected
                      ? yellow
                      : Colors.white.withOpacity(0.06),
                  width: isSelected ? 1.6 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? yellow
                          : yellow.withOpacity(0.14),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      degree.icon,
                      color: isSelected ? darkBlue : yellow,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          degree.code,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          degree.name,
                          style: const TextStyle(
                            color: softText,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // A check mark appears on the selected option.
                  Icon(
                    isSelected
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: isSelected ? yellow : softText,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  /// The main yellow action button.
  Widget _buildPrimaryButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: yellow,
          foregroundColor: darkBlue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// "Already have an account? Sign in" row at the bottom of the screen.
  Widget _buildSignInPrompt() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            'Already have an account? ',
            style: TextStyle(color: softText, fontSize: 14),
          ),
          GestureDetector(
            onTap: _goToSignIn,
            child: Text(
              'Sign In',
              style: TextStyle(
                color: yellow,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
