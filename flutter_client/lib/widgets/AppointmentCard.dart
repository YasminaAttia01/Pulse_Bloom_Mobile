// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final List<Day> days = [
    Day('9', 'MON'),
    Day('10', 'TUE'),
    Day('11', 'WED', isActive: true),
    Day('12', 'THU'),
    Day('13', 'FRI', isActive: true),
    Day('14', 'SAT', isActive: true),
  ];

  final Appointment appointment = Appointment(
    time: '10 AM',
    doctorName: 'Dr. Olivia Turner, M.D.',
    details: 'Treatment and prevention of skin and photodermatitis.',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFF0B82D4).withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Days Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: days.map((day) => DayWidget(day: day)).toList(),
            ),
            SizedBox(height: 10),
            // Date Title
            Text(
              '11 Wednesday - Today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            // Appointments
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeSlot(time: '9 AM'),
                AppointmentWidget(appointment: appointment),
                TimeSlot(time: '11 AM'),
                TimeSlot(time: '12 PM'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Day {
  final String date;
  final String dayName;
  final bool isActive;

  Day(this.date, this.dayName, {this.isActive = false});
}

class DayWidget extends StatelessWidget {
  final Day day;

  const DayWidget({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: day.isActive ? Color(0xFF0B82D4) : Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 40,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.date,
            style: TextStyle(
              fontSize: 16,
              fontWeight: day.isActive ? FontWeight.bold : FontWeight.normal,
              color: day.isActive ? Colors.white : Colors.black,
            ),
          ),
          Text(
            day.dayName,
            style: TextStyle(
              fontSize: 12,
              color: day.isActive ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class Appointment {
  final String time;
  final String doctorName;
  final String details;

  Appointment(
      {required this.time, required this.doctorName, required this.details});
}

class AppointmentWidget extends StatelessWidget {
  final Appointment appointment;

  const AppointmentWidget({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appointment.time,
                  style: TextStyle(color: Color(0xFF0B82D4))),
              Icon(Icons.check_circle, color: Color(0xFF0B82D4)), // Check icon
            ],
          ),
          SizedBox(height: 15),
          Text(appointment.doctorName,
              style: TextStyle(
                  color: Color(0xFF0B82D4), fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Text(appointment.details, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

class TimeSlot extends StatelessWidget {
  final String time;

  const TimeSlot({required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(time, style: TextStyle(color: Color(0xFF0B82D4))),
    );
  }
}
