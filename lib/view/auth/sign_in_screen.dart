import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/login_bloc/auth_bloc.dart';
import 'package:task/bloc/login_bloc/auth_events.dart';
import 'package:task/configs/components/powered_by_widget.dart';
import 'package:task/configs/routes/routes_name.dart';
import 'package:task/main.dart';
import 'package:task/model/auth/login_request.dart';
import 'package:task/utils/enums/enums.dart';
import 'package:task/utils/extensions/context_ext.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/view/auth/widget/sign_in_with_widget.dart';
import 'package:task/view/home/home_screen.dart';

import '../../bloc/login_bloc/auth_states.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      //powered by text
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: PoweredByWidget(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: theme.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Let’s save environment together",
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height/4,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  //middle part
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: theme.textTheme.bodyMedium,
                      ),
                      //email text feild
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'user@example.com',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Password",
                        style: theme.textTheme.bodyMedium,
                      ),
                      //password text feild
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'user@example.com',
                        ),
                      ),
                      //remember me and forgotten password part
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text(
                            "Remember Me",
                            style: theme.textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgotten Password",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          )
                        ],
                      ),

                      //login button
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          LoginRequestEvent(
                                            loginRequest: LoginRequest(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          ),
                                        );
                                    try {
                                      context
                                          .read<AuthBloc>()
                                          .add(LoginButtonClickEvent());

                                        Navigator.pushNamed(
                                          context,
                                          RoutesName.home,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Login Successfull")));
                                        _passwordController.clear();
                                        _emailController.clear();

                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text("Login Failed")));
                                    }
                                  }
                                },
                                child: state.loginStatus == LoginStatus.loading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text("Sign In"));
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Or Sign In with",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(.4),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //sign in with part
                      SignInWithWidget(
                        googleOnPressed: () {},
                        facebookOnPressed: () {},
                        microsoftOPressed: () {},
                        appOnPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //don't have account text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't Have Account? ",
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.signup);
                        },
                        child: Text(
                          "Sign Up",
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
