abstract class PetListEvent {}

class PetListLoadEvent extends PetListEvent {
	final String unitToken;
    PetListLoadEvent({this.unitToken});
}
class PetListNextPageEvent extends PetListEvent {}
