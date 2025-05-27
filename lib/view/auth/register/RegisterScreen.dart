import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _selectedCountry = 'India';
  String? _selectedState = 'Maharashtra';
  String? _selectedDistrict;
  String? _selectedTaluka;
  String? _selectedVillage;

  // Demo data - replace with your API data
  final List<String> _districts = ['Pune', 'Mumbai', 'Nagpur', 'Nashik', 'Kolhapur'];
  final Map<String, List<String>> _talukas = {
    'Pune': ['Haveli', 'Mulshi', 'Bhor', 'Velhe'],
    'Mumbai': ['Andheri', 'Bandra', 'Dadar', 'Thane'],
  };
  final Map<String, List<String>> _villages = {
    'Haveli': ['Khadakwasla', 'Panshet', 'Donaje'],
    'Mulshi': ['Paud', 'Pirangut', 'Tamhini'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Avatar
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFF5F5F5),
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: _pickImage,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Username
              TextFormField(
                decoration: _inputDecoration('Username', Icons.person_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Phone Number
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Phone Number', Icons.phone),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  if (value.length != 10) {
                    return 'Enter 10-digit valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Country
              _buildDropdown(
                value: _selectedCountry,
                label: 'Country',
                icon: Icons.public,
                items: const ['India'],
                onChanged: (value) => setState(() => _selectedCountry = value),
              ),
              const SizedBox(height: 15),

              // State
              _buildDropdown(
                value: _selectedState,
                label: 'State',
                icon: Icons.flag,
                items: const ['Maharashtra'],
                onChanged: (value) => setState(() {
                  _selectedState = value;
                  _selectedDistrict = _selectedTaluka = _selectedVillage = null;
                }),
              ),
              const SizedBox(height: 15),

              // District (Required)
              _buildDropdown(
                value: _selectedDistrict,
                label: 'District*',
                icon: Icons.map,
                items: _districts,
                onChanged: (value) => setState(() {
                  _selectedDistrict = value;
                  _selectedTaluka = _selectedVillage = null;
                }),
                isRequired: true,
              ),
              const SizedBox(height: 15),

              // Taluka (Conditional)
              if (_selectedDistrict != null && _talukas.containsKey(_selectedDistrict)) ...[
                _buildDropdown(
                  value: _selectedTaluka,
                  label: 'Taluka (Optional)',
                  icon: Icons.location_on_outlined,
                  items: _talukas[_selectedDistrict]!,
                  onChanged: (value) => setState(() {
                    _selectedTaluka = value;
                    _selectedVillage = null;
                  }),
                ),
                const SizedBox(height: 15),
              ],

              // Village (Conditional)
              if (_selectedTaluka != null && _villages.containsKey(_selectedTaluka)) ...[
                _buildDropdown(
                  value: _selectedVillage,
                  label: 'Village (Optional)',
                  icon: Icons.villa_outlined,
                  items: _villages[_selectedTaluka]!,
                  onChanged: (value) => setState(() => _selectedVillage = value),
                ),
                const SizedBox(height: 25),
              ],

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _isLoading ? null : _submitForm,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('REGISTER', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  DropdownButtonFormField<String> _buildDropdown({
    required String? value,
    required String label,
    required IconData icon,
    required List<String> items,
    required Function(String?) onChanged,
    bool isRequired = false,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: _inputDecoration(label, icon),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      validator: isRequired ? (value) => value == null ? 'Please select $label' : null : null,
    );
  }

  void _pickImage() {
    // TODO: Implement image picker logic
    debugPrint('Pick image clicked');
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // TODO: Implement your registration logic
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Submitted')),
        );
      });
    }
  }
}
