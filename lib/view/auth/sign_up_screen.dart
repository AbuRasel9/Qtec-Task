import 'package:flutter/material.dart';
import 'package:task/bloc/login_bloc/auth_bloc.dart';
import 'package:task/bloc/login_bloc/auth_events.dart';
import 'package:task/bloc/login_bloc/auth_states.dart';
import 'package:task/configs/components/custom_country_code_picker.dart';
import 'package:task/configs/components/powered_by_widget.dart';
import 'package:task/configs/routes/routes_name.dart';
import 'package:task/model/auth/registration_request.dart';
import 'package:task/utils/enums/enums.dart';
import 'package:task/utils/extensions/context_ext.dart';
import 'package:task/view/auth/widget/sign_in_with_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countryCode = "+880";

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
                    "Sign Up",
                    style: theme.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Let’s save environment together",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Name",
                    style: theme.textTheme.bodyMedium,
                  ),
                  //name text feild
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'e.g: Ahmed Ariyan',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Phone",
                    style: theme.textTheme.bodyMedium,
                  ),

                  //phone text feild
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: CustomMobileCountryCode(
                          onChange: (value) {
                            setState(() {
                              countryCode = value.dialCode ?? "";
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Phone";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: '17XXXXXXXX',
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),
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
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: '**********',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Confirm Password",
                    style: theme.textTheme.bodyMedium,
                  ),
                  //confirm password text feild
                  TextFormField(
                    controller: _cPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter confirm password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: '**********',
                    ),
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
                                  if (_passwordController.text !=
                                      _cPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Password and confirm password not match")));
                                  } else {
                                    context.read<AuthBloc>().add(
                                          RegistrationRequestEvent(
                                            registrationRequest:
                                                RegistrationRequest(
                                              phone:countryCode+_phoneController.text,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              name: _nameController.text,
                                              confirmPassword:
                                                  _cPasswordController.text,
                                            ),
                                          ),
                                        );
                                    try{
                                      context
                                          .read<AuthBloc>()
                                          .add(RegistrationButtonClickEvent());


                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("Registration Successfull")));
                                      _emailController.clear();
                                      _nameController.clear();
                                      _cPasswordController.clear();
                                      _passwordController.clear();
                                      _phoneController.clear();
                                      Navigator.pushNamed(context, RoutesName.login);
                                    }catch(e){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("Registration Failed")));                                    }


                                  }
                                }
                              },
                              child: state.registrationStatus == LoginStatus.loading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("Sign Up"));
                        },
                      )),

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
                  const SizedBox(
                    height: 10,
                  ),
                  //don't have account text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already Have Account?",
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesName.login);
                          },
                          child: Text(
                            "Sign In",
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ))
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
