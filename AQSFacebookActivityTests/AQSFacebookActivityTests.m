//
//  AQSFacebookActivityTests.m
//  AQSFacebookActivityTests
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock.h>
#import <Social/Social.h>

#import "AQSFacebookActivity.h"

@interface AQSFacebookActivity (Test)

- (UIViewController *)activityViewControllerWithComposeViewController:(SLComposeViewController *)composeViewController;

@end

@interface AQSFacebookActivityTests : XCTestCase

@property AQSFacebookActivity *activity;

@end

@implementation AQSFacebookActivityTests

- (void)setUp {
    [super setUp];
    
    _activity = [[AQSFacebookActivity alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItsActivityCategoryIsShare {
    XCTAssertTrue(AQSFacebookActivity.activityCategory == UIActivityCategoryShare);
}

- (void)testItReturnsItsImage {
    XCTAssertNotNil(_activity.activityImage);
}

- (void)testItReturnsItsType {
    XCTAssertTrue([_activity.activityType isEqualToString:@"org.openaquamarine.facebook"]);
}

- (void)testItReturnsItsTitle {
    XCTAssertTrue([_activity.activityTitle isEqualToString:@"Facebook"]);
}

- (void)testItAlwaysAbleToPerformActivity {
    NSArray *activityItems = @[@"hoge", [NSURL URLWithString:@"http://google.com/"]];
    XCTAssertTrue([_activity canPerformWithActivityItems:activityItems]);
}

- (void)testItSetFirstStringAsInitialStringToComposeViewController {
    NSString *aString = @"somestr";
    NSString *bString = @"hoge";
    NSArray *items = @[aString, bString];
    
    id controllerMock = [OCMockObject niceMockForClass:[SLComposeViewController class]];
    [[controllerMock expect] setInitialText:aString];
    
    [_activity prepareWithActivityItems:items];
    [_activity activityViewControllerWithComposeViewController:controllerMock];
    
    [controllerMock verify];
}

- (void)testItAddsURLsToComposeViewController {
    NSURL *aURL = [NSURL URLWithString:@"http://google.com/"];
    NSURL *bURL = [NSURL URLWithString:@"http://yahoo.com/"];
    NSArray *items = @[aURL, bURL];
    
    id controllerMock = [OCMockObject niceMockForClass:[SLComposeViewController class]];
    [[controllerMock expect] addURL:aURL];
    [[controllerMock expect] addURL:bURL];
    
    [_activity prepareWithActivityItems:items];
    [_activity activityViewControllerWithComposeViewController:controllerMock];
    
    [controllerMock verify];
}

- (void)testItAddsImagesToComposeViewController {
    UIImage *aImage = [UIImage imageNamed:@"AQSFacebookActivity"];
    UIImage *bImage = [UIImage imageNamed:@"AQSFacebookActivity"];
    NSArray *items = @[aImage, bImage];
    
    id controllerMock = [OCMockObject niceMockForClass:[SLComposeViewController class]];
    [[controllerMock expect] addImage:aImage];
    [[controllerMock expect] addImage:bImage];
    
    [_activity prepareWithActivityItems:items];
    [_activity activityViewControllerWithComposeViewController:controllerMock];
    
    [controllerMock verify];
}

@end
