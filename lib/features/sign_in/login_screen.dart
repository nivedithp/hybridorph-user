import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../util/value_validator.dart';
import 'signin_bloc/signin_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen1(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: BlocConsumer<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen1()),
              (route) => false,
            );
          } else if (state is SigninFailureState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Failed'),
                content: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Hydro Orpho",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Welcome back to login",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(height: 10),

                      // Email TextField
                      TextFormField(
                        enabled: state is! SigninLoadingState,
                        controller: _emailController,
                        validator: emailValidator,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 20),

                      // Password TextField
                      TextFormField(
                        enabled: state is! SigninLoadingState,
                        controller: _passwordController,
                        obscureText: _isPasswordVisible,
                        validator: passwordValidator,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                _isPasswordVisible = !_isPasswordVisible;
                                setState(() {});
                              },
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                      ),

                      SizedBox(height: 20),

                      // Login Button
                      ElevatedButton(
                        onPressed: state is SigninLoadingState
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<SigninBloc>(context).add(
                                    SigninEvent(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 104, 188),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: state is SigninLoadingState
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
