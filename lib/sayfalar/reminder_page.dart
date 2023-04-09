import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  Map<DateTime, List> _events = {
    DateTime.utc(2023, 4, 6): ['GAME & APP JAM BAŞLANGIÇ!'],
    DateTime.utc(2023, 4, 10): ["Game & App JAM Ürün Teslimi 12:00'YE KADAR!!"],
    DateTime.utc(2023, 4, 14): ["Game & App JAM SONUÇLARIN AÇIKLANMASI!"],
  };

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: const Text('Takvim'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            onDaySelected: _onDaySelected,
            calendarStyle: CalendarStyle(
              markerDecoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              markerMargin: const EdgeInsets.symmetric(horizontal: 2),
              todayDecoration: BoxDecoration(
                color: Colors.redAccent[100],
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _buildEventList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent[100],
        onPressed: () {},
        tooltip: 'Yeni Hatırlatma Ekle',
        child: const Icon(Icons.add),
      ),
    );
  }

  List _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  Widget _buildEventList() {
    final events = _getEventsForDay(_selectedDay);

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(events[index]),
        );
      },
    );
  }
}
