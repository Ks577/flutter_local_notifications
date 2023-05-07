import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notification/bottom_sheet/notification_picker.dart';
import '../services/local_notifications_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final LocalNotificationService service;
  DateTime scheduleTime = DateTime.now();

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drink Water',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/water.png', height: 150),
                    SizedBox(height: 70),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 60,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await service.showNotification(
                                        id: 0,
                                        title: 'Simple notification',
                                        body: 'Time to drink some water!');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  child: const Text(
                                    'Notification now',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                          Container(
                              height: 60,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await service.showScheduledNotification(
                                      id: 1,
                                      title: 'Notification in 4 sec',
                                      body: 'Time to drink some water!',
                                      seconds: 4,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10),
                                  ),
                                  child: const Text(
                                    'Notification in 4 sec',
                                    style: TextStyle(color: Colors.white),
                                  )))
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 60,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await service.showPeriodicLocalNotification(
                                      id: 2,
                                      title: 'Notification periodic every min.',
                                      body: 'Hey, time to drink some water!',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(4),
                                  ),
                                  child: const Text(
                                    'Periodical notification',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                          Container(
                              height: 60,
                              width: 150,
                              child: ElevatedButton(
                                  child: const Text(
                                    'Notification picker',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => _show(context)))
                        ]),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 60,
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await service.scheduleDailyNotification(
                                    id: 4,
                                    title: 'Daily notification',
                                    body:
                                        'Good evening, do you remember to drink water?!',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(4),
                                ),
                                child: const Text(
                                  'Daily notification',
                                  style: TextStyle(color: Colors.white),
                                ))),
                        Container(
                            height: 60,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () async {
                                await service.cancelAllNotifications();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                primary: Colors.pinkAccent,
                              ),
                              child: const Text(
                                'Cancel notification',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ]),
            )),
      ),
    );
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (ctx) => DateTimePicker());
  }
}
