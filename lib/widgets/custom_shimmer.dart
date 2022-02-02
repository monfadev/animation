part of 'widgets.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;
  const CustomShimmer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(child: child, baseColor: Colors.grey, highlightColor: Colors.grey.shade400),
    );
  }
}
