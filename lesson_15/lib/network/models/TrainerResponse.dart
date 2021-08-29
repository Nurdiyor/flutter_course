class TrainerResponse {
    int id;
    String trainerName;
    double trainerSalary;
    String trainerSurname;

    TrainerResponse({this.id, this.trainerName, this.trainerSalary, this.trainerSurname});

    factory TrainerResponse.fromJson(Map<String, dynamic> json) {
        return TrainerResponse(
            id: json['id'], 
            trainerName: json['trainerName'], 
            trainerSalary: json['trainerSalary'], 
            trainerSurname: json['trainerSurname'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['trainerName'] = this.trainerName;
        data['trainerSalary'] = this.trainerSalary;
        data['trainerSurname'] = this.trainerSurname;
        return data;
    }
    static listFromJson(dynamic json){
        return (json as List).map((i) => TrainerResponse.fromJson(i)).toList();
    }
}