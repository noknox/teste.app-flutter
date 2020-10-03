import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';

abstract class PetListState {
	final List<Pet> data;
	final String unitToken;

    PetListState(this.data, this.unitToken);
}

class PetListLoadingState extends PetListState {
  PetListLoadingState(List<Pet> data, String unitToken) : super(data, unitToken);
}

class PetListLoadFailedState extends PetListState {
	final Failure error;
	PetListLoadFailedState(List<Pet> data, String unitToken, this.error) : super(data, unitToken);
}

class PetListPagingState extends PetListState {
	PetListPagingState(List<Pet> data, String unitToken) : super(data, unitToken);
}

class PetListPageFailedState extends PetListState {
	final Failure error;
	PetListPageFailedState(List<Pet> data, String unitToken, this.error) : super(data, unitToken);
}

class PetListLoadedState extends PetListState {
	final bool donePaging;
	PetListLoadedState(List<Pet> data, String unitToken, this.donePaging) : super(data, unitToken);
}
