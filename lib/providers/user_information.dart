import 'package:flutter/material.dart';
import 'package:helping_hand/Model/Profile/employee_profile.dart';
import 'package:helping_hand/Model/Profile/employer_profile.dart';
import 'package:helping_hand/Model/job.dart';
import 'package:helping_hand/Model/review.dart';
import 'package:helping_hand/Model/shop.dart';

class GetUserInfo with ChangeNotifier {
  final fetchAndSetUserinfoForEmployee = Employee(

    employeeImage: "https://i2-prod.walesonline.co.uk/incoming/article21810884.ece/ALTERNATES/s1200c/0_Cillian-Murphy-will-star-in-Oppenheimer.jpg",
    employeeName: "Mellow Employee",//top detail
    employeeAge: "20",//details page
    employeeContactNumber: "+91 9876543210",//details page
    employeeDOB: "01/01/0001",//details page
    employeeExpectedSalary: "20,000",//expanded detail
    averageRating: 4.3,//expanded detail
    employeeBio:
        "I am a student, looking for a part-time job. Not available on weekends.",//details page
    employeeAddress:
        "Behind your house, in front of the pole, your ward, your city, your district, India",//detail page
    currentlyWorkingAt: "Raju Guest House",
    employeePreferedShift: "Night Shift",//expanded detail
    employeeExperience: "5 years",//top detail
    preferredJobType: 'Part-Time',//expanded detail
    employeeExpectedJobs:
        "Waiter, Private Tutor,Dishwasher,Watchmen,Security Guard",
  );
  final fetchAndSetReviewsForEmployee = Employee(
    reviews: [
      ReviewByEmployer(
          shopImageUrl:
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bojnice-castle-1603142898.jpg",
          reviewId: "review1",
          reviewerId: "reviewer1",
          rating: 3,
          jobWorked: "Waiter",
          reviewerShopName: "Mera Yasu Yasu",
          reviewPara:
              "He worked great, i can assure you that he can get the jov donw even if its something illegal"),
      ReviewByEmployer(
          shopImageUrl:
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bojnice-castle-1603142898.jpg",
          reviewId: "review2",
          reviewerId: "reviewer2",
          rating: 4,
          jobWorked: "Tester",
          reviewerShopName: "Macho Underwears",
          reviewPara:
              "He worked great, i can assure you that he can get the jov done. He was very good tester and tested the quality perfectly."),
    ],
  );
  final fetchAndSetUserinfoForEmployer = Employer(
    employerName: "Mellow Employer",
    employerAge: "20",
    employerContactNumber: "+91 9876543210",
    employerDOB: "01/01/0001",
    averageRating: 3.5,
    employerBio:
        "I am owner of Mellow Industries, looking for some good employees. Not available on weekends.",
    employerAddress:
        "Behind your house, in front of the pole, your ward, your city, your district, India",
  );
  final fetchAndSetReviewsForEmployer = Employer(
    reviews: [
      ReviewByEmployee(
        reviewId: "review1",
        reviewerId: "reviewer1",
        rating: 4,
        jobWorked: "IronMan",
        reviewerName: "Tony Stark",
        profileImageURL:
            "https://images.kooapp.com/transcode_input/7f0ca40e-2358-4e07-9c32-f94b1b9555e5voke.jpg",
        backgroundImageURL:
            "https://cdn.cnn.com/cnnnext/dam/assets/130503132238-robert-downey-jr--horizontal-large-gallery.jpg",
        reviewPara:
            "This is a very good place and the owner is very supportive and nice",
      ),
      ReviewByEmployee(
        reviewId: "review2",
        reviewerId: "reviewer2",
        rating: 3,
        jobWorked: "Captain America",
        reviewerName: "Steve Rogers",
        profileImageURL:
            "https://i.pinimg.com/736x/09/67/df/0967dfde9b0e680fa7e7d6d04d9e30ef.jpg",
        backgroundImageURL:
            "https://www.filmfetish.com/img/p/2015/05/captain-america-winter-soldier-movie-poster-images-sldr-1024x580.jpg",
        reviewPara:
            "Boss was very friendly and very happy and he helped me whenever i needed help and leave ...",
      )
    ],
  );
  final fetchAndSetEmployerShops = Employer(
    shops: [
      Shop(
        shopid: "shopnumber1",
        shopName: "TopShop",
        numOfEmployees: "25",
        ownerName: "Sanskar Modi",
        shopAddress:
            "Pahado ke uppar, Jungle ke paar, Apna shahar, Apna District,  India",
        shopType: "Sweets",
        city:"Lucknow",
        shopImageUrl:
            'https://ichef.bbci.co.uk/news/976/cpsprodpb/8A13/production/_116574353_gettyimages-1229868118.jpg',
        jobsAvailable: [
          Job(
            jobId: "job1",
            shopId: "shopnumber1",
            specialRequest:
                "Should be able to stay for late meetings occasionaly",
            jobName:"Grocery",
            salary: "30000",
            workingDays: "Full week excluding sunday",
            workingHours: "12:00am to 5:00pm",
            vacancy: "5"
          ),
          Job(
            jobId: "job2",
            shopId: "shopnumber1",
            specialRequest:
                "Should be able to stay for late meetings occasionaly",
            jobName: "Security Guard",
            salary: "20000",
            workingDays: "Full week ",
            workingHours: "6:00am to 8:00pm",
            vacancy: "5"
          )
        ],
      ),
      Shop(
        shopid: "shopnumber2",
        shopName: "Outfitters",
        numOfEmployees: "15",
        ownerName: "Pranay Dhongade",
        city:"Chennai",
        shopAddress:
            "Pahado ke uppar, Jungle ke paar, Apna shahar, Apna District,  India",
        shopType: "Clothes",
        shopImageUrl:
            'https://imganuncios.mitula.net/shop_from_12_lacs_showroom_warehouse_rent_store_main_gate_shops_office_2750077626957635821.jpg',
        jobsAvailable: [
          Job(
            jobId: "job3",
            shopId: "shopnumber2",
            jobName: "Dish Washer",
            salary: "8000",
            workingDays: "Full week excluding sunday",
            workingHours: "12:00am to 5:00pm",
            vacancy: "5"
          ),
          Job(
            jobId: "job4",
            shopId: "shopnumber2",
            jobName: "Security Guard",
            salary: "10000",
            workingDays: "Full week",
            workingHours: "6:00am to 8:00pm",
              vacancy: "5"
          ),
          Job(
            jobId: "job5",
            shopId: "shopnumber2",
            jobName: "Painter",
            salary: "40000",
            workingDays: "Everyday",
            workingHours: "11:00am to 5:00pm",
            vacancy: "5"
          )
        ],
      ),
      Shop(
        shopid: "shopnumber3",
        shopName: "Penneys",
        numOfEmployees: "45",
        ownerName: "Kartik Gupta",
        city:"Mumbai",
        shopAddress:
            "Pahado ke uppar, Jungle ke paar, Apna shahar, Apna District,  India",
        shopType: "Dairy",
        shopImageUrl:
            'https://www.independent.ie/irish-news/cc37f/40429349.ece/AUTOCROP/w1240h700/penneys.jpg',
        jobsAvailable: [
          Job(
            jobId: "job6",
            shopId: "shopnumber3",
            jobName: "Delivery Boy",
            salary: "12000",
            workingDays: "Full week excluding sunday",
            workingHours: "12:00am to 5:00pm",
            vacancy: "5"
          ),
          Job(
            jobId: "job6",
            shopId: "shopnumber3",
            jobName: "Delivery Boy",
            salary: "12000",
            workingDays: "Full week excluding sunday",
            workingHours: "12:00am to 5:00pm",
            vacancy: "5"
          ),
        ],
      ),
    ],
  );
}
