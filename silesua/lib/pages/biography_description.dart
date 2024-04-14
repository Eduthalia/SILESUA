import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BiographyDescription extends StatelessWidget {
  const BiographyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: 450,
                child: PageView(
                  controller: _controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("images/img2.jpeg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("images/img3.jpeg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("images/img4.webp")),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Color.fromARGB(255, 158, 43, 187),
                    dotColor: Color.fromARGB(255, 222, 157, 239),
                    dotWidth: 15,
                    dotHeight: 15,
                    spacing: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Bethlehem Tilahun Alemu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Bethlehem Tilahun Alemu (born 1980) is an Ethiopian businesswoman, founder, and executive director of soleRebels, Africa's fastest growing footwear company. Bethlehem has received honors and accolades for her business acumen, as well as her efforts to shift the discourse on Africa away from poverty to the continent's entrepreneurial spirit, social capital, and economic potential.[1] Bethlehem launched The Republic of Leather designing sustainable luxury leather goods,[2] and Garden of Coffee retail outlets to promote Ethiopian coffees.[3]",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "In early 2005, Bethlehem founded soleRebels to provide ecologically and economically sustainable jobs for her community. Seeing that many skilled artisans in her small community in Zenebework were living with chronic unemployment, she wanted to showcase their skills and offer work to those in her community. The soles of the shoes are made from recycled car tyres. Today, the company has stores all over the world, including in Ethiopia, Singapore, Switzerland and Taiwan. Bethlehem is deeply proud of having been able to create global brands like soleRebels and Garden of Coffee."),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    "SoleRebels has flourished, growing to 300 employees in Ethiopia,[7] with distribution to thirty countries worldwide, selling to market kingmakers Whole Foods, Urban Outfitters and Amazon. Franchised and company-owned stores were planned to open in Austria, Switzerland, Taiwan, and the UK.[8] Bethlehem wanted to create well-paid jobs which could create prosperity using the artisan talents and natural resources of Ethiopia. The selection of footwear as the launch product for the company came later. Bethlehem was inspired by the seleate or barabasso, the traditional recycled tire sole shoe crafted in Ethiopia, and footwear became the locus around which she chose to build the company.[8]In 2016 the company sold 125,000 pairs of shoes and it had created 1,200 jobs.[3]Garden Of Coffee in 2017 In 2014, Bethlehem announced a new business venture, The Republic of Leather, via a blog post on the soleRebels website. Bethlehem identified the luxury leather goods industry as being \"ripe for a total re-imagining,\" along similar lines to what she had accomplished with soleRebels and the footwear industry. Besides espousing the same ideals of ecological and economic sustainability as soleRebels, The Republic of Leather is centered on principles of customer choice—customer choice of design, producer and receiving charity of 5% of the price they pay.[8] In 2017, Garden of Coffee was added to her companies. It begins with outlets in Addis Ababa."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
