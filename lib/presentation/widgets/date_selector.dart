import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  DateSelector({Key key, this.title, this.valueReturned}) : super(key: key);

  final String title;
  final Function(DateTime) valueReturned;

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  var customFormat = DateFormat('dd/MM/yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: const Locale("es", "ES"),
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        print(customFormat.format(picked));
        selectedDate = picked;
        widget.valueReturned(selectedDate);
        _date.value = TextEditingValue(
            text: customFormat.format(picked).toString().split(' ')[0]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          margin: EdgeInsets.all(8.0),
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'Fecha : ',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _date,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      hintText:
                          "${customFormat.format(selectedDate)}".split(' ')[0],
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      filled: false,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                    onPressed: () {
                      print('Cambiar este boton para que abra el DatePicker');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
