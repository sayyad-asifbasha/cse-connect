class SubjectModel {
  final Map<String, String> units;

  SubjectModel({required this.units});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    final unsortedUnits = <String, String>{};
    json.forEach((unitKey, unitValue) {
      unsortedUnits[unitKey] = unitValue.toString();
    });

    final sortedEntries = unsortedUnits.entries.toList()
      ..sort((a, b) {
        int getUnitNumber(String key) {
          final match = RegExp(r'Unit (\d+)').firstMatch(key);
          return match != null ? int.parse(match.group(1)!) : 0;
        }

        return getUnitNumber(a.key).compareTo(getUnitNumber(b.key));
      });

    final sortedUnits = Map<String, String>.fromEntries(sortedEntries);
    return SubjectModel(units: sortedUnits);
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
