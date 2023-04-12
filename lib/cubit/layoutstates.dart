abstract class NewsStates{}
class InitialState extends NewsStates{}
class AddToFavSuccessState extends NewsStates{}
class AddToFavFailureState extends NewsStates{}
class DeleteFromFavSuccessState extends NewsStates{}

class GetNewsSuccessState extends NewsStates{}
class GetNewsLoadingState extends NewsStates{}
class GetNewsFailureState extends NewsStates{}