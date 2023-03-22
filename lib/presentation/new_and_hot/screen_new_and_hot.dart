

import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(93),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: kWhiteColor,
                size: 30,
              ),
              kWidth,
              Container(
                color: Colors.blue,
                height: 30,
                width: 30,
              ),
              kWidth,
            ],
            bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 10, top: 7),
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator:
                  BoxDecoration(color: kWhiteColor, borderRadius: kRadis30),
              tabs: const [

                Tab(
                  text: 'Comming Soon',
                 
                ),
                Tab(
                  text: "Everyone's Watching",
                ),
                
              ],
            ),
            
          ),
        ),
        
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
            
          ],
          
        ),
        
      ),
      
    );
  }
  //! ComingSoon Widget
  Widget _buildComingSoon() {
    return ListView.separated(
      itemBuilder: (BuildContext context, index) {
        return const ComingSoonWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return kHeight;
      },
      itemCount: 10,
    );
  }
  //! Everyone's Watching
  Widget _buildEveryonesWatching() {
    return const SizedBox();
  }
}


