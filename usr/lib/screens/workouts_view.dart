import 'package:flutter/material.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for workouts
    final workouts = [
      {'title': 'Full Body HIIT', 'level': 'Intermediate', 'duration': '45 min', 'icon': Icons.fitness_center},
      {'title': 'Yoga Flow', 'level': 'Beginner', 'duration': '30 min', 'icon': Icons.self_improvement},
      {'title': 'Upper Body Strength', 'level': 'Advanced', 'duration': '60 min', 'icon': Icons.sports_gymnastics},
      {'title': 'Cardio Blast', 'level': 'Intermediate', 'duration': '20 min', 'icon': Icons.directions_run},
      {'title': 'Core Crusher', 'level': 'Advanced', 'duration': '15 min', 'icon': Icons.accessibility_new},
    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Workouts', 
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
          ),
          
          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildCategoryChip(context, 'All', true),
                _buildCategoryChip(context, 'Cardio', false),
                _buildCategoryChip(context, 'Strength', false),
                _buildCategoryChip(context, 'Yoga', false),
                _buildCategoryChip(context, 'HIIT', false),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Workout List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final w = workouts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  color: Theme.of(context).colorScheme.surface,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            child: Icon(
                              w['icon'] as IconData, 
                              size: 48, 
                              color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    w['title'] as String, 
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.timer, size: 16, color: Colors.grey[400]),
                                      const SizedBox(width: 4),
                                      Text(w['duration'] as String, style: TextStyle(color: Colors.grey[400])),
                                      const SizedBox(width: 16),
                                      Icon(Icons.bar_chart, size: 16, color: Colors.grey[400]),
                                      const SizedBox(width: 4),
                                      Text(w['level'] as String, style: TextStyle(color: Colors.grey[400])),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        checkmarkColor: Theme.of(context).colorScheme.primary,
        labelStyle: TextStyle(
          color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
