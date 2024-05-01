class UserModel {
  final int id;
  final int tenantId;
  final String accountFor;
  final int? customerId;
  final int employeeId;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String emailId;
  final String whatsAppContactNo;
  final String contactNo;
  final int roleId;
  final List<int> departmentId;
  final int designationId;
  final String? gender;
  final String address;
  final int? cityId;
  final int? stateId;
  final int? countryId;
  final int? pincode;
  final String profilePicture;
  final String userName;
  final String password;
  final int otp;
  final String? hashKey;
  final String? jwtToken;
  final String? lastLogin;
  final String? viewFormat;
  final String? remark;
  final int isActive;
  final String createdAt;
  final int createdBy;
  final String updatedAt;
  final int updatedBy;
  final int isSuperadmin;
  final String preferredCommunication;
  final int actualTenantId;
  final bool? isTenantLogin;
  final String? passwordChangedAt;
  final String? deviceId;
  final String departmentName;
  final String roleName;
  final String designation;

  UserModel({
    required this.id,
    required this.tenantId,
    required this.accountFor,
    this.customerId,
    required this.employeeId,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.emailId,
    required this.whatsAppContactNo,
    required this.contactNo,
    required this.roleId,
    required this.departmentId,
    required this.designationId,
    this.gender,
    required this.address,
    this.cityId,
    this.stateId,
    this.countryId,
    this.pincode,
    required this.profilePicture,
    required this.userName,
    required this.password,
    required this.otp,
    this.hashKey,
    this.jwtToken,
    this.lastLogin,
    this.viewFormat,
    this.remark,
    required this.isActive,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.isSuperadmin,
    required this.preferredCommunication,
    required this.actualTenantId,
    this.isTenantLogin,
    this.passwordChangedAt,
    this.deviceId,
    required this.departmentName,
    required this.roleName,
    required this.designation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      tenantId: json['tenant_id'],
      accountFor: json['account_for'],
      customerId: json['customer_id'],
      employeeId: json['employee_id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      emailId: json['email_id'],
      whatsAppContactNo: json['whats_app_contact_no'],
      contactNo: json['contact_no'],
      roleId: json['role_id'],
      departmentId: List<int>.from(json['department_id']),
      designationId: json['designation_id'],
      gender: json['gender'],
      address: json['address'],
      cityId: json['city_id'],
      stateId: json['state_id'],
      countryId: json['country_id'],
      pincode: json['pincode'],
      profilePicture: json['profile_picture'],
      userName: json['user_name'],
      password: json['password'],
      otp: json['otp'],
      hashKey: json['hash_key'],
      jwtToken: json['jwt_token'],
      lastLogin: json['last_login'],
      viewFormat: json['view_format'],
      remark: json['remark'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      isSuperadmin: json['is_superadmin'],
      preferredCommunication: json['preferred_communication'],
      actualTenantId: json['actual_tenant_id'],
      isTenantLogin: json['is_tenant_login'],
      passwordChangedAt: json['password_changed_at'],
      deviceId: json['device_id'],
      departmentName: json['department_name'],
      roleName: json['role_name'],
      designation: json['designation'],
    );
  }
}