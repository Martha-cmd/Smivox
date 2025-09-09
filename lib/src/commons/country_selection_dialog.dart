import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_search_bar.dart';
import '../features/model/country_model.dart';

class CountrySelectionDialog extends StatefulWidget {
  final List<CountryModel> countries;
  final CountryModel? selectedCountry;

  const CountrySelectionDialog({
    super.key,
    required this.countries,
    this.selectedCountry,
  });

  @override
  CountrySelectionDialogState createState() => CountrySelectionDialogState();
}

class CountrySelectionDialogState extends State<CountrySelectionDialog> {
  late List<CountryModel> _filteredCountries;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCountries = widget.countries;
    _searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = widget.countries;
      } else {
        _filteredCountries = widget.countries.where((country) {
          return country.name.toLowerCase().contains(query) ||
              country.code.toLowerCase().contains(query) ||
              country.dialCode.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Container(
        constraints: BoxConstraints(maxHeight: 500),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonMethods.appTexts(
                  context,
                  'Select your Country',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset("assets/svgs/remove.svg")
                )
              ],
            ),
            SizedBox(height: 16),
            SmivoxSearchBar(hintText: "Search countries...", controller: _searchController),
            SizedBox(height: 16),
            Expanded(
              child: _filteredCountries.isEmpty
                  ? Center(
                child: CommonMethods.appTexts(
                  context,
                  'No countries found',
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: _filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = _filteredCountries[index];
                  return ListTile(
                    leading: CommonMethods.appTexts(
                      context,
                      country.flag,
                      fontSize: 24,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    title: CommonMethods.appTexts(context, country.name, fontSize: 16),
                    onTap: () {
                      Navigator.of(context).pop(country);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}