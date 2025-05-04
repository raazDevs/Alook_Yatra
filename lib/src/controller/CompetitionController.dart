import 'package:alok_yatra_app/src/models/competition_model.dart';

class CompetitionController {
  List<CompetitionModel> allCompetition = [];

  createCompetition(CompetitionModel model) {
    allCompetition.add(model);
  }

  deleteCompetition() {}
  updateCompetition() {}
  getCompetition() {}
}
