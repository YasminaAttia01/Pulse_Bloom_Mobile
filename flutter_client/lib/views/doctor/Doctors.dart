// ignore_for_file: file_names, use_super_parameters, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../models/Doctor.dart';
import 'DoctorProfile.dart'; // Replace with your profile page import

class DoctorsWidget extends StatefulWidget {
  final List<Doctor> doctors;

  const DoctorsWidget({Key? key, required this.doctors}) : super(key: key);

  @override
  _DoctorsWidgetState createState() => _DoctorsWidgetState();
}

class _DoctorsWidgetState extends State<DoctorsWidget> {
  String sortOrder = "A-Z";
  bool showFavorites =
      false; // Add a favorite field in your data for this to work
  bool showMaleOnly = false;
  bool showFemaleOnly = false;
  double minRating = 0.0;

  late List<Doctor> filteredDoctors;

  @override
  void initState() {
    super.initState();
    filteredDoctors = widget.doctors;
  }

  void filterDoctors() {
    setState(() {
      filteredDoctors = widget.doctors.where((doctor) {
        if (showMaleOnly && doctor.sexe != "Male") return false;
        if (showFemaleOnly && doctor.sexe != "Female") return false;
        if (doctor.rating < minRating) return false;
        return true;
      }).toList();

      if (sortOrder == "A-Z") {
        filteredDoctors.sort((a, b) => a.name.compareTo(b.name));
      } else if (sortOrder == "Z-A") {
        filteredDoctors.sort((a, b) => b.name.compareTo(a.name));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filters Section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                value: sortOrder,
                items: ["A-Z", "Z-A"]
                    .map((order) => DropdownMenuItem(
                          value: order,
                          child: Text(order),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    sortOrder = value!;
                    filterDoctors();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.male),
                color: showMaleOnly ? Colors.blue : Colors.grey,
                onPressed: () {
                  setState(() {
                    showMaleOnly = !showMaleOnly;
                    showFemaleOnly = false;
                    filterDoctors();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.female),
                color: showFemaleOnly ? Colors.pink : Colors.grey,
                onPressed: () {
                  setState(() {
                    showFemaleOnly = !showFemaleOnly;
                    showMaleOnly = false;
                    filterDoctors();
                  });
                },
              ),
              Slider(
                value: minRating,
                min: 0,
                max: 5,
                divisions: 5,
                label: "$minRating+ Stars",
                onChanged: (value) {
                  setState(() {
                    minRating = value;
                    filterDoctors();
                  });
                },
              ),
            ],
          ),
        ),
        // List of Doctors
        Expanded(
          child: ListView.builder(
            itemCount: filteredDoctors.length,
            itemBuilder: (context, index) {
              final doctor = filteredDoctors[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      doctor.imageUrl ??
                          "https://via.placeholder.com/150", // Fallback image
                    ),
                  ),
                  title: Text(doctor.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor.specialty),
                      Text(
                          "${doctor.rating} ⭐ (${doctor.consultations} consultations)"),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorProfilePage(doctor: doctor),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
