import 'dart:convert';

class FortRequest {
  FortRequest({
    required this.amount,
    required this.customerEmail,
    required this.sdkToken,
    this.currency = 'USD',
    this.language = 'en',
    this.merchantReference,
    this.merchantExtra,
    this.merchantExtra1,
    this.tokenName,
    this.paymentOption,
    this.eci,
    this.phoneNumber,
  }) : command = 'PURCHASE';

  /// Request Command.
  ///
  final String command;

  /// The transaction’s amount.
  /// Each currency has predefined allowed decimal points that should be taken into consideration when sending the amount.
  ///
  final num amount;

  /// The currency of the transaction’s amount in ISO code 3. Example: AED, USD, EUR, GBP.
  /// By Default currency : [USD].
  ///
  final String currency;

  /// The Merchant’s unique order number.
  ///
  final String? merchantReference;

  final String? merchantExtra;

  final String? merchantExtra1;

  /// The customer’s email. Example: customer1@domain.com
  ///
  final String customerEmail;

  /// The checkout page and messages language.
  /// By default language: [en].
  ///
  final String language;

  /// An SDK Token to enable using the Amazon Payment Services Mobile SDK.
  ///
  final String sdkToken;

  /// The Token received from the Tokenization process..
  ///
  final String? tokenName;

  /// Payment option. [MASTERCARD], [VISA], [AMEX] etc...
  ///
  final String? paymentOption;

  /// The E-commerce indicator. example: [ECOMMERCE]
  ///
  final String? eci;

  /// The customer’s phone number.
  ///
  final String? phoneNumber;

  Map<String, dynamic> toFortRequest() {
    return <String, dynamic>{
      'command': command,
      'amount': amount.toString(),
      'merchant_reference': '${DateTime.now().millisecondsSinceEpoch}',
      'merchant_extra': merchantExtra,
      'merchant_extra1': merchantExtra1,
      'currency': currency,
      'customer_email': customerEmail,
      'language': language,
      'sdk_token': sdkToken,
      'token_name': tokenName,
      'payment_option': paymentOption,
      'eci': eci,
      'phone_number': phoneNumber,
    };
  }

  FortRequest copyWith({
    num? amount,
    String? currency,
    String? merchantReference,
    String? merchantExtra,
    String? merchantExtra1,
    String? customerEmail,
    String? language,
    String? sdkToken,
    String? tokenName,
    String? paymentOption,
    String? eci,
    String? phoneNumber,
  }) {
    return FortRequest(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      merchantReference: merchantReference ?? this.merchantReference,
      merchantExtra: merchantExtra ?? this.merchantExtra,
      merchantExtra1: merchantExtra1 ?? this.merchantExtra1,
      customerEmail: customerEmail ?? this.customerEmail,
      language: language ?? this.language,
      sdkToken: sdkToken ?? this.sdkToken,
      tokenName: tokenName ?? this.tokenName,
      paymentOption: paymentOption ?? this.paymentOption,
      eci: eci ?? this.eci,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return jsonEncode(toFortRequest());
  }
}
