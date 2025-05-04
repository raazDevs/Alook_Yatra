import 'package:alok_yatra_app/src/models/competition_model.dart';

final List<CompetitionModel> competitions = [
  CompetitionModel(
    id: 1,
    typeId: 2,
    schoolId: 5001,
    district: "Central District",
    subDistrict: "North Zone",
    name: "Annual Science Fair",
    description: "A school-wide science fair showcasing student projects.",
    startDate: DateTime.parse("2025-03-10T09:00:00Z"),
    endDate: DateTime.parse("2025-03-12T17:00:00Z"),
    registrationDeadline: DateTime.parse("2025-03-05T23:59:59Z"),
    minParticipants: 10,
    maxParticipants: 100,
    status: "published",
    createdBy: 3001,
    createdAt: DateTime.parse("2025-02-25T14:30:00Z"),
  ),
  CompetitionModel(
    id: 2,
    typeId: 3,
    schoolId: 5002,
    district: "West District",
    subDistrict: "South Zone",
    name: "Math Olympiad",
    description: "A challenging competition for math enthusiasts.",
    startDate: DateTime.parse("2025-04-15T10:00:00Z"),
    endDate: DateTime.parse("2025-04-16T16:00:00Z"),
    registrationDeadline: DateTime.parse("2025-04-10T23:59:59Z"),
    minParticipants: 5,
    maxParticipants: 50,
    status: "ongoing",
    createdBy: 3002,
    createdAt: DateTime.parse("2025-03-01T12:00:00Z"),
  ),
  // Add more competitions as needed
];
