import 'package:flutter/material.dart';

import 'filter.dart';
import 'jopSearch.dart';
import 'style.dart';
import 'tabs/firstTab.dart';

class jopsFilter extends StatefulWidget {
  @override
  _jopsFilterState createState() => _jopsFilterState();
}

class _jopsFilterState extends State<jopsFilter>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    title = tabsText[0];
  }

  String title;

  List<String> tabsText = [
    'تقنية المعلومات',
    'إدارة أعمال',
    'تسويق \ مبيعات',
    'سكرتارية',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _appBar(),
            SizedBox(height: 6),
            Container(
              height: 32,
              width: double.infinity,
              decoration: BoxDecoration(
                color: grayColor,
                boxShadow: [
                  BoxShadow(
                    color: dgrayColor.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Color(0xff4EA1B5),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Sukar-bold',
                ),
                labelColor: Color(0xff707070),
                tabs: <Tab>[
                  Tab(
                    text: tabsText[0],
                  ),
                  Tab(
                    text: tabsText[1],
                  ),
                  Tab(
                    text: tabsText[2],
                  ),
                  Tab(
                    text: tabsText[3],
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    title = tabsText[index];
                  });
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  firsttab(),
                  firsttab(),
                  firsttab(),
                  firsttab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return jopSearch();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Image.asset('image/search.png'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return filter();
                  }));
                },
                child: Image.asset('image/filter.png'),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              color: mainColor,
              fontSize: 23,
              fontFamily: 'sukar-black',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('image/back.png'),
          ),
        ],
      ),
    );
  }
}
