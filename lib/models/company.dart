class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Calories'),
      Company(2, 'Carb'),
      Company(3, 'Protein'),
    ];
  }
}
