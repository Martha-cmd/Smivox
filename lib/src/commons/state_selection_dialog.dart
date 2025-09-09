import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_search_bar.dart';
import '../features/model/state_model.dart';


class StateSelectionDialog extends StatefulWidget {
  final List<StateModel> states;
  final String? selectedState;

  const StateSelectionDialog({
    super.key,
    required this.states,
    this.selectedState,
  });

  @override
  StateSelectionDialogState createState() => StateSelectionDialogState();
}

class StateSelectionDialogState extends State<StateSelectionDialog> {
  late List<StateModel> _filteredStates;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredStates = widget.states;
    _searchController.addListener(_filterStates);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterStates() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredStates = widget.states;
      } else {
        _filteredStates = widget.states.where((state) {
          return state.name.toLowerCase().contains(query) ||
              state.stateCode.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
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
                  'Select your State',
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
            SmivoxSearchBar(hintText: "Search states...", controller: _searchController),
            SizedBox(height: 16),
            Expanded(
              child: widget.states.isEmpty // Check if original list is empty
                  ? Center(
                child: CommonMethods.appTexts(
                  context,
                  'No states available for this country',
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : _filteredStates.isEmpty
                  ? Center(
                child: CommonMethods.appTexts(
                  context,
                  'No states found matching your search',
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: _filteredStates.length,
                itemBuilder: (context, index) {
                  final state = _filteredStates[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    title: CommonMethods.appTexts(context, state.name, fontSize: 16),
                    onTap: () {
                      Navigator.of(context).pop(state);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Dialog(
  //     insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     backgroundColor: Colors.white,
  //     child: Container(
  //       constraints: BoxConstraints(maxHeight: 500),
  //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               CommonMethods.appTexts(
  //                 context,
  //                 'Select your State',
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.black
  //                 ),
  //               ),
  //               GestureDetector(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: SvgPicture.asset("assets/svgs/remove.svg")
  //               )
  //             ],
  //           ),
  //           SizedBox(height: 16),
  //           SmivoxSearchBar(hintText: "Search states...", controller: _searchController),
  //           SizedBox(height: 16),
  //           Expanded(
  //             child: _filteredStates.isEmpty
  //                 ? Center(
  //               child: CommonMethods.appTexts(
  //                 context,
  //                 'No states found',
  //                 style: TextStyle(color: Colors.grey),
  //               ),
  //             )
  //                 : ListView.builder(
  //               itemCount: _filteredStates.length,
  //               itemBuilder: (context, index) {
  //                 final state = _filteredStates[index];
  //                 return ListTile(
  //                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
  //                   title: CommonMethods.appTexts(context, state.name, fontSize: 16),
  //                   subtitle: Text('Code: ${state.stateCode}'),
  //                   onTap: () {
  //                     Navigator.of(context).pop(state);
  //                   },
  //                 );
  //               },
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}