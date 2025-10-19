import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_button.dart';
import 'package:smivox_inventory_software/src/commons/smivox_input_fields.dart';
import 'package:smivox_inventory_software/src/core/responses.dart';
import 'package:smivox_inventory_software/src/core/storage/storage_manager.dart';
import 'package:smivox_inventory_software/src/features/authentication/model/store/store_registration_model.dart';
import 'package:smivox_inventory_software/src/features/authentication/repository/auth_repository.dart';
import 'package:smivox_inventory_software/src/res/app_strings.dart';
import 'package:smivox_inventory_software/src/services/api_service.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import '../../model/country_model.dart';
import '../../model/state_model.dart';
import '../../../services/state_service.dart';
import '../components/heading_and_subheading.dart';
import '../../../commons/country_selection_dialog.dart';
import '../../../commons/state_selection_dialog.dart';

class StoreRegistrationScreen extends StatefulWidget {
  const StoreRegistrationScreen({super.key});

  @override
  State<StoreRegistrationScreen> createState() =>
      _StoreRegistrationScreenState();
}

class _StoreRegistrationScreenState extends State<StoreRegistrationScreen> {
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeEmailAddressController = TextEditingController();
  final TextEditingController storeCountryController = TextEditingController();
  final TextEditingController storeStateController = TextEditingController();
  final TextEditingController storeCityController = TextEditingController();
  final TextEditingController natureOfBusinessController = TextEditingController();
  final TextEditingController storeAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  List<CountryModel> _countries = [];
  CountryModel? _selectedCountry;
  List<StateModel> _states = [];
  bool _isLoadingStates = false;
  List<String> _businessTypes = [];
  bool _isLoadingBusinessTypes = false;
  bool _isButtonEnabled = false;
  String? _errorMessage;
  bool _isRegistering = false;
  late final AuthRepository _authRepository;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository(ApiService());

    [
      storeNameController,
      storeEmailAddressController,
      storeCountryController,
      storeStateController,
      storeCityController,
      natureOfBusinessController,
      storeAddressController,
      passwordController,
      confirmPasswordController,
    ].forEach((controller) {
      controller.addListener(_validateForm);
    });

    loadCountries(context).then((list) {
      setState(() {
        _countries = list;
      });
    });

    _preloadAllCountriesStates();
    _loadBusinessTypes();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _validateForm();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                Image.asset("assets/logo/logo.png", width: 100),
                HeadingAndSubheading(
                  heading: AppTexts.welcomeToSmivox,
                  subHeading: AppTexts.subtextStoreNameReg,
                ),
                const SizedBox(height: 1),
                Column(
                  spacing: 20,
                  children: [

                    SmivoxInputFields(
                      headText: AppTexts.storeNameLabel,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: "Market Square",
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/briefcase.svg",
                        width: 18,
                      ),
                      controller: storeNameController,
                    ),


                    SmivoxInputFields(
                      headText: AppTexts.storeEmailLabel,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: "supermarkt@gmail.com",
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/mail.svg",
                        width: 18,
                      ),
                      controller: storeEmailAddressController,
                    ),


                    GestureDetector(
                      onTap: _showCountrySelection,
                      child: AbsorbPointer(
                        child: SmivoxInputFields(
                          headText: "Country",
                          headFontWeight: FontWeight.normal,
                          hintText: "Select your country",
                          leadingIcon: _selectedCountry != null
                              ? CommonMethods.appTexts(
                            context,
                            _selectedCountry!.flag,
                            style: TextStyle(fontSize: 20),
                          )
                              : SvgPicture.asset(
                              "assets/onboarding/globe.svg",
                              width: 18,
                            ),
                          controller: storeCountryController,
                          suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15),
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: _showStateSelection,
                      child: AbsorbPointer(
                        child: SmivoxInputFields(
                          headText: "State",
                          headFontWeight: FontWeight.normal,
                          hintText: "Select your state",
                          leadingIcon: SvgPicture.asset("assets/onboarding/map-location.svg", width: 18),
                          controller: storeStateController,
                          suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15),
                        ),
                      ),
                    ),


                    SmivoxInputFields(
                      headText: AppTexts.city,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: "Enter your city",
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/pin.svg",
                        width: 18,
                      ),
                      // suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15),
                      controller: storeCityController,
                    ),


                    SmivoxInputFields(
                      headText: AppTexts.address,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: AppTexts.storeAddress,
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/home-input-icon.svg",
                        width: 18,
                      ),
                      controller: storeAddressController,
                    ),


                    SmivoxInputFields(
                      headText: AppTexts.natureOfBusiness,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: "Choose nature of business",
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/dashboard.svg",
                        width: 18,
                      ),
                      suffixIcon: Icon(CupertinoIcons.chevron_down, size: 15),
                      controller: natureOfBusinessController,
                      isDropdown: true,
                      dropdownItems: _businessTypes,
                      onDropdownItemSelected: (value) {
                        natureOfBusinessController.text = value;
                        _validateForm();
                      },

                    ),


                    SmivoxInputFields(
                      headText: AppTexts.password,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: "Create store password",
                      obscureText: true,
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/lock.svg",
                        width: 18,
                      ),
                      controller: passwordController,
                    ),


                    SmivoxInputFields(
                      headText: AppTexts.confirmPassword,
                      headFontWeight: FontWeight.normal,
                      labelColor: Colors.black,
                      hintText: "Confirm store password",
                      obscureText: true,
                      leadingIcon: SvgPicture.asset(
                        "assets/onboarding/lock.svg",
                        width: 18,
                      ),
                      controller: confirmPasswordController,
                    ),



                    if (_errorMessage != null)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red, size: 16),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _errorMessage!,
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    SizedBox(height: 10),

                    IgnorePointer(
                      ignoring: !_isButtonEnabled || _isRegistering,
                      child: SmivoxButton(
                        text: "Continue",
                        color: _isButtonEnabled ? null : Colors.grey,
                        isLoading: _isRegistering,
                        onTap: _registerStore,
                      ),
                    ),


                    Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonMethods.appTexts(
                          context,
                          "Already have a ${AppTexts.storeName} account?",
                          fontSize: 14,
                        ),
                        GestureDetector(
                          onTap:
                              () => CommonMethods.replaceWithNextScreen(
                                context,
                                RoutesPath.storeLoginScreen,
                              ),
                          child: CommonMethods.appTexts(
                            context,
                            "Log in",
                            color: Color(0xFF0311D7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _preloadAllCountriesStates() async {
    try {
      await StateService.getAllCountriesStates();
    } catch (e) {
      print('Error preloading states: $e');
    }
  }

  Future<void> _loadBusinessTypes() async {
    setState(() {
      _isLoadingBusinessTypes = true;
    });

    try {
      final String response = await rootBundle.loadString("assets/data/nature_of_business.json");
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> natures = data['natures'] ?? [];

      setState(() {
        _businessTypes = natures.map<String>((item) => item.toString()).toList();
        _isLoadingBusinessTypes = false;
      });

      _validateForm();
    } catch (e) {
      setState(() {
        _isLoadingBusinessTypes = false;
        _businessTypes = [];
      });
      log('Error loading business types: $e');
    }
  }

  Future<void> _registerStore () async {
      if (_isRegistering) return;

      if (!_isButtonEnabled) return;

      final name = storeNameController.text.trim();
      final email = storeEmailAddressController.text.trim();
      final country = storeCountryController.text.trim();
      final state = storeStateController.text.trim();
      final city = storeCityController.text.trim();
      final address = storeAddressController.text.trim();
      final nature = natureOfBusinessController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (name.isEmpty ||
          email.isEmpty ||
          country.isEmpty ||
          state.isEmpty ||
          city.isEmpty ||
          address.isEmpty ||
          nature.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        CommonMethods.showSnackBar(context: context, message: "Please fill all fields");
        return;
      }

      if (password != confirmPassword) {
        CommonMethods.showError(context: context, message: "Passwords do not match");
        return;
      }

      final model = StoreRegistrationModel(
        companyName: name,
        businessEmail: email,
        password: password,
        country: country,
        state: state,
        city: city,
        address: address,
        businessNature: nature,
        confirmPassword: confirmPassword,
      );

      setState(() => _isRegistering = true);

      try {
         final Responses response = await _authRepository.registerStore(model);

         if (response.success) {
           final Map<String, dynamic> storeData = response.data ?? {};

           await StorageManager.clearStoreData();

           await StorageManager.saveStoreData(storeData);

            CommonMethods.showSuccess(context: context, message: response.message ?? "Store registration Successful");
            await StorageManager.setCurrentStep('/personal-details');
            CommonMethods.replaceWithNextScreen(context, RoutesPath.personalDetailsScreen);
         } else {
            CommonMethods.showError(context: context, message: response.message ?? "Store registration failed");
         }
      }catch (e) {
          CommonMethods.showError(context: context, message: "Error registration failed");
          log("Error: $e");
      } finally {
          setState(() => _isRegistering = false);
      }

  }

  void _validateForm() {
    log('=== VALIDATE FORM TRIGGERED ===');
    final fields = [
      storeNameController.text.trim(),
      storeEmailAddressController.text.trim(),
      storeCountryController.text.trim(),
      storeStateController.text.trim(),
      storeCityController.text.trim(),
      natureOfBusinessController.text.trim(),
      storeAddressController.text.trim(),
      passwordController.text.trim(),
      confirmPasswordController.text.trim(),
    ];

    // Check if any field is empty
    if (fields.any((field) => field.isEmpty)) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Please fill in all fields";
      });
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(storeEmailAddressController.text.trim())) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Please enter a valid email address";
      });
      return;
    }

    // Validate password match
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Passwords do not match";
      });
      return;
    }

    // Validate password length
    if (passwordController.text.length < 6) {
      setState(() {
        _isButtonEnabled = false;
        _errorMessage = "Password must be at least 6 characters";
      });
      return;
    }

    // If all validations pass
    setState(() {
      _isButtonEnabled = true;
      _errorMessage = null;
    });
  }

  Future<List<CountryModel>> loadCountries(BuildContext context) async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString('assets/data/locations.json');
    // log("Raw JSON: $response");
    final List<dynamic> data = jsonDecode(response);
    log("Decoded length: ${data.length}");
    return data.map((e) => CountryModel.fromJson(e)).toList();
  }

  Future<void> _showCountrySelection() async {
    if (_countries.isEmpty) return;

    final selected = await showDialog<CountryModel>(
      context: context,
      builder: (context) => CountrySelectionDialog(
        countries: _countries,
        selectedCountry: _selectedCountry,
      ),
    );

    if (selected != null) {
      setState(() {
        _selectedCountry = selected;
        storeCountryController.text = selected.name;
      });

      // Load states for the selected country
      await _loadStatesForCountry(selected.code);

      _validateForm();

      print("Selected: ${selected.name}, Code: ${selected.code}");
    }
  }

  Future<void> _showStateSelection() async {
    if (_states.isEmpty) return;

    final selected = await showDialog<StateModel>(
      context: context,
      builder: (context) => StateSelectionDialog(
        states: _states,
        selectedState: storeStateController.text,
      ),
    );

    if (selected != null) {
      setState(() {
        storeStateController.text = selected.name;
      });

      _validateForm();

      print("Selected state: ${selected.name}, Code: ${selected.stateCode}");
    }
  }

  Future<void> _loadStatesForCountry(String countryCode) async {
    setState(() {
      _isLoadingStates = true;
      _states = [];
      storeStateController.clear();
    });

    try {
      final states = await StateService.getStatesForCountry(countryCode);

      setState(() {
        _states = states;
        _isLoadingStates = false;
      });
      _validateForm();
    } catch (e) {
      setState(() {
        _isLoadingStates = false;
        _states = [];
      });
      print('Error loading states for $countryCode: $e');
    }
  }

  @override
  void dispose() {
    storeNameController.dispose();
    storeEmailAddressController.dispose();
    storeCountryController.dispose();
    storeStateController.dispose();
    storeCityController.dispose();
    natureOfBusinessController.dispose();
    storeAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


}
