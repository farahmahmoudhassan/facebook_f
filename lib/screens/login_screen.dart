
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    bool validEmail = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);

    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    bool hasNumber = RegExp(r'[0-9]').hasMatch(password);
    bool hasSpecialCharacter =
    RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]').hasMatch(password);

    if (email.isEmpty || password.isEmpty) {
      showMessage("Please enter email and password");
    } else if (!validEmail) {
      showMessage("Please enter a valid email");
    } else if (!hasUppercase ||
        !hasLowercase ||
        !hasNumber ||
        !hasSpecialCharacter) {
      showMessage("Password must contain uppercase, lowercase, number and special character");
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),

              Center(
                child: Image.asset(
                  "assets/image/facebook_logo.png",
                  width: 100,
                  height: 100,
                ),
              ),

              SizedBox(height: 50),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 28),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFEEF1F7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFBFC5D0),
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Mobile Number or Email Address",
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 25),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 28),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFEEF1F7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFBFC5D0),
                  ),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 28),
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1877F2),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgotten Password?",
                  style: TextStyle(
                    color: Color(0xFF8A8D91),
                    fontSize: 14,
                  ),
                ),
              ),

              SizedBox(height: 80),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 28),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Color(0xFF1877F2),
                      ),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color(0xFF1877F2),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Image.asset(
                "assets/image/Meta_logo.png",
                width: 100,
                height: 60,
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
