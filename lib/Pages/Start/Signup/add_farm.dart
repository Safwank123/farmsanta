import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../base_screen.dart';

class AddFarmLocation extends BaseScreen {
    static const routeName = "/add-farm";
  const AddFarmLocation({super.key});

  @override
  BaseScreenState<AddFarmLocation> createState() => _AddFarmLocationState();
}

class _AddFarmLocationState extends BaseScreenState<AddFarmLocation> {
  @override
  Widget buildWidget(BuildContext context) {
    return const Placeholder();
  }
}