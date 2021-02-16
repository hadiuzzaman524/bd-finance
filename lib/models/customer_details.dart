import 'dart:io';

class CustomerDetails {
  final String name;
  final String mobile;
  final String address;
  final String profession;
  final String approximate;
  final String birthday;
  final File file;
  final bool makeDeposite;

  CustomerDetails(
      {this.name,
      this.file,
      this.mobile,
      this.address,
      this.approximate,
      this.birthday,
      this.makeDeposite,
      this.profession});
}
