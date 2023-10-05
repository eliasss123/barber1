import 'package:barber_app1/controller/your_barber_controller.dart';
import 'package:barber_app1/models/your_barber_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/custom_elevated_button.dart';
import 'package:barber_app1/widgets/time_selection_inside.dart';
import 'package:barber_app1/widgets/Day_selection_inside.dart';


class HaircutSelection extends StatelessWidget {
  final YourBarberController controller;

  HaircutSelection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => DaySelectionWidget(controller: controller),
  ));
},

          child: Text("Select Day"),
        ),
        ElevatedButton(
          onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => TimeSelectionWidget(controller: controller),
  ));
},

          child: Text("Select Time"),
        ),
        ElevatedButton(
          onPressed: controller.yourBarberModelObj.value.selectedDay != null &&
                  controller.yourBarberModelObj.value.selectedTime != null
              ? () {
                  // Handle the confirm action
                }
              : null, // This makes the button disabled if day or time is not selected
          child: Text("Confirm"),
        ),
      ],
    );
  }
}
