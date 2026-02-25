import 'package:camabelcommunity/core/enums/screen_name.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/app_drawer.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/event_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventHistoryScreen extends StatefulWidget {
  const EventHistoryScreen({super.key});

  @override
  State<EventHistoryScreen> createState() => _EventHistoryScreenState();
}

class _EventHistoryScreenState extends State<EventHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(GetAllPastEventsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreenName.eventHistory.title),
        centerTitle: true,
      ),
      drawer: AppDrawer(screenName: ScreenName.eventHistory),
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
                    onPressed: () => Navigator.of(context).maybePop(),
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          }
        },
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is EventsLoading) {
              return Center(child: const CircularProgressIndicator());
            }
            if (state is EventsSucces) {
              final events = state.events;
              if (events.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [Text("Aucun évènement.")],
                  ),
                );
              }
              return RefreshIndicator(
                backgroundColor: Colors.white,
                onRefresh: () async =>
                    context.read<EventsBloc>().add(GetAllPastEventsRequested()),
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventItemCard(event: events[index]);
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
