// class Semesters {
//   final List<String> sem1;
//   final List<String> sem2;
//
//   Semesters({
//     required this.sem1,
//     required this.sem2,
//   });
//
//   factory Semesters.fromJson(Map<String, dynamic> json) {
//     return Semesters(
//       sem1: List<String>.from(json['sem_1'] ?? []),
//       sem2: List<String>.from(json['sem_2'] ?? []),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'sem_1': sem1,
//       'sem_2': sem2,
//     };
//   }
// }
class SubjectModel {
  final Map<String, String> units;

  SubjectModel({required this.units});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    final units = <String, String>{};
    json.forEach((unitKey, unitValue) {
      units[unitKey] = unitValue.toString();
    });
    return SubjectModel(units: units);
  }

  Map<String, dynamic> toJson() => units;
}

class SemesterModel {
  final Map<String, SubjectModel> subjects;

  SemesterModel({required this.subjects});

  factory SemesterModel.fromJson(Map<String, dynamic> json) {
    final subjects = <String, SubjectModel>{};
    json.forEach((subKey, subVal) {
      subjects[subKey] = SubjectModel.fromJson(subVal);
    });
    return SemesterModel(subjects: subjects);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    subjects.forEach((subKey, subVal) {
      data[subKey] = subVal.toJson();
    });
    return data;
  }
}

class SemestersModel {
  final Map<String, SemesterModel> semesters;

  SemestersModel({required this.semesters});

  factory SemestersModel.fromJson(Map<String, dynamic> json) {
    final semesters = <String, SemesterModel>{};
    json.forEach((semKey, semVal) {
      semesters[semKey] = SemesterModel.fromJson(semVal);
    });
    return SemestersModel(semesters: semesters);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    semesters.forEach((semKey, semVal) {
      data[semKey] = semVal.toJson();
    });
    return data;
  }
}
