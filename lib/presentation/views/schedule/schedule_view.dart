import 'package:anydoctorhere/models/schedule_model.dart';
import 'package:anydoctorhere/presentation/shared/sectionheader_widget.dart';
import 'package:anydoctorhere/presentation/views/schedule/widgets/visitcard_widget.dart';
import 'package:flutter/material.dart';

class SchedulingView extends StatefulWidget {
  const SchedulingView({super.key});

  @override
  State<SchedulingView> createState() => _SchedulingViewState();
}

class _SchedulingViewState extends State<SchedulingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Text('Schedule',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      Expanded(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TabBar(
                  indicatorColor: Colors.purple,
                  unselectedLabelColor: Colors.grey.withValues(alpha: .5),
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    ...List.generate(
                      tabs.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Tab(
                          text: tabs[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          // Active visits
                          SectionHeader(title: 'Nearest visit'),
                          Column(spacing: 10, children: [
                            ...List.generate(nearest.length, (index) {
                              return VisitCard(
                                  visitScheduled: schedules[index]);
                            })
                          ]),
                          SectionHeader(title: 'Future visits'),
                          Column(children: [
                            ...List.generate(futures.length, (index) {
                              return VisitCard(
                                  visitScheduled: schedules[index]);
                            })
                          ]),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Canceled",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.purple,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
