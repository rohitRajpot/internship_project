import 'package:flutter/material.dart';

class FilterOptions {
  final List<String> profileNames;
  final List<String> durations;
  final List<String> locationNames; // New field for location names

  FilterOptions({
    required this.profileNames,
    required this.durations,
    required this.locationNames, // Constructor update
  });
}

class FilterModal extends StatefulWidget {
  final FilterOptions options;
  final Function(String?, String?, String?) onApplyFilters; // Updated for locationName

  const FilterModal({super.key, required this.options, required this.onApplyFilters});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  String? selectedProfileName;
  String? selectedDuration;
  String? selectedLocationName; // New field for selected location name

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filter Options',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          _buildDropdownWithSpacing(
            hintText: 'Select Profile Name',
            value: selectedProfileName,
            items: widget.options.profileNames,
            onChanged: (String? newValue) {
              setState(() {
                selectedProfileName = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildDropdownWithSpacing(
            hintText: 'Select Duration',
            value: selectedDuration,
            items: widget.options.durations,
            onChanged: (String? newValue) {
              setState(() {
                selectedDuration = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildDropdownWithSpacing( // New Dropdown for Location
            hintText: 'Select Location',
            value: selectedLocationName,
            items: widget.options.locationNames,
            onChanged: (String? newValue) {
              setState(() {
                selectedLocationName = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onApplyFilters(selectedProfileName, selectedDuration, selectedLocationName); // Pass the selected location name as well
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }

  // Custom Dropdown Builder
  Widget _buildDropdownWithSpacing({
    required String hintText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButton<String>(
      hint: Text(hintText),
      value: value,
      isExpanded: true,
      onChanged: onChanged,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      dropdownColor: Colors.white,
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16),
      items: items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey[700]), // Icon change for location
                const SizedBox(width: 10),
                Text(item),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
