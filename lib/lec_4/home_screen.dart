import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_4/slider_provider.dart';

//region Handle Multiple State with Provider (Not Recommended because of inefficiency)
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider Provider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///To Avoid complete Widget rebuild wrap Container with Consumer
          Consumer(
            builder: (context, ref, child) {
              ///Below line results in rebuild even if only slider value is change
              // final sliderValue = ref.watch(sliderProvider);

              ///This line only rebuild the widget if the value we want is updated and doesn't change if slider is updated
              final sliderValue = ref.watch(sliderProvider.select((state) => state.showPassword));
              return SizedBox(
                height: 100,
                width: 100,
                child: IconButton(
                  onPressed: () {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(showPassword: !sliderValue);
                  },
                  icon: Icon(sliderValue ? Icons.visibility : Icons.visibility_off, size: 100),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              ///Below line results in rebuild even if only checkbox value is change
              // final sliderValue = ref.watch(sliderProvider);
              final sliderValue = ref.watch(sliderProvider.select((state) => state.sliderValue));
              return Container(height: 200, width: 200, color: Colors.cyan.withValues(alpha: sliderValue));
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              ///Below line results in rebuild even if only checkbox value is change
              // final sliderValue = ref.watch(sliderProvider);
              final sliderValue = ref.watch(sliderProvider.select((state) => state.sliderValue));

              return Slider(
                value: sliderValue,
                onChanged: (value) {
                  ///We wont be able to update the value of slider because we are using it through AppState hence we will use its copyWith method
                  // ref.read(sliderProvider.notifier).state = value;

                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(sliderValue: value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

//endregion Handle Multiple State with Provider (Not Recommended because of inefficiency)
