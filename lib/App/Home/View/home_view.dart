import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoked/App/Home/ViewModel/home_view_model.dart';
import 'package:yoked/Common/AppBTN/primary_btn.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Routes/app_routes.dart';
import 'package:yoked/Theme/colors.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.isRegistered<HomeViewModel>()
      ? Get.find<HomeViewModel>()
      : Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeVM.getProductsAPI(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.blueGrey,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              PrimaryBTN(
                  callback: () {
                    homeVM.getProductsAPI(context);
                  },
                  color: AppColor.red,
                  title: "Hit ME",
                  width: 100),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: homeVM.productsList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.productDiscriptionView,
                              arguments: [homeVM.productsList[index], index]);
                        },
                        child: Container(
                          width: AppConfig(context).width,
                          color: AppColor.white,
                          child: Column(
                            children: [
                              CustomText(
                                  title: homeVM.productsList[index].title),
                              CustomText(
                                  title:
                                      homeVM.productsList[index].id.toString()),
                              SizedBox(
                                height: 100,
                                child: Image.network(
                                    homeVM.productsList[index].image),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
