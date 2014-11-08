AQSFacebookActivity
==================

![](http://img.shields.io/cocoapods/v/AQSFacebookActivity.svg?style=flat) [![Build Status](https://travis-ci.org/AquaSupport/AQSFacebookActivity.svg?branch=master)](https://travis-ci.org/AquaSupport/AQSFacebookActivity)

[iOS] UIActivity subclass for Facebook.

Usage
---

```objc
UIActivity *facebookActivity = [[AQSFacebookActivity alloc] init];

UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:facebookActivity];
activityViewController.excludedActivityTypes = @[UIActivityTypePostToFacebook];

[self presentViewController:activityViewController animated:YES completion:NULL];
```

Installation
---

```
pod "AQSFacebookActivity"
```

Related Projects
---

- [AQSShareService](https://github.com/AquaSupport/AQSShareService) - UX-improved sharing feature in few line. 
