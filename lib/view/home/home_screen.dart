import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/productBloc/product_bloc.dart';
import 'package:task/bloc/productBloc/product_event.dart';
import 'package:task/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "----------${jsonEncode(context.read<ProductBloc>().state.productList)}");
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(),
      ),
    );
  }
}
