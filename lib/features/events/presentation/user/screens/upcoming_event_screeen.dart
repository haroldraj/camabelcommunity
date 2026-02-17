import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/event_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingEventScreeen extends StatefulWidget {
  const UpcomingEventScreeen({super.key});

  @override
  State<UpcomingEventScreeen> createState() => _UpcomingEventScreeenState();
}

class _UpcomingEventScreeenState extends State<UpcomingEventScreeen> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(GetAllUpcomingEventsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Evènements à venir"), centerTitle: true),
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
              return Center(child: const CircularProgressIndicator());
            }
            // if (state is EventsSucces) {
            final events = state.events;
            return RefreshIndicator(
              backgroundColor: Colors.white,
              onRefresh: () async => context.read<EventsBloc>().add(
                GetAllUpcomingEventsRequested(),
              ),
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return EventItemCard(event: events[index]);
                },
              ),
            );
            // }
            // return const SizedBox();
          },
        ),
      ),
    );
  }
}
