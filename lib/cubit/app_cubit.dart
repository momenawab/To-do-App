import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_4/data/database.dart';
import 'package:session_4/data/node.dart';



part 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);//this line to make a job for get in anywhere in
                                                           // the app with blocprovider and with app cubit and make access in the app
  List<task> Todo =[];

  Future<void> getData()async{//this line to get data from database when i want  it and update it in the future
    emit(GetDataLoading());// to make cubit change something in the app
    Todo = [];

     MyDatabase.getAllDate().then((value){

      value.forEach((element) {// loop to add data in the app
        task Task = task.fromMap(element);
        Todo.add(Task);

      });
      emit(GetDataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetDataError());
    });



  }

  void changeFinish({required bool value,required int index}){// to change database after save it
    Todo[index].finish = ! Todo[index].finish!;
    MyDatabase.updateDatabase(
      title: Todo[index].title!,
      des:   Todo[index].description!,
      date:  Todo[index].date!,
      time:  Todo[index].time!,
      id:    Todo[index].id!,
      finish: Todo[index].finish!? 1 : 0,
    );
    emit(ChangeFinish());

  }


  void insertNewNote({required title,required des,required date, required time})async{// this line to add data to task list

   await MyDatabase.insertToDatabase(
        title: title,
        des: des,
        date: date,
        time: time,
        finish: 0,
    ).then((value){
      getData();
    });


  }


}
