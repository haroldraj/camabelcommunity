import 'package:camabelcommunity/core/dependency_injection.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events_bloc.dart';
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
      appBar: AppBar(title: Text("Home"), centerTitle: true),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state is EventsFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is! EventsSucces) {
            return Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  CircularProgressIndicator(),
                  Text("Chargement des données..."),
                ],
              ),
            );
          }

          final events = state.events;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return EventItemCard(event: events[index]);
            },
          );
        },
      ),
    );
  }
}
