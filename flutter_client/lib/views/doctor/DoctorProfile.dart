// ignore_for_file: unused_import, file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/Doctor.dart';
import '../../widgets/BottomAppBar.dart';
import '../doctor/AvailableTimesPage.dart'; // Import the AvailableTimesPage

class DoctorProfilePage extends StatefulWidget {
  final Doctor doctor;

  const DoctorProfilePage({required this.doctor});

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  DateTime? _selectedDate; // Track the selected date

  // Method to select a date using the DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023), // First available date
      lastDate: DateTime(2101), // Last available date
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Doctor Info"),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE8F3FF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: widget.doctor.imageUrl != null
                          ? NetworkImage(widget.doctor.imageUrl!)
                          : AssetImage('assets/images/user.png')
                              as ImageProvider,
                      radius: 50,
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.doctor.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.doctor.specialty,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                SizedBox(width: 4),
                                Text(
                                  "Rating: ${widget.doctor.rating}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.person,
                                    color: AppColors.primaryColor, size: 18),
                                SizedBox(width: 4),
                                Text(
                                  "Consultations: ${widget.doctor.consultations}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Colors.grey, size: 18),
                                SizedBox(width: 4),
                                Text(
                                  "Mon-Sat: 9:00 AM - 5:00 PM",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Select a date and navigate to AvailableTimesPage
                            _selectDate(context).then((_) {
                              if (_selectedDate != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AvailableTimesPage(
                                        selectedDate: _selectedDate!),
                                  ),
                                );
                              }
                            });
                          },
                          icon: Icon(Icons.calendar_today, size: 18),
                          label: Text("Schedule"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Highlight Selected Date
                    if (_selectedDate != null)
                      Text(
                        "Selected Date: ${_selectedDate!.toLocal()}"
                            .split(' ')[0],
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              SizedBox(height: 8),
              Text(
                widget.doctor.bio ?? 'No bio available',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Career Path",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF809CFF)),
              ),
              SizedBox(height: 8),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              CustomBottomNavBar(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class AvailableTimesPage extends StatefulWidget {
  final DateTime selectedDate;

  const AvailableTimesPage({required this.selectedDate});

  @override
  State<AvailableTimesPage> createState() => _AvailableTimesPageState();
}

class _AvailableTimesPageState extends State<AvailableTimesPage> {
  final List<String> availableTimes = [
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
  ];

  String? selectedTimeSlot; // Track selected time slot
  bool isForSelf = true; // Track if the appointment is for 'Yourself'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dr. Olivia Turner, M.D.",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Icon(Icons.favorite_border, color: Colors.grey),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with date navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.grey),
                  Row(
                    children: List.generate(6, (index) {
                      final date =
                          widget.selectedDate.add(Duration(days: index - 2));
                      final isSelected = date.day == widget.selectedDate.day;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Update the selected date
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${date.day}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                [
                                  "MON",
                                  "TUE",
                                  "WED",
                                  "THU",
                                  "FRI",
                                  "SAT",
                                  "SUN"
                                ][date.weekday - 1],
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isSelected ? Colors.white : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
              SizedBox(height: 20),

              // Available times section
              Text(
                "Available Time",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: availableTimes.map((time) {
                  final isSelected = selectedTimeSlot == time;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeSlot = time;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primaryColor : Colors.white,
                        border: Border.all(
                          color:
                              isSelected ? AppColors.primaryColor : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Patient Details Section
              Text(
                "Patient Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ChoiceChip(
                    label: Text("Yourself"),
                    selected: isForSelf,
                    onSelected: (selected) {
                      setState(() {
                        isForSelf = true;
                      });
                    },
                    selectedColor: Color(0xFF809CFF),
                    labelStyle: TextStyle(
                      color: isForSelf ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text("Another Person"),
                    selected: !isForSelf,
                    onSelected: (selected) {
                      setState(() {
                        isForSelf = false;
                      });
                    },
                    selectedColor: Color(0xFF809CFF),
                    labelStyle: TextStyle(
                      color: !isForSelf ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Age",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ChoiceChip(
                    label: Text("Male"),
                    selected: false,
                    onSelected: (_) {},
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text("Female"),
                    selected: true,
                    onSelected: (_) {},
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text("Other"),
                    selected: false,
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Describe the problem
              Text(
                "Describe your problem",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Your Problem Here...",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Confirm button
              ElevatedButton(
                onPressed: selectedTimeSlot != null
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Appointment booked on ${widget.selectedDate.toLocal()} at $selectedTimeSlot!',
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedTimeSlot != null
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Confirm Appointment",
                    style: TextStyle(
                      color:
                          selectedTimeSlot != null ? Colors.white : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
