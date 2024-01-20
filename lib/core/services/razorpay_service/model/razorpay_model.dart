class RazorPayModel {
  final String name, description;
  final dynamic key, amount;

  final Prefill? prefill;

  RazorPayModel({
    required this.key,
    required this.name,
    required this.description,
    required this.amount,
    required this.prefill,
  });

  Map<String, dynamic> toJson() => {
        'key': key,
        'amount': amount.toString(), //in the smallest currency sub-unit.
        'name': '$name',
        'description': '$description',
        'prefill': prefill?.toJson() ?? {}
      };
}

class Prefill {
  String? email, contact;
  Prefill({this.email, this.contact});

  Map<String, dynamic> toJson() => {'contact': contact, 'email': email};
}
