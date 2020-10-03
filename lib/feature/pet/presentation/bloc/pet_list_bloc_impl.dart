import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_bloc.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_event.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_state.dart';

class PetListBlocImpl extends PetListBloc {
  final ListPets listPets;
  var loadedCache = false;

  PetListBlocImpl({@required this.listPets})
      : assert(listPets != null),
        super(PetListLoadingState([], null));

  @override
  Stream<PetListState> mapEventToState(PetListEvent event) async* {
    if (event is PetListLoadEvent) yield* _mapLoad(event);
    if (event is PetListNextPageEvent) yield* _mapNextPage(event);
  }

  Stream<PetListState> _mapLoad(PetListLoadEvent event) async* {
    final unitToken = event.unitToken;
    var data = state.data;

    final result = await listPets
        .call(ListPetsParam(unitToken: unitToken, lastPetId: null));
    yield result.fold((err) => PetListLoadFailedState(data, unitToken, err),
        (data) {
          data.sort((a, b) => a.name.compareTo(b.name));
          return PetListLoadedState(data, unitToken, data.length == 0);
        });
  }

  Stream<PetListState> _mapNextPage(PetListNextPageEvent event) async* {
    final unitToken = state.unitToken;
    final data = state.data;
    final lastPetId = data.length > 0 ? data.last.id : '';
    yield PetListPagingState(data, unitToken);

    final result = await listPets
        .call(ListPetsParam(unitToken: unitToken, lastPetId: lastPetId));
    yield result.fold((err) => PetListPageFailedState(data, unitToken, err),
        (res) {
          final retVal = (data + res).toList();
          retVal.sort((a, b) => a.name.compareTo(b.name));
          return PetListLoadedState(retVal, unitToken, res.length == 0);
        });
  }

  @override
  void beginRefresh(String unitToken) {
    if (state.unitToken?.isEmpty != true || !(state is PetListLoadingState) && !(state is PetListPagingState)) {
      add(PetListLoadEvent(unitToken: unitToken ?? state.unitToken));
    }
  }

  @override
  void beginLoadNextPage() {
    final current = state;
    if (!(current is PetListLoadingState) && !(current is PetListPagingState)) {
      if (current is PetListLoadedState && current.donePaging) return;
      add(PetListNextPageEvent());
    }
  }
}
