part of '../screen_kanban.dart';


class _OnHold extends StatelessWidget {
  final List<LocalKanban> kanbans;

  const _OnHold({
    Key? key,
    required this.kanbans,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kanbans.length,
      itemBuilder: (context, index) {
        final kanban = kanbans[index];
        return Card(
          elevation: 10,
          child: ListTile(
            title: Text(
              kanban.text ?? '',
            ),
          ),
        );
      },
    );
  }
}
