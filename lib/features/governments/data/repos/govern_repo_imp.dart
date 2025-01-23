import 'package:egy_tour/features/governments/data/models/government_model.dart';
import 'package:egy_tour/features/governments/data/repos/govern_repo.dart';
import 'package:egy_tour/core/utils/constants/governments_list.dart';

class GovernRepoImp  implements GovernRepo {
  final _governments = governmentsList;

  List<GovernmentModel> getGovernemts() {
    return _governments;
  }

  List<GovernmentModel> getMoreGovernemts() {
    _governments.addAll(moreGovernmentsList);
    return _governments;
  }
}