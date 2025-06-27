import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../Widgets/classes/card_helper.dart';
import '../../../../Widgets/classes/widget_helper_class.dart';
import '../../../base_screen.dart';

class Harvest extends BaseScreen {
  final PopSectionModel model;
  const Harvest({super.key, required this.model});

  @override
  BaseScreenState<Harvest> createState() => _HarvestState();
}

class _HarvestState extends BaseScreenState<Harvest> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // image component
            imageWithExpandIcon(imageUrl: widget.model.profileImage),

            // spacing after image
            26.heightBox,

            // data
            ...WidgetHelper.headingDescriptionWidgetList(title: AppStrings.harvestingMethods, data: widget.model.harvestingDescription),
            ...WidgetHelper.headingDescriptionWidgetList(title: AppStrings.postHarvestingTechnologies, data: widget.model.postHarvestingDescription),
          ],
        ).box.make().p16(),
      ).wFull(context).hFull(context),
    );
  }

 
}
