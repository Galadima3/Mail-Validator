import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));

String emailToJson(Email data) => json.encode(data.toJson());

class Email {
    Email({
        required this.email,
        this.autocorrect,
        required this.deliverability,
        required this.qualityScore,
        required this.isValidFormat,
        required this.isFreeEmail,
        required this.isDisposableEmail,
        required this.isRoleEmail,
        required this.isCatchallEmail,
        this.isMxFound,
        this.isSmtpValid,
        this.value,
    });

    final String email;
    final String? autocorrect;
    final String deliverability;
    final double qualityScore;
    final Is isValidFormat;
    final Is isFreeEmail;
    final Is isDisposableEmail;
    final Is isRoleEmail;
    final Is? isCatchallEmail;
    final Is? isMxFound;
    final Is? isSmtpValid;
    final int? value;

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        email: json["email"],
        autocorrect: json["autocorrect"],
        deliverability: json["deliverability"],
        qualityScore: json["quality_score"].toDouble(),
        isValidFormat: Is.fromJson(json["is_valid_format"]),
        isFreeEmail: Is.fromJson(json["is_free_email"]),
        isDisposableEmail: Is.fromJson(json["is_disposable_email"]),
        isRoleEmail: Is.fromJson(json["is_role_email"]),
        isCatchallEmail: Is.fromJson(json["is_catchall_email"]),
        isMxFound: Is.fromJson(json["is_mx_found"]),
        isSmtpValid: Is.fromJson(json["is_smtp_valid"]),
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "autocorrect": autocorrect,
        "deliverability": deliverability,
        "quality_score": qualityScore,
        "is_valid_format": isValidFormat.toJson(),
        "is_free_email": isFreeEmail.toJson(),
        "is_disposable_email": isDisposableEmail.toJson(),
        "is_role_email": isRoleEmail.toJson(),
        "is_catchall_email": isCatchallEmail?.toJson(),
        "is_mx_found": isMxFound?.toJson(),
        "is_smtp_valid": isSmtpValid?.toJson(),
        "value": value,
    };
}

class Is {
    Is({
        required this.value,
        required this.text,
    });

    final bool value;
    final String text;

    factory Is.fromJson(Map<String, dynamic> json) => Is(
        value: json["value"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
    };
}
