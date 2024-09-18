import 'package:flutter/material.dart';
import 'package:internship/filter/filter.dart';
import 'package:internship/home/home_widgets.dart';
import 'package:internship/modal/intership_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedProfileName;
  String? selectedDuration;
  String? selectedLocationName;
  String searchQuery = '';
  List<Internship> allInternships = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[50],
        title: const Text(
          'Internships',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  final options = FilterOptions(
                    profileNames: [
                      'All',
                      'Data Science',
                      'Administration',
                      'Business Analytics',
                      'Brand Management',
                      'Android App Development',
                      'Product Management'
                    ],
                    durations: [
                      '1 Month',
                      '2 Months',
                      '3 Months',
                      '4 Months',
                      '6 Months',
                      '7 Months',
                      '8 Months',
                      '9 Months',
                      '10 Months',
                      '11 Months',
                      '12 Months'
                    ],
                    locationNames: [
                      'Munnar',
                      'Lucknow',
                      'Tarn Taran',
                      'Banga (Philippines)',
                      'Kera',
                      'Parbhani',
                      'Delhi',
                      "Gurgaon"
                    ],
                  );

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FilterModal(
                      options: options,
                      onApplyFilters: (profileName, duration, locationName) {
                        setState(() {
                          selectedProfileName = profileName;
                          selectedDuration = duration;
                          selectedLocationName = locationName;
                        });
                      },
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.filter_list),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
          //
          Expanded(
            child: FutureBuilder(
              future: fetchInternships(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    allInternships = snapshot.data as List<Internship>;

                    final filteredInternships =
                        allInternships.where((internship) {
                      final matchesSearchQuery = internship.title
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());

                      final matchesProfileName = selectedProfileName == null ||
                          selectedProfileName == 'All' ||
                          internship.profileName == selectedProfileName;

                      final matchesDuration = selectedDuration == null ||
                          internship.duration == selectedDuration;

                      final matchesLocationName =
                          selectedLocationName == null ||
                              internship.locationNames
                                  .contains(selectedLocationName);

                      return matchesSearchQuery &&
                          matchesProfileName &&
                          matchesDuration &&
                          matchesLocationName;
                    }).toList();

                    return ListView.builder(
                      itemCount: filteredInternships.length,
                      itemBuilder: (context, index) {
                        final internship = filteredInternships[index];
                        return InternshipCard(internship: internship);
                      },
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
