class Gst {
  final String id;
  final int gstin;
  final String name;
  final bool status;
  final String address;
  final bool taxtype;
  final bool biztype;
  final String ward;
  final String range;
  final String dor;
  final String cancel;

  Gst({
    required this.id,
    required this.gstin,
    required this.name,
    required this.status,
    required this.address,
    required this.taxtype,
    required this.biztype,
    required this.ward,
    required this.range,
    required this.dor,
    required this.cancel,
  });

  factory Gst.fromJson(Map<String, dynamic> json) {
    return Gst(
      id: json['id'],
      gstin: json['gstin'],
      name: json['name'],
      status: json['status'],
      address: json['address'],
      taxtype: json['taxtype'],
      biztype: json['biztype'],
      ward: json['ward'],
      range: json['range'],
      dor: json['dor'],
      cancel: json['cancel'],
    );
  }
}
