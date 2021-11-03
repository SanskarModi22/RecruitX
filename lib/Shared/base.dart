import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hand/Employee/Auth/login_employee.dart';
import 'package:helping_hand/Employer/Auth/login_employer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:helping_hand/Employee/Auth/employeeBase.dart';
// import 'package:helping_hand/Employer/Auth/employerBase.dart';
import 'package:provider/provider.dart';
import 'package:helping_hand/Model/user.dart';

class Base extends StatefulWidget {
  const Base({key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Text(
                      "Who Are You?",
                      style: GoogleFonts.andada(
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 120.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                child: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        'assets\images\avatar.png')),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(width: 150),
                                  primary: Colors.green,
                                  fixedSize: Size(140, 50),
                                  elevation: 15,
                                ),
                                // onPressed: () async{
                                //   SharedPreferences.setMockInitialValues({});
                                //   final SharedPreferences preferences = await SharedPreferences.getInstance();
                                //   preferences.setString(
                                //       'option','1' );
                                onPressed: () {
                                  Provider.of<UserType>(context, listen: false)
                                      .setUserAsEmployer();

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginEmployer(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Employer',
                                  style: GoogleFonts.scheherazade(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 35,
                                  // backgroundImage: NetworkImage(
                                  //   'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRgWFhUYGBgaGB4cGBocGhgeGBgaHBgcGR4YGBwcIS4lHB4rIRwYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHxISHzcsJSs/ODY0NzY0ND80NDQ0MTQ2NDQxNTQ1NDE2NjQxNDQ1NDExNDQ0NDQ0NDQ0NDQ0NDExNP/AABEIAOAA4AMBIgACEQEDEQH/xAAcAAEBAAIDAQEAAAAAAAAAAAABAAYHAgQFAwj/xABAEAABAgQCBwYEBAUDBAMAAAABAAIREiExA0EEIjJRYYGhBQZCYnGRB8HR8BMUUpIjcoKxwrLS4SRjovEWF1P/xAAZAQEAAwEBAAAAAAAAAAAAAAAAAQIDBAX/xAAqEQEAAgIABQIFBQEAAAAAAAAAAQIDEQQSITFBE2EyUXGBkQUVIiMz8P/aAAwDAQACEQMRAD8A281stSpzZqhTXzUKHOloPWqDk50RAXQwy0KXNgIi/wBUNE1T0QAZAzZXS8TWyQHxMuVuNEuMts96CmpLnZTNW+apaTZ34KbrXy3IItrNldTzNZE8DLlbikiW2e9AtdAQN/qholqVBsRNn9ENdNQ+tEEWTGIsuT3TUCHPloFObLUdUCx0tCuIZKYmyWtmqeimvmoUE4TVHolzoiAv9EOdLQetUlsBNn9UE0y3QG1myupomv0VPWXK3FBP1rZJmpLnZDtW2e9MtJs78EAzVvmgtiZsrpbrXy3KLoGXK3GqBeZqBTXwEDdDhLUdUtZGpv8ARAMbLU+iHNJMQlrpqH1opz5aDqgXOBoLqaQKG6CyWoUGzVPogmtIMTZTxNsqDptX7oomWgQJcCIC6G6u0mWGtz90NE18kBKYxyvyS/W2eapvDyU7VtmgZhCGduaGCXaVL4ufsoGa9IIJzSTEWS8xoEF0NX7qkiWorkgmuAEDdcWAtq6y5Bk1ShrpqH1QcXaxoubnAiAusB76dt/k9O0V7HVLC3SGx2sIvEsw3gnEc07wciVmeNp2Hh4uHhF0H4jXuYDZwZLMAd4DgYbgdyrFomZj5JmsxET83bYYUKGtIMTZTWzVPooOjq/dFZCeJtlJcIQztzQdW2apPFndBN1drlmiUxjlfklutfJU3h5IJ2ts/RIcAIG6HCW2apY63P2QTBLtfVTmkmIsoGahUXS6v3VAuINBdTXAUN0FstRXJQZNUoBoINbcVPBOzbhvSHzUsoulpfNAuIIgLqbTa6oll1vuqgJq2QQBjE26QU+uzzhRU0dXl7JJl4xQURCHi6xQym1yjVMvi5wUNbhBAGMY+HpBdXtPtDCwGHExHhjG3ceNAABVxJsBVdqaGryitYfFrTnNxMDDBoGuxIZTEyNd6gB/7iq2ty12tSvNbT0+83fnC/Lw0XEIxXuDS5zHtcxsCXPE7REwAaNxcFr/APNF5iMVznZuc97nnjMXRXR0HszSdJEzAJBZziQDvlAB/suHaHZWPo9cRkW/rbEtH81AR6kLktebT3dtccVjpH3d89t6ZhHV0jGa3L+I9zfZxIHsvo/vjp5EPzT+QYD7hoK8jA050KGYcfuK5P0kGzGg779FXmtHlPLE+HH8cueH4hdiEuBfM4lz4QiC4xNQIRqvc0XvBj6V2nomK9wm/Ha1rW0axjnSva0fyudEmp9ljjjmVkHwy/Dd2nh/iEghr/whChfKdrdqTkcQFfHubK5NRVvdwjs24UXJxEIC/VBdLS+apYa33VdjhTabXWqADGPh6QTtcIKm8PKPognV2ecKJiIQ8XWKDq8Yql8XOCCbTa5RqogxiLdIKBm4QVNDV5e6BcY7PSimkAQN0ES1uqWbW+6IBgI2rcd6nAk0twSHTUtmmeWl0E6HhvwQ2Hivx3JklrdEs1bZIBsY1txsl3l6Kmm1fuioy0ugTCFNrrFTPNyiiWGtzh6phNwggKx8vSCX+XnBU3h5RVs8YoIQhx6xWqfi9oZdjaNeOI12GD6PZ/vW1ZY15wWOd8uzm42Hh4hiHYOIHNzjHVLTuFWu/pWeX4Jn5NcPxxHzeBouGzBwwKMYxtzQBoFyV18XtfRiIHHw/wBwP/td+QOaWuAIIgQbEHIrwe2cDQ9Ha1ztHaZ8RrAGtEYuz9AASvLpHN9XsW/jHs8PTe6+Hjlz9DxG0OszWkBNdUgRb6QI9F5WF3e0t0QxrHwJBLXsMCDAg1iDyWy9D0HDwgRhtDATEwzNlj7+xtHdjvbgYz8LHYA50pcQJqiManfAHMLWuSWNsUPG0DuRjPcDjva1g8LTFx4WAb61XDu72c7A7TwsIVLcdpaf1MNY/tjHms07MwsdgcMZ7H2kcGwdDObL7unu92Q5/aZ0ktP4eFgCDsnYji9oaDmQ1zid2rvCvivNr6UzUrWm2x2w8V+O5cRGNdnpwTLNW2Spo6vX0XoPLL/Lzgowh5usURl4xVLDW5w9UCzzcoorHy9IK2uEFTeHlFAv8vOChCFdrrFGzxiqWOtzh6IJvm6odGNLcLJjNSyppdW//KBdDw34blNh4r8USy1vkmSatkHFpMda3GynxGzbhvSXzUsoOlpfNAuAhS/C6m+bqgNl1vuqoTVsgImNdnpBL6bPOCZo6vL2Vs8YoKkPN1ihldrlFUvi5pOtwgg4kmPl6QXm95IfgOh+psf3BepNCnJeV3ibLgO4ub/qWWb/ADn6S1w/6R9YYwXhrS4mAAJJ3ACJXDS9DZiSztDpHhzY5ObZw4pxMOZhbvBHusjx+yWOAdhvgCIiOyfQ7+C83FjtaN17w9bLlrSYi3aXhro6N2YxmNi4wBnxZZq0oICAyXvO7FxcgD6EfVffR+wnnaIA9yrxhy9tM5z4u+3jOssh7sN/hGNi9x4WA+SxjR8MsY1hMZWgR3wEFlfd4fwGjMlx/wDIq3Cx/b9IU4yf6vu9J3ltw3rkYQpfqgOlpfNUsNb7qvSeWmV2uqgTHy9IKIm4QVNHV5eyCf5ecEwEPN1igat6xVL4uaCZXa5RRExps9IJ2uEFTQ1eXugX8L8FNhCt+N0QlrdUs2t90QDCfFbjvS6PhtwUXTUtmoPlpdAuaBUX90NAO1f2U1ktShzZqj0qgWkkwNlOMNn6pLptX7ohploeiBLRCIv95KbXa5ZIDYa2V+NVOE1st6BiYwy+Xqh1NnnmmakuduC4l0l87Q4IORhCJvfmvM7RxA9spERHNdsYZcSTbP8A4XX7SIlaAIVPySYjsb08l3Z7TsmXqF8ziYujtc+YBgEXEkSgZl0beq9DDXl989Hn0HHbNLBk8YRjI4PDYRG0Whsco5rC+CvxV6T7OmnEW+G3WPdywu+mHb8TAPo9or6RK7ONp+PiiAbAG8ARHgXFaKwsMvc1ggC4hoJNAXGETS1V+hcJkrWt/S0D2EFnStrxMTM6aXtTHqYrG3jDst52iG9Su92Z21ow/gNxmtxGGQtdqkuBrLGhzsu2VhD2aN2nOGQw9JYXCvja10ocYbTTSt2x3X0rhrj617orf1txkmdR8vDZLIERP2ENcSYGy0l+Y0nRXnDD8TDc2haHGXgQNkg74L0sHvtprRA4jX/zMb/iArerHmG0/pt+9JiYbcdTZ+qS0Qjn81qvD+IGlDw4B/of/vXL/wCwdKjGTB/a/wD3KfVqp+3Z/wDpbRbXa5ZKiYwy+XqtWP8AiBpZywP2O/3rlh/ELShRzMFw4NeD7zFPVqft2f2/LaLqW55pAEIm6xPu13zw9Id+G5hw8Q7IjFroVg00geB91lRbEzZX40V4tExuHJkxWxzy2jUlpjtfRTiQYCynGag6pa6GrmpZpwA2b+6mgGpuhrZan0opzJqhANdMYGyXOloEudNQIa6Wh9UC5oAiLqaJrriGQMTZLhNUIIOJMMlP1bJJiJc7eymat80EYATZwivNOKXmJ5cF2NPaZSciR1K6eCpHpscaDKnVdPtZgEkOPyXcwsQFsudl0O02ES8/koHXw14/e/TMFmAG45eMN7gw/hwnJGuITUl1THkvYw1r/wCJ2mNOJg4J8LHPPAvdK3/Q73Weaf4S1wxu8PB03A0Mtc/BdiziJYHAQJBpNSnGq2/oGPPhMf8AqY09FoYtLDSo+7rcfcnSZ9Dwz+kFvt/7WHC9Nxvbfio3ES9jHxJWud+lpPsIrQ2g6W/DezFY6V7TMDxzjvBqCMwSt1d5saTRNIdmMJ8PUtIHUrR62yz1hrwVf42bd7X0JvaOiYePhgNxSyZkd/iwnHdEERyIjvjq/wDNQJDmkEGBGYIoQQbFbc7n6M7C0HAa6IJYXQNxO9zwPZwWv/iB2eMPSZ2iDcVs/wDWDK//ABPq4qL03HM04XiLVvOOJ6ddPFGlN4+yRpLd/QroKWXK9D1rPTY8GxBXNeSu1o+k5O5H6qJhrXLE9Jd7AxSx7XtuxwcPVpBH9lvsOMYC31WiNAwZ8XDYPE9rf3OA+a3yHACGdlth8vL/AFTW6/cPEtQlrQRE3Q0S1KHNiZhZbPJLXTUKHOLTAWXJzpqD1U10tCgnNlqENbNU+iGtLTE2S5s1QgA+JgbJcZaBLnAiAuphlugi2AmzupomvkuIaQY5JfrWQfHSgXNLRy5VXQwF601IZ25rz9KYMMFzqNAJJyAFSUHT7S7WGAWCWZzowbGEA27iYWBgOMV18LtN2OSXBolsBGx3x9Fj+NpBxXuxXCE1Gg+Fg2W+tSTxJXLCxCwhwv8AdCvNtxc+r7PTrwcTi92UYaxzvr3Z/Ms/Ewx/HwxT/uNFZDxvA8YZ09zQtLY8Ahwjm2IiD6LvsC9CYravtLz4maW94aJ7K0V+K/8ADa07nRB1KwgRvjSF4rcPdvsj8tghld5F4E1961XfZ2dhNecRrGte4kuIAEzjSY73UuvtiPABJIAFybBVpjim5XyZbZNR4Y539e4aFiBoJLixsACTCdpdbygrBO5Xdw6Vih7h/AYYvP63Cowx8+HqFnnavaAfBrRqgxjmTAigyFU92seTEfh5Ygmb/O2DXe7ZD/SVzxnrbNyx2dla3xYJnXVkOKVrT4mvE+AMw15PoSwD+x9lsbScQNaXOIDQCSTQACpJK0r3k7V/M6Q/EEZNlgN5GxgSN5JJ58F05J6aYcHWZyc3iHlqUgrB6z0uxOxcfS3yYDZiKucTBjAc3uy9BEmBgKFbD7M+GWC0j8fEdiOza3UZ0i4+sR6LIe5fZTcDQ8FoGs9gfiHMueA6u+Ag0cGhZBMIQztzW1aRrq8rNxV5tMVnUMIwe6Ywe0MJ+G0jADXOAiSGOADZYmtS4OEdztyzaWIjnf2UzVuiUkxyV4iI7OfJltk1zeI0WmahQXQMosl5mslrgBA3Us05stR6Ka2apXFrZamynNLjEWQLXTUKnOloPWqXEEQbf2U0gbV/dBFsut91Q0TVPRTQQYmynCOz9EAHR1creyXGW2e9JIhAXQ2m1yzQMtJs78EN1r5fNUDGOXy9FPrs88kHj9odiMedXVdG4sfVv0gsW7a0d2jNJeL0aRVrjuH/ADuWwgRCGfz9V5vbXZbdIwnYeISIwLXCpa4WIHuDwJXPfhsdp3rTopxOSsa3tp1xiSTUkxJ4r64WlPZsPe3+Vzh/Yr79rdnP0fFdhvIJECHCMHNIiHCP3EFdJdDnenhd4NJbbHf/AFEO/wBQK7eH3jxsQtZiOa5pcKygEGwMWw3rwVKt6xas1nytS01tEx4Zgu3onZ+M5zX4bTFjg5pOq05ERORaXCm9ex3V7P8A+nw8R4D3vE0YDVBAlaOUCTvJWROgRAXXDi4KazFpn8O3LxsWia1j8tM9+O8uJivdo4a7Cw2Og9rqPeR+oCzbEAXodyw9bt7391GaYyajNIaNR+Th+h8LtjGBu2+8HS+k6M/De5j2lj2GVzTcH7rGxBBXTeJ31dHC3pauo6a7w+a7fZHZztIx8PAbGL3hpI8LbudyaHHkuoBkKk0AFyTYAZlbf+HndY6Mw42KIY+I2AbnhsvKfMaE7oAb4xWu5Xz5Yx09/DNGgMAAtCAG4CgXKWk2d+CG02uWaoGMcvl6LoeKm618tyi6Grlb3S6uzzyUCIQN/vNBOEtR1UGzVQ0Q2vqpwJMRZBNdNQ+tFOdLQJcQdm/sppAoboAslrdQbNW2SmA+K3FD4nZtw3oEOm1fuioy0ulxEKX4XQ3zdUFLDW5+6trhBAjGuz0guT/LzggJvDyUdXjFMRDzdYoZTa5RQUvi5w9FAzcIKIMfL0gp3l6IMO+IfZ0zGYzRXDMrzvY40J9HH/yK874fhjzjYb2MeINc0Oa11iWuuOLVnml6O3Ew3YbvG0tO+oh72Wt+5rjg6cGOoTPhu3RET/dnVBno7vaKdb8vhDhI2HtBat7waOGaTjMaA0B5IAoAHawAGQgQtxOBjq24WWr+/uEG6Y4iz2Md0k/wQbB7BdLo2AP+yw+7AvQLJaro93yPy2BH/wDJl90jV3WxjrW42QIE1bZLG+8ndDA01wc4uZiNEJ2SxcBGDXBwIcBlmFkjuFuCTCFL9VExE91q2ms7rPVjPYXcvRtEcHtDsTEFn4kCW/ygANaeMI8Vk0mfNTaX5RXERj5ekEiIjsWta07tOyNbhBU3h5Jf5ecFREPN1ipVGzximWOtz9lM83KK4mMabPSCBjNSyppdX7ql3l6KaRCt+N0AWy1vkkNmrZDI+K3Hep4PhtwQM81LImlpfNLoeG/BTYeK/HcgJZdb7qqE1bIbGNbcbJd5eiCmjq8o+itnjFJhCm11ipnm5RQEvi5wVtcIfNVY+XpBL/LzggJvDyj6qhLxikQh5usVM83KKAljrdPRa17xEYPaQxLAvw3n0oHe8rvdbKdGNLdOK198SsADEwniGsxzTDyOB/zQbBmlpCKwD4k6NLiYL/1Mc39rgf8ANZp2PpAxMDCe6EXYbSY75RHrFYz8RsInBw3GOriS/uYT/iEHud1jPomAY2YG/ti35L1p5qWWM9wsYu0RoEdR72+5n/yWTOhDVvwugJpaXzVLDW6eqWw8V+KGxjW3RBQm4QVN4eUUv8vOCjCHm6xQGzxiqXxc4JZ5uUUVj5ekEFGbhBU0NXlH1S/y84KEIV2usUBCWt1Sza33RTfN1Q6MaW4WQM01LZpnlpdToeG/DcpsPFfigpJa3QWzVtkhpJNbcUviNm3BBTTav3RQMtLpcABEXU2u11QEsNbn7qIm4QQCYwNuiXU2ecKoKbw8oqGrximAhHxdYoZXa5RogpfFzh6KjNS0F88TSGtMC4AfJY53s71s0TBmwwH4jnSsaYwjAkudnAAWzoKXUTMRG5TETM6hk80KfdViPxG0X/p2OvLiQ5Oa75hqwLG+IunOB18NpObcMRHpMT1ise7Q7Vx8cxxsZ+IfM4lo/lbst5ALKc8eG0YJ8y3V3ExJ9EYI1w3OZ1nHRwXPvu2fQ8SmyWu9ngHoSsC+Gvbg0duO10xDixzYZGDgb/0+y97vj3nY/Q8ZjWua54a2Mci9sekVpFt15mc01bldv4baRDDxmbntd+5sv+CzMMlrdfmzA0l7HTMe9jv1Mc5rvdpisj0Xv9pzGy/jNeMi9jXOHMQJ5xWUZ48w1nh58S3hLNW2Spo6v3Ra+7nd/XY7jhaQ1rXSzMcwEB0DAtc0kwNQYg1rQQrm7O0sJ2y6q2iYtG4Y2rNZ1LtbPGKpfFzgjCxGuuQdyYmMMukFKqOtwgqbw8oqdTZ5wqmAhHxdYoACXjFUsdbn7KbXa5RookxgLdIIImallTS6v3VLqbPSqmgERN0AGy1vkosmrZTSTtW40Q8kbNuCDkXzUCg6Wh9VOaBUXUwRqboANl1vuqiJqhTXEmBsp5l2fqgZo6vL2Q0y3zSWgCIuhom2kFL4uaiZrdUTGMMrcku1dnPmg62LojHUIMeFl52m928J8JgDui0Oh6RsvbDRCOd+aG6219EGKv7kYJERKP6AvgO47DZzObB9FmDnEGAsuThLZNJ3LDP/AIZKYB7B6Nh/YJxO5roaz2kekVmTWgiJuuLSXUNkRthrO4wPiZ+wfRcsPuQwmEWfsH0WYOJbQWXJzQBEXTSdyxfB7n4THA0jvDRHdderhdhsYIxJXptE10NcSYGyIfHB0Vo2R7r7zx1eSHauyktEI535oBurfNUvi5qbrbXJExjDK3JAkzWyTNDV5e6HauykNBETdAAS1Ki2bW+6KYZtpTnEGAsgS6ag9VB8tCpwAqLqa0ERN0A1ktT0U5s1R6VQ10xgUvdLQeqBc6IgL/RDTLQ9EubARF1ME1Sg4hkDNlfjVLhNbLegOiZcrJeZbIGakuduCG6t89yZaTZ3QzWvkgJKzZX4pJmtlvUXVlysp4lsgQ6Alz+qGtlqfSiWtiIm/wBFxYZqH1QLmTVCXOmoOq4ufKYCy5PbLUIIOloei4tbLU2XJjZqlcWOLjA2QLmzVHpVJdES59KIcZaBLmwERf6oAGW+e5QZWbK/FLRNdAdWXKyCdrWy3pmpLnbgh+rbNMtJs7oBolvnuUWxM2V+NFM1r5ILoGXKyDk4zUHVTXQEDf6qcJbKa2IiboBrZan0opzJqjqpjpqH1U50tAg//9k=',
                                  // ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  side: BorderSide(width: 150),
                                  primary: Colors.green,
                                  fixedSize: Size(140, 50),
                                ),
                                // onPressed: () async{
                                //   SharedPreferences.setMockInitialValues({});
                                //   final SharedPreferences preferences = await SharedPreferences.getInstance();
                                //   preferences.setString(
                                //       'option','2' );
                                onPressed: () {
                                  Provider.of<UserType>(context, listen: false)
                                      .setUserAsEmployee();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginEmp(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Employee',
                                  style: GoogleFonts.scheherazade(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      /* children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(40, 45)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.greenAccent)),
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => EmployerBase(),
                              ),
                            )
                          },
                          child: Text(
                            "Employer",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 19.0),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(40, 45)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.greenAccent)),
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EmployeeBase()),
                            )
                          },
                          child: Text(
                            "Employee",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 19.0),
                          ),
                        ),
                      ],*/
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
