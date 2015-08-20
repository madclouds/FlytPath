# FlytPath - Drone Tips -  Sample App

![FlytPath Menu](http://erikbye.me/dev/flytpath1.png =200px)
![FlytPath Content](http://erikbye.me/dev/flytpath2.png =200px)
![FlytPath Side Menu](http://erikbye.me/dev/flytpath3.png =200px)

FlytPath provides tips and videos on how to better opperate your drone.


##Technical Details:
The menu is remotely provided by an [amazon S3 hosted JSON file](https://s3.amazonaws.com/flytpath-1/menu.json) and renderd nativly while the internal pages are responsive .HTML files [located in the same S3 bucket](https://s3.amazonaws.com/flytpath-1/Phantom/index.html)


