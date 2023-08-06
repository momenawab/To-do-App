class task{
  late int id;
  late String title;
  late String description;
  late String date;
  late String time;
  late bool finish;

  task({required this.id,required this.time,required this.description,required this.date,required this.title});

  task.fromMap(Map<String,dynamic> data){
    id = data['id'];
    title = data['title'];
    description = data['des'];
    date = data['date'];
    time = data['Time'];
    finish = data['finish'] == 1? true : false;

  }


}