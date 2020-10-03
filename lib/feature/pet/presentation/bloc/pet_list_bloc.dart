import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_event.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_state.dart';

abstract class PetListBloc extends Bloc<PetListEvent, PetListState> {
  PetListBloc(PetListState initialState) : super(initialState);

  void beginRefresh(String unitToken);
  void beginLoadNextPage();
}
