import 'package:alok_yatra_app/src/features/head/screens/head_dashboard_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/parent_dashboard_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/teacher_dashboard_page.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void signIn(
      BuildContext context, String email, String password, String role) async {
    Widget homePage;
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(
      seconds: 1,
    ));
    switch (role) {
      case "Headmaster":
        homePage = HeadDashboardPage();
        break;
      case "Teacher":
        homePage = TeacherDashboard();
        break;
      case "Student":
        homePage = ParentDashboard();
        break;
      default:
        print("Invalid role: $role");
        return; // Exit if the role is not valid
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => homePage),
    );
    _isLoading = false;
    notifyListeners();
    print({"email": email, "password": password, "role": role});
  }
}
