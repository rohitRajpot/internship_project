class InternshipMeta {
  final Map<String, Internship> internshipsMeta;
  final List<int> internshipIds;

  InternshipMeta({required this.internshipsMeta, required this.internshipIds});

  factory InternshipMeta.fromJson(Map<String, dynamic> json) {
    return InternshipMeta(
      internshipsMeta: (json['internships_meta'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Internship.fromJson(value as Map<String, dynamic>))
      ),
      internshipIds: (json['internship_ids'] as List<dynamic>).cast<int>(),
    );
  }
}

class Internship {
  final int id;
  final String title;
  final String employmentType;
  final ApplicationStatusMessage applicationStatusMessage;
  final String jobTitle;
  final bool workFromHome;
  final String segment;
  final String segmentLabelValue;
  final String internshipTypeLabelValue;
  final List<dynamic> jobSegments;
  final String companyName;
  final String companyUrl;
  final bool isPremium;
  final bool isPremiumInternship;
  final String employerName;
  final String companyLogo;
  final String type;
  final String url;
  final int isInternchallenge;
  final bool isExternal;
  final bool isActive;
  final String expiresAt;
  final String closedAt;
  final String profileName;
  final bool partTime;
  final String startDate;
  final String duration;
  final Stipend stipend;
  final dynamic salary;
  final dynamic jobExperience;
  final String experience;
  final String postedOn;
  final int postedOnDateTime;
  final String applicationDeadline;
  final String expiringIn;
  final String postedByLabel;
  final String postedByLabelType;
  final List<String> locationNames;
  final List<Location> locations;
  final String startDateComparisonFormat;
  final String startDate1;
  final String startDate2;
  final bool isPpo;
  final bool isPpoSalaryDisclosed;
  final dynamic ppoSalary;
  final dynamic ppoSalary2;
  final String ppoLabelValue;
  final bool toShowExtraLabel;
  final String extraLabelValue;
  final bool isExtraLabelBlack;
  final List<dynamic> campaignNames;
  final String campaignName;
  final bool toShowInSearch;
  final String campaignUrl;
  final dynamic campaignStartDateTime;
  final dynamic campaignLaunchDateTime;
  final dynamic campaignEarlyAccessStartTime;
  final dynamic campaignEndTime;
  final List<Label> labels;
  final String labelsApp;
  final List<String> labelsAppInCard;
  final bool isCovidWfhSelected;
  final bool toShowCardMessage;
  final String message;
  final bool isApplicationCappingEnabled;
  final String applicationCappingMessage;
  final List<dynamic> overrideMetaDetails;
  final bool eligibleForEasyApply;
  final bool eligibleForB2bApplyNow;
  final bool toShowB2bLabel;
  final bool isInternationalJob;
  final bool toShowCoverLetter;
  final dynamic officeDays;

  Internship({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.applicationStatusMessage,
    required this.jobTitle,
    required this.workFromHome,
    required this.segment,
    required this.segmentLabelValue,
    required this.internshipTypeLabelValue,
    required this.jobSegments,
    required this.companyName,
    required this.companyUrl,
    required this.isPremium,
    required this.isPremiumInternship,
    required this.employerName,
    required this.companyLogo,
    required this.type,
    required this.url,
    required this.isInternchallenge,
    required this.isExternal,
    required this.isActive,
    required this.expiresAt,
    required this.closedAt,
    required this.profileName,
    required this.partTime,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.salary,
    required this.jobExperience,
    required this.experience,
    required this.postedOn,
    required this.postedOnDateTime,
    required this.applicationDeadline,
    required this.expiringIn,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.locationNames,
    required this.locations,
    required this.startDateComparisonFormat,
    required this.startDate1,
    required this.startDate2,
    required this.isPpo,
    required this.isPpoSalaryDisclosed,
    required this.ppoSalary,
    required this.ppoSalary2,
    required this.ppoLabelValue,
    required this.toShowExtraLabel,
    required this.extraLabelValue,
    required this.isExtraLabelBlack,
    required this.campaignNames,
    required this.campaignName,
    required this.toShowInSearch,
    required this.campaignUrl,
    required this.campaignStartDateTime,
    required this.campaignLaunchDateTime,
    required this.campaignEarlyAccessStartTime,
    required this.campaignEndTime,
    required this.labels,
    required this.labelsApp,
    required this.labelsAppInCard,
    required this.isCovidWfhSelected,
    required this.toShowCardMessage,
    required this.message,
    required this.isApplicationCappingEnabled,
    required this.applicationCappingMessage,
    required this.overrideMetaDetails,
    required this.eligibleForEasyApply,
    required this.eligibleForB2bApplyNow,
    required this.toShowB2bLabel,
    required this.isInternationalJob,
    required this.toShowCoverLetter,
    required this.officeDays,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',  // Handles null case
      employmentType: json['employment_type'] ?? '',
      applicationStatusMessage: ApplicationStatusMessage.fromJson(json['application_status_message'] ?? {}),
      jobTitle: json['job_title'] ?? '',
      workFromHome: json['work_from_home'] ?? false,
      segment: json['segment'] ?? '',
      segmentLabelValue: json['segment_label_value'] ?? '',
      internshipTypeLabelValue: json['internship_type_label_value'] ?? '',
      jobSegments: json['job_segments'] ?? [],
      companyName: json['company_name'] ?? '',
      companyUrl: json['company_url'] ?? '',
      isPremium: json['is_premium'] ?? false,
      isPremiumInternship: json['is_premium_internship'] ?? false,
      employerName: json['employer_name'] ?? '',
      companyLogo: json['company_logo'] ?? '',
      type: json['type'] ?? '',
      url: json['url'] ?? '',
      isInternchallenge: json['is_internchallenge'] ?? 0,
      isExternal: json['is_external'] ?? false,
      isActive: json['is_active'] ?? false,
      expiresAt: json['expires_at'] ?? '',
      closedAt: json['closed_at'] ?? '',
      profileName: json['profile_name'] ?? '',
      partTime: json['part_time'] ?? false,
      startDate: json['start_date'] ?? '',
      duration: json['duration'] ?? '',
      stipend: Stipend.fromJson(json['stipend'] ?? {}),
      salary: json['salary'],
      jobExperience: json['job_experience'],
      experience: json['experience'] ?? '',
      postedOn: json['posted_on'] ?? '',
      postedOnDateTime: json['posted_on_date_time'] ?? 0,
      applicationDeadline: json['application_deadline'] ?? '',
      expiringIn: json['expiring_in'] ?? '',
      postedByLabel: json['posted_by_label'] ?? '',
      postedByLabelType: json['posted_by_label_type'] ?? '',
      locationNames: (json['location_names'] ?? []).cast<String>(),
      locations: (json['locations'] ?? []).map<Location>((e) => Location.fromJson(e)).toList(),
      startDateComparisonFormat: json['start_date_comparison_format'] ?? '',
      startDate1: json['start_date1'] ?? '',
      startDate2: json['start_date2'] ?? '',
      isPpo: json['is_ppo'] ?? false,
      isPpoSalaryDisclosed: json['is_ppo_salary_disclosed'] ?? false,
      ppoSalary: json['ppo_salary'],
      ppoSalary2: json['ppo_salary2'],
      ppoLabelValue: json['ppo_label_value'] ?? '',
      toShowExtraLabel: json['to_show_extra_label'] ?? false,
      extraLabelValue: json['extra_label_value'] ?? '',
      isExtraLabelBlack: json['is_extra_label_black'] ?? false,
      campaignNames: json['campaign_names'] ?? [],
      campaignName: json['campaign_name'] ?? '',
      toShowInSearch: json['to_show_in_search'] ?? false,
      campaignUrl: json['campaign_url'] ?? '',
      campaignStartDateTime: json['campaign_start_date_time'],
      campaignLaunchDateTime: json['campaign_launch_date_time'],
      campaignEarlyAccessStartTime: json['campaign_early_access_start_date_time'],
      campaignEndTime: json['campaign_end_date_time'],
      labels: (json['labels'] ?? []).map<Label>((e) => Label.fromJson(e)).toList(),
      labelsApp: json['labels_app'] ?? '',
      labelsAppInCard: (json['labels_app_in_card'] ?? []).cast<String>(),
      isCovidWfhSelected: json['is_covid_wfh_selected'] ?? false,
      toShowCardMessage: json['to_show_card_message'] ?? false,
      message: json['message'] ?? '',
      isApplicationCappingEnabled: json['is_application_capping_enabled'] ?? false,
      applicationCappingMessage: json['application_capping_message'] ?? '',
      overrideMetaDetails: json['override_meta_details'] ?? [],
      eligibleForEasyApply: json['eligible_for_easy_apply'] ?? false,
      eligibleForB2bApplyNow: json['eligible_for_b2b_apply_now'] ?? false,
      toShowB2bLabel: json['to_show_b2b_label'] ?? false,
      isInternationalJob: json['is_international_job'] ?? false,
      toShowCoverLetter: json['to_show_cover_letter'] ?? false,
      officeDays: json['office_days'],
    );
  }
}

class ApplicationStatusMessage {
  final bool toShow;
  final String message;
  final String type;

  ApplicationStatusMessage({
    required this.toShow,
    required this.message,
    required this.type,
  });

  factory ApplicationStatusMessage.fromJson(Map<String, dynamic> json) {
    return ApplicationStatusMessage(
      toShow: json['to_show'] ?? false,
      message: json['message'] ?? '',
      type: json['type'] ?? '',
    );
  }
}

class Stipend {
  final String salary;
  final dynamic tooltip;
  final int salaryValue1;
  final dynamic salaryValue2;
  final String salaryType;
  final String currency;
  final String scale;
  final bool largeStipendText;

  Stipend({
    required this.salary,
    required this.tooltip,
    required this.salaryValue1,
    required this.salaryValue2,
    required this.salaryType,
    required this.currency,
    required this.scale,
    required this.largeStipendText,
  });

  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json['salary'] ?? '',
      tooltip: json['tooltip'],
      salaryValue1: json['salaryValue1'] ?? 0,
      salaryValue2: json['salaryValue2'],
      salaryType: json['salaryType'] ?? '',
      currency: json['currency'] ?? '',
      scale: json['scale'] ?? '',
      largeStipendText: json['large_stipend_text'] ?? false,
    );
  }
}

class Location {
  final String string;
  final String link;
  final String country;
  final String region;
  final String locationName;

  Location({
    required this.string,
    required this.link,
    required this.country,
    required this.region,
    required this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      string: json['string'] ?? '',
      link: json['link'] ?? '',
      country: json['country'] ?? '',
      region: json['region'] ?? '',
      locationName: json['locationName'] ?? '',
    );
  }
}

class Label {
  final List<String> labelValue;
  final List<String> labelMobile;
  final List<String> labelApp;
  final List<String> labelsAppInCard;

  Label({
    required this.labelValue,
    required this.labelMobile,
    required this.labelApp,
    required this.labelsAppInCard,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      labelValue: (json['label_value'] as List<dynamic>?)?.cast<String>() ?? [],
      labelMobile: (json['label_mobile'] as List<dynamic>?)?.cast<String>() ?? [],
      labelApp: (json['label_app'] as List<dynamic>?)?.cast<String>() ?? [],
      labelsAppInCard: (json['labels_app_in_card'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }
}