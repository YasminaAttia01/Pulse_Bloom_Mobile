// lib/models/doctor.dart

// ignore_for_file: file_names

class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final int consultations;
  final String? imageUrl;
  final String? focus;
  final String? bio;
  final String? experience;
  final String? sexe;

  // Constructor
  Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.consultations,
    this.imageUrl,
    this.focus,
    this.bio,
    this.experience,
    this.sexe,
  });

  // Convert Doctor instance to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'consultations': consultations,
      'imageUrl': imageUrl,
      'focus': focus,
      'bio': bio,
      'experience': experience,
      'sexe': sexe,
    };
  }

  // Create Doctor instance from a map (JSON)
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      rating: json['rating'],
      consultations: json['consultations'],
      imageUrl: json['imageUrl'],
      focus: json['focus'],
      bio: json['bio'],
      sexe: json['sexe'],
    );
  }
}
