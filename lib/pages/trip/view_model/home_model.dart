import 'package:flutter_qyyim/common/service/trabel_service.dart';

class HomeViewModel{
  static fetch() async {
    return TravelResponsitory.fetchHome();
  }

}