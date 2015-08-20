# FlytPath - Drone Tips -  Sample App

![FlytPath Menu](http://erikbye.me/dev/flytpath4.png)
![FlytPath Content](http://erikbye.me/dev/flytpath5.png)
![FlytPath Side Menu](http://erikbye.me/dev/flytpath6.png)

FlytPath provides tips and videos on how to better opperate your drone.


##Technical Details:
The menu is remotely provided by an [amazon S3 hosted JSON file](https://s3.amazonaws.com/flytpath-1/menu.json) and renderd nativly while the internal pages are responsive .HTML files [located in the same S3 bucket](https://s3.amazonaws.com/flytpath-1/Phantom/index.html)

Written in Objective-C


