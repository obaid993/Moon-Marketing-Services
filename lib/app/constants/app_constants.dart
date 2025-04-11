// enum Add {
//   heading,
//   name,
//   nameHint,
//   address,
//   addressHint,
//   mobile,
//   mobileHint,
//   email,
//   emailHint,
//   license,
//   qualification,
//   cvFile,
//   certificateFile,
//   docFile,
//   licFile,
//   image,
//   male,
//   female,
//   gender,
//   id,
//   fName,
//   lName,
//   address_1,
//   address_2,
//   rateType,
//   hRate,
//   bloodGroup,
//   country,
//   city,
//   zip,
//   designation,
//   createdBy,
//   password,
//   confirmPassword,
//   username,
//   usernameHint,
//   passwordHint,
//   heading1,
//   whatsappNo,
//   whatsappNoHint
// }

// enum Status { all, pending, readyToGo, onTheWay, reached, completed, na }

// enum AddClient { heading, clientName, clientNameHint }

// enum Jobs {
//   company,
//   cSTime,
//   cETime,
//   client,
//   site,
//   shift,
//   wHours,
//   cTWHours,
//   eTWHours,
//   ewHours,
//   sTime,
//   eTime,
//   eSTime,
//   eETime,
//   date,
//   done,
//   day,
//   night,
//   selectDate,
//   cRate,
//   eRate,
//   eIncome,
//   cIncome,
//   paid,
//   profit,
//   note,
//   addNote,
//   heading,
//   paymentStatus,
//   completionStatus
// }

// class AppConstants {
//   static String TEST_USER_EMAIL = '';

//   static String TEST_USER_PASSWORD = '';
//   // static String baseUrl = "https://alhafizcloth.com/realstate/";

//   static const ADD_SECURITY_GUARD = <Add, dynamic>{
//     // Add.heading : 'Add Security Officer',
//     // Add.name: 'Name',
//     // Add.mobile: 'Mobile',
//     // Add.email: 'Email',
//     // Add.username: 'Username',
//     // Add.password: 'Password',
//     // Add.address: 'Address',
//     // Add.license: 'License',
//     // Add.qualification: 'Qualification',
//     // Add.cvFile: 'CV File',
//     // Add.docFile: 'Document File',
//     // Add.licFile: 'License File',
//     // Add.certificateFile: 'Certificate File',
//     // Add.image: 'Image',
//     // Add.gender: 'Gender',
//     // Add.male: ['male','1'],
//     // Add.female: ['female','0'],
//   };
//   static const updateSecurityGuard = <Add, dynamic>{
//     // Add.heading : 'Update Security Officer',
//     // Add.name: 'Name',
//     // Add.mobile: 'Mobile',
//     // Add.email: 'Email',
//     // Add.address: 'Address',
//     // Add.license: 'License',
//     // Add.qualification: 'Qualification',
//     // Add.cvFile: 'CV File',
//     // Add.docFile: 'Document File',
//     // Add.licFile: 'License File',
//     // Add.certificateFile: 'Certificate File',
//     // Add.image: 'Image',
//     // Add.gender: 'Gender',
//     // Add.male: ['male','1'],
//     // Add.female: ['female','0'],
//     // Add.password: 'Password'
//   };

//   static const ADD_EMPLOYEE = <Add, dynamic>{
//     // Add.heading : 'Add Employee',
//     // Add.id : 'id',
//     // Add.fName: 'First Name',
//     // Add.lName: 'Last Name',
//     // Add.mobile: 'Phone',
//     // Add.email: 'Email',
//     // Add.address_1: 'Address',
//     // Add.address_2: 'Address 2',
//     // Add.cvFile: 'CV File',
//     // Add.docFile: 'Document File',
//     // Add.licFile: 'License File',
//     // Add.certificateFile: 'Certificate File',
//     // Add.image: 'Image',
//     // Add.rate_type: 'Rate Type',
//     // Add.hRate: 'Hour Rate',
//     // Add.blood_group: 'Blood Group',
//     // Add.country: 'Country',
//     // Add.city: 'City',
//     // Add.zip: 'ZIP Code',
//     // Add.designation:'Designation',
//     // Add.createdBy: 'Created By'
//   };

//   static const UPDATE_EMPLOYEE = <Add, dynamic>{
//     // Add.heading : 'Update Employee',
//     // Add.id : 'id',
//     // Add.fName: 'First Name',
//     // Add.lName: 'Last Name',
//     // Add.mobile: 'Phone',
//     // Add.email: 'Email',
//     // Add.address_1: 'Address',
//     // Add.address_2: 'Address 2',
//     // Add.cvFile: 'CV File',
//     // Add.docFile: 'Document File',
//     // Add.licFile: 'License File',
//     // Add.certificateFile: 'Certificate File',
//     // Add.image: 'Image',
//     // Add.rate_type: 'Rate Type',
//     // Add.hRate: 'Hour Rate',
//     // Add.blood_group: 'Blood Group',
//     // Add.country: 'Country',
//     // Add.city: 'City',
//     // Add.zip: 'ZIP Code',
//     // Add.designation:'Designation',
//     // Add.createdBy: 'Created By'
//   };
//   static const ADD_SITE = <Add, dynamic>{
//     // Add.heading : 'Add Site',
//     // Add.heading1: 'Update Site',
//     // Add.name: 'Name',
//     // Add.mobile: 'Mobile',
//     // Add.email: 'Email',
//     // Add.address: 'Address',
//     // Add.nameHint: 'Enter site name',
//     // Add.addressHint: 'Enter site address',
//     // Add.mobileHint: 'Enter site contact number',
//     // Add.emailHint: 'Enter site email',
//     // Add.qualification: 'Qualification',
//     // Add.cvFile: 'CV File',
//     // Add.docFile: 'Document File',
//     // Add.licFile: 'License File',
//     // Add.image: 'Image',
//     // Add.male: ['male','1'],
//     // Add.female: ['female','0'],
//   };

//   static const AddSecurityGuardHints = {
//     // Add.name: 'Enter security officer name',
//     // Add.mobile: 'Enter security officer mobile number',
//     // Add.email: 'Enter security officer email',
//     // Add.gender: 'Enter security officer gender',
//     // Add.address: 'Enter security officer address',
//     // Add.license: 'Enter security officer license number',
//     // Add.qualification: 'Enter security officer qualification',
//     // Add.username: 'Enter security officer Username',
//     // Add.password: 'Enter security officer password',
//     // Add.confirmPassword : 'Confirm password'
//   };

//   static const addClients = {
//     // AddClient.heading : 'Add Client',
//     // AddClient.clientName : 'Client Name',
//     // AddClient.clientNameHint :  'Enter client name'
//   };
//   static const updateClients = {
//     // AddClient.heading : 'Update Client',
//     // AddClient.clientName : 'Client Name',
//     // AddClient.clientNameHint :  'Enter client name'
//   };
//   static const addCompanies = {
//     // Add.heading : 'Add Company',
//     // Add.name : 'Name',
//     // Add.username : 'Username',
//     // Add.password : 'Password',
//     // Add.address :  'Address',
//     // Add.mobile :  'Mobile',
//     // Add.whatsappNo :  'WhatsApp',
//     // Add.email :  'Email',
//     // Add.nameHint : 'Enter company name',
//     // Add.usernameHint : 'Enter company username',
//     // Add.passwordHint : 'Enter company password',
//     // Add.addressHint : 'Enter company address',
//     // Add.mobileHint : 'Enter company mobile number',
//     // Add.whatsappNoHint : 'Enter whatsApp number',
//     // Add.emailHint : 'Enter company email',
//   };
//   static const updateCompanies = {
//     // Add.heading : 'Update Company',
//     // Add.name : 'Name',
//     // Add.address :  'Address',
//     // Add.mobile :  'Mobile',
//     // Add.whatsappNo :  'WhatsApp',
//     // Add.email :  'Email',
//     // Add.nameHint : 'Enter company name',
//     // Add.addressHint : 'Enter company address',
//     // Add.mobileHint : 'Enter company mobile number',
//     // Add.whatsappNoHint : 'Enter whatsApp number',
//     // Add.emailHint : 'Enter company email',
//   };
//   static const JOBS = <Jobs, dynamic>{
//     // Jobs.heading : 'Add Jobs',
//     // Jobs.company:'Company',
//     // Jobs.client:'Client',
//     // Jobs.site:'Site',
//     // Jobs.shift:'Shift',
//     // Jobs.wHours:'Working Hours',
//     // Jobs.ewHours:'Employee Working Hours',
//     // Jobs.eTWHours:'Employee Total Working Hours',
//     // Jobs.cTWHours:'Company Total Working Hours',
//     // Jobs.sTime:'Start Time',
//     // Jobs.eTime:'End Time',
//     // Jobs.cSTime:'Company Start Time',
//     // Jobs.cETime:'Company End Time',
//     // Jobs.eSTime:'Employee Start Time',
//     // Jobs.eETime:'Employee End Time',
//     // Jobs.date:'Date',
//     // Jobs.selectDate:'Select Date',
//     // Jobs.cRate:'Company Rate',
//     // Jobs.eRate:'Employee Rate',
//     // Jobs.eIncome:'Employee Income',
//     // Jobs.paid:'Paid',
//     // Jobs.cIncome:'Company Income',
//     // Jobs.profit:'Profit',
//     // Jobs.note:'Note',
//     // Jobs.addNote:'Add Note Here',
//     // Jobs.done:'Done',
//     // Jobs.paymentStatus:'Payment',
//     // Jobs.completionStatus:'Completion',
//     // Jobs.day:['day','Day'],
//     // Jobs.night:['night','Night'],
//   };

//   static const textFieldError = 'please fill the required field';
//   // static const submitText = 'Submit';
//   // static const administrationText = 'Administration';
//   // static const clientText = 'Client';
//   // static const companyText = 'Company';
//   // static const allCompanyText = 'All Companies';
//   // static const allEmployeeText = 'All Employees';
//   // static const allClientText = 'Clients';
//   // static const allSiteText = 'Sites';
//   // static const allJobsText = 'All Jobs';
//   // static const jobsText = 'Jobs';
//   // static const updateJobsText = 'Update Job';
//   // static const siteText = 'Site';
//   // static const reportsText = 'Reports';
//   // static const employeeAccountText = 'Employee Accounts';
//   // static const employeeDataText = 'Data For Employees';
//   // static const SECURITY_GUARD = 'Security Guard';
//   // static const companyDataText = 'Data for Company';
//   // static const NASS_IMAGE = 'assets/nass_limited.png';
//   // static const WHATSAPP_IMAGE = 'assets/whatsapp-logo.png';
//   // static const NASS_TEXT = 'HRM \n NASS LIMITED';
//   // static const employeeText = 'Employee';
//   static const loginText = 'Log In';
//   static const emailText = 'Email';
//   static const passwordText = 'Password';
//   // static const updateText = 'Update';
//   // static const signInHeadingText = 'Sign in to start your session';

//   // static var completionStatus = 'Completion Status';

//   // static const String trackSecurityText = 'Track Security Officer';

//   static var completionStatusList = {
//     // Status.all : 'All',
//     // Status.NA : 'NA',
//     // Status.pending: 'Pending',
//     // Status.readyToGo:'Ready to Go',
//     // Status.onTheWay:'On The Way',
//     // Status.reached:'Reached',
//     // Status.completed:'Completed'
//   };
// }
