import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'conversion_provider.dart';

class ConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConversionProvider>(context);
    final isDarkMode = provider.isDarkMode;
    final darkModeBackground = Color(0xFF1A1A2E);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temperature Conversion',
          style: TextStyle(color: Colors.cyan),
        ),
        backgroundColor: isDarkMode ? darkModeBackground : Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Theme switcher
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              value: isDarkMode,
              onChanged: provider.toggleDarkMode,
            ),
            SizedBox(height: 20),
            // Conversion type selection
            Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[600] : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: DropdownButton<String>(
                value: provider.conversionType,
                items: [
                  DropdownMenuItem(
                    value: 'F to C',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Fahrenheit to Celsius',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'C to F',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Celsius to Fahrenheit',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    provider.updateConversionType(value);
                  }
                },
                isExpanded: true,
                underline: SizedBox(),
                icon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                dropdownColor: isDarkMode ? Colors.grey[600] : Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Input temperature
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[600] : Colors.white,
                prefixIcon: Icon(
                  Icons.thermostat_outlined,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              onChanged: (value) {
                provider.updateInputValue(double.tryParse(value) ?? 0);
              },
            ),
            SizedBox(height: 20),
            // Convert button
            ElevatedButton(
              onPressed: provider.convert,
              child: Text('Convert', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display result
            Text(
              provider.result,
              style: TextStyle(
                fontSize: 24,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // History
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[600] : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: provider.history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        provider.history[index],
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: isDarkMode ? darkModeBackground : Colors.grey[200],
    );
  }
}
