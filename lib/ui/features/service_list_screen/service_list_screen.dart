import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}