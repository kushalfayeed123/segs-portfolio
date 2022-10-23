import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:segs/ui/shared/image_loader.dart';

class About extends ConsumerWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserId);
    final description = ref.watch(userDataProvider(userId)
        .select((value) => value.value?.description ?? ''));
    final image = ref.watch(
        userDataProvider(userId).select((value) => value.value?.imgUrl ?? ''));
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'About Me',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: AppColors.primary,
                  width: 0.05,
                )),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Text(
                  description,
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      wordSpacing: 2,
                      fontSize: 20,
                      color: AppColors.offWhite.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Stack(
                  children: [
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Card(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        )),
                    Card(
                      elevation: 3,
                      color: Colors.purple,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ImageLoader(
                          image: image,
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.55,
                          radius: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
