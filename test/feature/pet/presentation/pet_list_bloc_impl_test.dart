import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nanoid/nanoid.dart';
import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/core/functional/try.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_bloc.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_bloc_impl.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_state.dart';

void main() {
  final List<Pet> _pets = <Pet>[
    Pet()..id = nanoid(16)..name = 'Pluto',
    Pet()..id = nanoid(16)..name = 'Mona',
    Pet()..id = nanoid(16)..name = 'Bella',
    Pet()..id = nanoid(16)..name = 'Molly',
    Pet()..id = nanoid(16)..name = 'Ruby',
    Pet()..id = nanoid(16)..name = 'Lucy',
    Pet()..id = nanoid(16)..name = 'Bailey',
    Pet()..id = nanoid(16)..name = 'Daisy',
    Pet()..id = nanoid(16)..name = 'Rosie',
    Pet()..id = nanoid(16)..name = 'Rex',
  ];
  final String _unitToken = 'fake_unit_token';
  ListPets _listPets;

  setUp(() {
    _listPets = ListPetsMock();
    when(_listPets.call(any)).thenAnswer((_) async => Success(_pets));
  });

  group('PetListBloc', () {
    test('throws AssertionError if ListPets is null', () {
      expect(() => PetListBlocImpl(listPets: null),
        throwsA(isAssertionError),
      );
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => PetListBlocImpl(listPets: _listPets),
      expect: [],
    );

    blocTest(
      'emits [PetListLoadedState] when beginRefresh is called',
      build: () => PetListBlocImpl(listPets: _listPets),
      act: (PetListBloc bloc) => bloc.beginRefresh(_unitToken),
      expect: [isA<PetListLoadedState>()],
    );
    
    blocTest(
      'emits [PetListLoadFailedState] when beginRefresh is called but listPets fails',
      build: () {
        when(_listPets.call(any)).thenAnswer((_) async => Rejection(ServerConnectionFailure()));
        return PetListBlocImpl(listPets: _listPets);
      },
      act: (PetListBloc bloc) => bloc.beginRefresh(_unitToken),
      expect: [isA<PetListLoadFailedState>()],
    );

    blocTest(
      'emits [PetListLoadedState, PetListPagingState, PetListLoadedState] when loadNextPage is called after first load',
      build: () => PetListBlocImpl(listPets: _listPets),
      act: (PetListBloc bloc) async {
        bloc.beginRefresh(_unitToken);
        await Future.delayed(Duration(milliseconds: 3000));
        bloc.beginLoadNextPage();
      },
      expect: [isA<PetListLoadedState>(), isA<PetListPagingState>(), isA<PetListLoadedState>()],
    );

    blocTest(
      'emits [PetListLoadedState] when loadNextPage is called but pagination has ended',
      build: () {
        when(_listPets.call(any)).thenAnswer((_) async => Success(<Pet>[]));
        return PetListBlocImpl(listPets: _listPets);
      },
      act: (PetListBloc bloc) async {
        bloc.beginRefresh(_unitToken);
        await Future.delayed(Duration(milliseconds: 3000));
        bloc.beginLoadNextPage();
      },
      expect: [isA<PetListLoadedState>()],
    );
  });
}

class ListPetsMock extends Mock implements ListPets {}