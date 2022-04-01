class Covid {
  DateTime datetime;
  int newcase;
  int totalcase;
  int newexcludeabroad;
  int totalexcludeabroad;
  int newdeath;
  int totaldeath;
  int newrecovered;
  int totalrecovered;

  Covid({
    required this.datetime,
    required this.newcase,
    required this.totalcase,
    required this.newexcludeabroad,
    required this.totalexcludeabroad,
    required this.newdeath,
    required this.totaldeath,
    required this.newrecovered,
    required this.totalrecovered,
  });

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      datetime: DateTime.parse(json['txn_date']),
      newcase: json['new_case'],
      totalcase: json['total_case'],
      newexcludeabroad: json['new_case_excludeabroad'],
      totalexcludeabroad: json['total_case_excludeabroad'],
      newdeath: json['new_death'],
      totaldeath: json['total_death'],
      newrecovered: json['new_recovered'],
      totalrecovered: json['total_recovered'],
    );
  }

  

}
