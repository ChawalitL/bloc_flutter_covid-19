import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/model_covid.dart';
import 'package:http/http.dart' as http;
part 'apicovidtoday_event.dart';
part 'apicovidtoday_state.dart';

class ApicovidtodayBloc extends Bloc<ApicovidtodayEvent, ApicovidtodayState> {
  ApicovidtodayBloc() : super(ApicovidtodayInitial()) {
    on<GetApiEvent>(_onGetApi);
  }

  void _onGetApi(event, emit) async {
    emit(StateLoading());
    final res = await http.get(
      Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'),
    );
    if (res.statusCode != 200) {
      emit(StateError(message: res.body));
      return;
    }
    final json = jsonDecode(res.body) as List;
    final covidapi = json.map((e) => Covid.fromJson(e)).toList();
    emit(GetApiStateSuccess(covids: covidapi));
  }
}
