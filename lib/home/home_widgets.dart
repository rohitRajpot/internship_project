import 'package:flutter/material.dart';
import 'package:internship/modal/intership_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Internship>> fetchInternships() async {
  try {
    final response = await http.get(Uri.parse('https://internshala.com/flutter_hiring/search'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> jsonInternships = jsonData['internships_meta']?.values?.toList() ?? [];
      return jsonInternships.map((json) => Internship.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load internships. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('An error occurred: $e');
  }
}

class InternshipCard extends StatefulWidget {
  final Internship internship;

  const InternshipCard({super.key, required this.internship});

  @override
  _InternshipCardState createState() => _InternshipCardState();
}

class _InternshipCardState extends State<InternshipCard> {
  String locationNames = '';

  @override
  void initState() {
    super.initState();
    fetchLocationNames();
  }

  void fetchLocationNames() {
    List<String> locationNamesList = widget.internship.locationNames;
    if (locationNamesList.isNotEmpty) {
      setState(() {
        locationNames = locationNamesList.join(', ');  
      });
    } else {
      setState(() {
        locationNames = 'No locations available';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoText(label: 'Company Name: ', value: widget.internship.companyName),
          InfoText(label: 'Title: ', value: widget.internship.title),
          InfoText(label: 'Profile Name: ', value: widget.internship.profileName),
          InfoText(label: 'Type: ', value: widget.internship.employmentType),
          InfoText(label: 'Duration: ', value: widget.internship.duration),
          InfoText(label: 'Location: ', value: locationNames.isNotEmpty ? locationNames : 'Loading...'),
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String label;
  final String value;

  const InfoText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
