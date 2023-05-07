import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../services/local_notifications_services.dart';

class DateTimePicker extends StatelessWidget {
  DateTimePicker({super.key});

  DateTime scheduleTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: () {
              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                onChanged: (date) => scheduleTime = date,
                onConfirm: (date) {},
              );
            },
            child: const Text(
              'Select Date Time',
              style: TextStyle(color: Colors.lightBlue, fontSize: 17),
            ),
          ),
          ElevatedButton(
              child: const Text('Generation notification',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                debugPrint('Notification Scheduled for $scheduleTime');
                LocalNotificationService().scheduleNotificationCreate(
                  title: 'Date time picker',
                  body: 'Time to drink some water!',
                  scheduledNotificationDateTime: scheduleTime,
                  id: 3,
                  payload: '',
                );
              })
        ])));
  }
}
