import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/add/competition/competition_details_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/add/competition/competition_location_details.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/add/competition/other_details_page.dart';
import 'package:alok_yatra_app/src/services/add/add_competition_service.dart';
import 'package:alok_yatra_app/src/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AddCompetitionPage extends StatefulWidget {
  @override
  _AddCompetitionPageState createState() => _AddCompetitionPageState();
}

class _AddCompetitionPageState extends State<AddCompetitionPage> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  CompetitionService competition = CompetitionService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _minParticipantsController =
      TextEditingController();
  final TextEditingController _maxParticipantsController =
      TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _registrationDeadline;
  String _selectedStatus = "draft";

  final List<String> _statusOptions = [
    "draft",
    "published",
    "ongoing",
    "completed",
    "cancelled"
  ];

  int _currentPage = 0;

  final List<String> _steps = ["Details", "Location", "Other Info"];
  void _resetState() {
    setState(() {
      _startDate = null;
      _endDate = null;
      _registrationDeadline = null;
      _selectedStatus = "draft";
      _currentPage = 0;
      _pageController.jumpToPage(0);
    });
  }

  void _nextPage() {
    if (_currentPage == 0 && !_formKey1.currentState!.validate()) {
      return; // Stop if the first form is invalid
    } else if (_currentPage == 1 && !_formKey2.currentState!.validate()) {
      return; // Stop if the second form is invalid
    } else if (_currentPage == 2 && !_formKey3.currentState!.validate()) {
      return; // Stop if the third form is invalid
    }

    if (_currentPage < 2) {
      setState(() => _currentPage++);
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      competition.submitCompetition(
        context: context,
        formKey1: _formKey1,
        formKey2: _formKey2,
        formKey3: _formKey3,
        nameController: _nameController,
        descriptionController: _descriptionController,
        districtController: _districtController,
        subDistrictController: _subDistrictController,
        minParticipantsController: _minParticipantsController,
        maxParticipantsController: _maxParticipantsController,
        startDate: _startDate,
        endDate: _endDate,
        status: _selectedStatus,
        registrationDeadline: _registrationDeadline,
        resetState: _resetState,
      );
    }
  }

  Future _pickDate(BuildContext context, Function(DateTime) onSelected) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      onSelected(pickedDate);
      setState(() {});
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Competition",
          style: appbarTextStyle,
        ),
        backgroundColor: lightTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _buildTimeline(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  competitionDetailsPage(
                      formkey: _formKey1,
                      nameController: _nameController,
                      descriptionController: _descriptionController),
                  locationDetailsPage(
                      formkey: _formKey2,
                      districtController: _districtController,
                      subDistrictController: _subDistrictController),
                  OtherDetailsPage(
                    endDate: _endDate,
                    maxParticipantsController: _maxParticipantsController,
                    minParticipantsController: _minParticipantsController,
                    registrationDeadline: _registrationDeadline,
                    selectedStatus: _selectedStatus,
                    startDate: _startDate,
                    statusOptions: _statusOptions,
                    formKey: _formKey3,
                    onStartDateSelected: (date) {
                      setState(() {
                        _startDate = date;
                      });
                    },
                    onEndDateSelected: (date) {
                      setState(() {
                        _endDate = date;
                      });
                    },
                    onRegDeadlineSelected: (date) {
                      setState(() {
                        _registrationDeadline = date;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          _navigationButtons(),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_steps.length, (index) {
          return Column(
            children: [
              CircleAvatar(
                minRadius: 15,
                backgroundColor:
                    _currentPage >= index ? Colors.blue : Colors.grey,
                child: Text(
                  "${index + 1}",
                  style: GoogleFonts.aBeeZee(color: Colors.white),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                _steps[index],
                style: smallStyle,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _navigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPage > 0)
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                      onPressed: _prevPage,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          foregroundColor: Colors.black),
                      child: Text(
                        "Previous",
                        style: normalStyle,
                      )),
                )),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: lightTheme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      foregroundColor: Colors.white),
                  child: Text(
                    _currentPage == _steps.length - 1 ? "Submit" : "Next",
                    style: normalStyle,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
