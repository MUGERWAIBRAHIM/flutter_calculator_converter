// filepath: c:\Users\IBRA\Desktop\MESOB_CALC\calc\lib\features\converter\presentation\converter_screen.dart
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class ConverterScreen extends StatefulWidget {
  final String type;
  const ConverterScreen({super.key, required this.type});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String _fromUnit = '';
  String _toUnit = '';
  double _inputValue = 0;
  double _result = 0;

  final Map<String, List<String>> _units = {
    'Length': ['Meters', 'Feet', 'Inches', 'Kilometers'],
    'Temperature': ['Celsius', 'Fahrenheit', 'Kelvin'],
    'Area': ['Square Meters', 'Square Feet', 'Square Inches', 'Hectares'],
    'Volume': ['Liters', 'Gallons', 'Cubic Meters', 'Milliliters'],
    'Time': ['Seconds', 'Minutes', 'Hours', 'Days'],
    'Pressure': ['Pascals', 'Bars', 'Atmospheres', 'PSI'],
    'Force': ['Newtons', 'Pounds-force', 'Kilograms-force'],
    'Density': ['kg/m³', 'g/cm³', 'lb/ft³'],
    'Energy': ['Joules', 'Calories', 'Kilowatt-hours', 'BTU'],
    'Current': ['Amperes', 'Milliamperes'],
    'Inductance': ['Henries', 'Millihenries'],
    'Power': ['Watts', 'Kilowatts', 'Horsepower'],
    'Resistance': ['Ohms', 'Kiloohms'],
    'Capacitance': ['Farads', 'Microfarads'],
    'Conductance': ['Siemens', 'Millisiemens'],
    'Heat Capacity': ['Joules/Kelvin', 'Calories/Kelvin'],
    'Frequency': ['Hertz', 'Kilohertz', 'Megahertz'],
    'Light Illumination': ['Lux', 'Foot-candles'],
    'Radiation': ['Grays', 'Rads'],
    'Speed': ['m/s', 'km/h', 'mph'],
    'Fuel Consumption': ['L/100km', 'mpg'],
    'Torque': ['Newton-meters', 'Foot-pounds'],
    'Data Storage': ['Bytes', 'Kilobytes', 'Megabytes', 'Gigabytes'],
    'Magnet': ['Tesla', 'Gauss'],
    'Inertia': ['kg·m²', 'g·cm²'],
    'Surface Tension': ['N/m', 'dyn/cm'],
    'Dynamic Viscosity': ['Pa·s', 'Poise'],
    'Charge': ['Coulombs', 'Milliampere-hours'],
    'Cooking': ['Cups', 'Tablespoons', 'Teaspoons'],
  };

  void _convert() {
    if (_fromUnit.isEmpty || _toUnit.isEmpty) return;
    switch (widget.type) {
      case 'Length':
        _result = _convertLength(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Temperature':
        _result = _convertTemperature(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Area':
        _result = _convertArea(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Volume':
        _result = _convertVolume(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Time':
        _result = _convertTime(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Pressure':
        _result = _convertPressure(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Force':
        _result = _convertForce(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Density':
        _result = _convertDensity(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Energy':
        _result = _convertEnergy(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Current':
        _result = _convertCurrent(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Inductance':
        _result = _convertInductance(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Power':
        _result = _convertPower(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Resistance':
        _result = _convertResistance(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Capacitance':
        _result = _convertCapacitance(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Conductance':
        _result = _convertConductance(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Heat Capacity':
        _result = _convertHeatCapacity(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Frequency':
        _result = _convertFrequency(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Light Illumination':
        _result = _convertLightIllumination(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Radiation':
        _result = _convertRadiation(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Speed':
        _result = _convertSpeed(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Fuel Consumption':
        _result = _convertFuelConsumption(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Torque':
        _result = _convertTorque(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Data Storage':
        _result = _convertDataStorage(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Magnet':
        _result = _convertMagnet(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Inertia':
        _result = _convertInertia(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Surface Tension':
        _result = _convertSurfaceTension(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Dynamic Viscosity':
        _result = _convertDynamicViscosity(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Charge':
        _result = _convertCharge(_inputValue, _fromUnit, _toUnit);
        break;
      case 'Cooking':
        _result = _convertCooking(_inputValue, _fromUnit, _toUnit);
        break;
      default:
        _result = 0;
    }
    setState(() {});
  }

  double _convertLength(double value, String from, String to) {
    const conversions = {
      'Meters': 1.0,
      'Feet': 3.28084,
      'Inches': 39.3701,
      'Kilometers': 0.001,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertTemperature(double value, String from, String to) {
    double celsius;
    switch (from) {
      case 'Celsius':
        celsius = value;
        break;
      case 'Fahrenheit':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = value - 273.15;
        break;
      default:
        return 0;
    }
    switch (to) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return celsius * 9 / 5 + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        return 0;
    }
  }

  double _convertArea(double value, String from, String to) {
    const conversions = {
      'Square Meters': 1.0,
      'Square Feet': 10.7639,
      'Square Inches': 1550.0,
      'Hectares': 0.0001,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertVolume(double value, String from, String to) {
    const conversions = {
      'Liters': 1.0,
      'Gallons': 0.264172,
      'Cubic Meters': 0.001,
      'Milliliters': 1000.0,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertTime(double value, String from, String to) {
    const conversions = {
      'Seconds': 1.0,
      'Minutes': 1 / 60,
      'Hours': 1 / 3600,
      'Days': 1 / 86400,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertPressure(double value, String from, String to) {
    const conversions = {
      'Pascals': 1.0,
      'Bars': 0.00001,
      'Atmospheres': 9.86923e-6,
      'PSI': 0.000145038,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertForce(double value, String from, String to) {
    const conversions = {
      'Newtons': 1.0,
      'Pounds-force': 0.224809,
      'Kilograms-force': 0.101972,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertDensity(double value, String from, String to) {
    const conversions = {
      'kg/m³': 1.0,
      'g/cm³': 0.001,
      'lb/ft³': 0.062428,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertEnergy(double value, String from, String to) {
    const conversions = {
      'Joules': 1.0,
      'Calories': 0.238846,
      'Kilowatt-hours': 2.77778e-7,
      'BTU': 0.000947817,
    };
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertCurrent(double value, String from, String to) {
    const conversions = {'Amperes': 1.0, 'Milliamperes': 1000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertInductance(double value, String from, String to) {
    const conversions = {'Henries': 1.0, 'Millihenries': 1000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertPower(double value, String from, String to) {
    const conversions = {'Watts': 1.0, 'Kilowatts': 0.001, 'Horsepower': 0.00134102};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertResistance(double value, String from, String to) {
    const conversions = {'Ohms': 1.0, 'Kiloohms': 0.001};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertCapacitance(double value, String from, String to) {
    const conversions = {'Farads': 1.0, 'Microfarads': 1000000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertConductance(double value, String from, String to) {
    const conversions = {'Siemens': 1.0, 'Millisiemens': 1000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertHeatCapacity(double value, String from, String to) {
    const conversions = {'Joules/Kelvin': 1.0, 'Calories/Kelvin': 0.238846};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertFrequency(double value, String from, String to) {
    const conversions = {'Hertz': 1.0, 'Kilohertz': 0.001, 'Megahertz': 0.000001};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertLightIllumination(double value, String from, String to) {
    const conversions = {'Lux': 1.0, 'Foot-candles': 0.092903};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertRadiation(double value, String from, String to) {
    const conversions = {'Grays': 1.0, 'Rads': 100.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertSpeed(double value, String from, String to) {
    const conversions = {'m/s': 1.0, 'km/h': 3.6, 'mph': 2.23694};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertFuelConsumption(double value, String from, String to) {
    // Note: Fuel consumption conversions are inverse; this is a simplification.
    if (from == 'L/100km' && to == 'mpg') return 235.215 / value;
    if (from == 'mpg' && to == 'L/100km') return 235.215 / value;
    return value; // Placeholder for same units
  }

  double _convertTorque(double value, String from, String to) {
    const conversions = {'Newton-meters': 1.0, 'Foot-pounds': 0.737562};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertDataStorage(double value, String from, String to) {
    const conversions = {'Bytes': 1.0, 'Kilobytes': 0.0009765625, 'Megabytes': 9.53674e-7, 'Gigabytes': 9.31323e-10};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertMagnet(double value, String from, String to) {
    const conversions = {'Tesla': 1.0, 'Gauss': 10000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertInertia(double value, String from, String to) {
    const conversions = {'kg·m²': 1.0, 'g·cm²': 10000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertSurfaceTension(double value, String from, String to) {
    const conversions = {'N/m': 1.0, 'dyn/cm': 1000.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertDynamicViscosity(double value, String from, String to) {
    const conversions = {'Pa·s': 1.0, 'Poise': 10.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertCharge(double value, String from, String to) {
    const conversions = {'Coulombs': 1.0, 'Milliampere-hours': 0.000277778};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  double _convertCooking(double value, String from, String to) {
    const conversions = {'Cups': 1.0, 'Tablespoons': 16.0, 'Teaspoons': 48.0};
    final base = value / conversions[from]!;
    return base * conversions[to]!;
  }

  @override
  Widget build(BuildContext context) {
    final units = _units[widget.type] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.type} Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Value'),
              keyboardType: TextInputType.number,
              onChanged: (value) => _inputValue = double.tryParse(value) ?? 0,
            ),
            DropdownButton<String>(
              value: _fromUnit.isEmpty ? null : _fromUnit,
              hint: const Text('From Unit'),
              items: units.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
              onChanged: (value) => setState(() => _fromUnit = value!),
            ),
            DropdownButton<String>(
              value: _toUnit.isEmpty ? null : _toUnit,
              hint: const Text('To Unit'),
              items: units.map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
              onChanged: (value) => setState(() => _toUnit = value!),
            ),
            ElevatedButton(onPressed: _convert, child: const Text('Convert')),
            Text('Result: $_result', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}