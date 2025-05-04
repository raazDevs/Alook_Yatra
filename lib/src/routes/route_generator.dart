import 'package:alok_yatra_app/src/features/admin/screens/home_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/pages/student_home_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/parent_dashboard_page.dart';
import 'package:alok_yatra_app/src/features/shared/screens/auth_page/sign_in_page.dart';
import 'package:alok_yatra_app/src/features/shared/screens/error_page/error_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/add_task_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/life_skill_activity_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/task_management_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/teacher_dashboard_page.dart';
import 'package:alok_yatra_app/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case AppRoutes.homeAdmin:
        return MaterialPageRoute(builder: (_) => AdminHomePage());
      case AppRoutes.homeTeacher:
        return MaterialPageRoute(builder: (context) => TeacherDashboard());
      case AppRoutes.addTaskTeacher:
        return MaterialPageRoute(builder: (context) => AddTaskPage());
      case AppRoutes.taskManagementTeacher:
        return MaterialPageRoute(builder: (context) => TaskManagementPage());
      case AppRoutes.feedbackTeacher:
        return MaterialPageRoute(builder: (context) => FeedbackPage());
      case AppRoutes.lifeSkillTeacher:
        return MaterialPageRoute(
            builder: (context) => LifeSkillActivitiesPage());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }
}
