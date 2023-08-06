part of 'app_cubit.dart';//make the cubit to get data state if it failed or succeeded

abstract class AppState {}

class AppInitial extends AppState {}

class GetDataLoading extends AppState{}

class GetDataSuccess extends AppState{}

class GetDataError extends AppState{}

class ChangeFinish extends AppState{}
