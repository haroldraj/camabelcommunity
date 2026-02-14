import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/event_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(GetEventsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messes à venir"), centerTitle: true),
      body: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {
          if (state is EventsFailure) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Error", style: TextStyle(color: Colors.red[800])),
                content: Text(state.errorMessage),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          }
        },
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is! EventsSucces) {
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Chargement des messes..."),
                  ],
                ),
              );
            }
            // if (state is EventsSucces) {
            final events = state.events;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventItemCard(event: events[index]);
              },
            );
            // }
            // return const SizedBox();
          },
        ),
      ),
    );
  }
}
