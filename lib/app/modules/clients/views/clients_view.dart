import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus.go/app/core/theme/layoutbar.dart';

import '../controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutBar(
        route: '/home',
        body: Center(
          child: Text('Clients'),
        ));
  }
}
