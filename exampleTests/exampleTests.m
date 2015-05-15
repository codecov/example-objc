//
//  exampleTests.m
//  exampleTests
//
//  Created by Ryan Copley on 5/15/15.
//  Copyright (c) 2015 Codecov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MyAwesomeClass.h"

@interface exampleTests : XCTestCase

@end

@implementation exampleTests

- (void)testExample {
    XCTAssert([MyAwesomeClass myAwesomeMethod:YES] == 1, @"Pass");
}


@end
