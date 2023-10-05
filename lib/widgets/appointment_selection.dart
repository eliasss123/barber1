import 'package:flutter/material.dart';

class AppointmentSelectionScreen extends StatefulWidget {
  @override
  _AppointmentSelectionScreenState createState() => _AppointmentSelectionScreenState();
}

class _AppointmentSelectionScreenState extends State<AppointmentSelectionScreen> {
  String? selectedDay;
  String? selectedTime;

  bool get isDayAndTimeSelected => selectedDay != null && selectedTime != null;

  void confirmAction() {
    // Handle the confirm action here
    print("Confirmed for $selectedDay at $selectedTime");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appointment Selection")),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ... (The rest of the UI remains unchanged)

            // Day Selection
            GestureDetector(
              onTap: () {
                // Handle day selection logic here
                setState(() {
                  selectedDay = "Friday"; // This is just a placeholder
                });
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(selectedDay ?? "Select Day"),
              ),
            ),
            SizedBox(height: 16.0),

            // Time Selection
            GestureDetector(
              onTap: () {
                // Handle time selection logic here
                setState(() {
                  selectedTime = "13:00"; // This is just a placeholder
                });
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(selectedTime ?? "Select Time"),
              ),
            ),
            SizedBox(height: 16.0),

            // Confirm Button
            ElevatedButton(
              onPressed: isDayAndTimeSelected ? confirmAction : null,
              child: Text("Confirm"),
              style: ElevatedButton.styleFrom(
                primary: isDayAndTimeSelected ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
