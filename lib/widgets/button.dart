import 'package:flutter/material.dart';

class ButtonControllers {
  ButtonControllers({
    this.buttonsCount,
    this.onChange,
    int selectedIndex,
  }) {
    _selectedIndex = selectedIndex ?? -1;
    _registeredButtons = List.generate(buttonsCount, (index) => null);
  }

  final int buttonsCount;
  final ValueChanged<int> onChange;

  int _selectedIndex;
  List<ButtonStatesState> _registeredButtons;

  bool registerButton(ButtonStatesState button) {
    final int buttonIndex = button.index;

    _registeredButtons[buttonIndex] = button;

    return _selectedIndex == buttonIndex;
  }

  void setButtonSelected(int buttonIndex) {
    if (_selectedIndex != buttonIndex) {
      _selectedIndex = buttonIndex;
      for (int index = 0; index < buttonsCount; index++) {
        _registeredButtons[index]?.isOn(index == _selectedIndex);
      }
      onChange?.call(buttonIndex);
    }
  }
}

class ButtonStates extends StatefulWidget {
  const ButtonStates({
    this.controller,
    this.index,
    this.name,
  });

  final ButtonControllers controller;
  final int index;
  final String name;

  @override
  ButtonStatesState createState() => ButtonStatesState();
}

class ButtonStatesState extends State<ButtonStates> {
  bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.controller.registerButton(this);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(17),
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        width: 69.0,
        height: 34.0,
        decoration: _isOn
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Color(0x0dFFFFFF),
              )
            : null,
        child: Text(
          widget.name,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  void _onTap() {
    widget.controller.setButtonSelected(index);
  }

  void isOn(bool isOn) {
    if (_isOn != isOn) {
      if (mounted) {
        setState(() {
          _isOn = isOn;
        });
      }
    }
  }

  int get index => widget.index ?? -1;
}
