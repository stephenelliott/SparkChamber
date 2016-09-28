/**
 *  SparkCollectionViewCellTests.m
 *  SparkKitTests
 *
 *  Created by Steve Elliott on 05/04/2016.
 *  Copyright (c) 2016 eBay Software Foundation.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 **/

#import <XCTest/XCTest.h>

#import "SparkCollectionViewCell.h"
#import "SparkKitTests-Swift.h"
@import SparkChamber;


@interface SparkCollectionViewCellTests : XCTestCase

@end


@implementation SparkCollectionViewCellTests

- (void)testSparkCollectionViewCellTouchesEnded
{
	PointInsideSparkCollectionViewCellMock *cell = [[PointInsideSparkCollectionViewCellMock alloc] init];
	
	XCTestExpectation *expectation = [self expectationWithDescription:@"A SparkCollectionViewCell's touch event action failed to execute."];
	__block SparkEvent *event = [[SparkEvent alloc] initWithTrigger:SparkTriggerTypeDidEndTouch
															  trace:@"collection view cell touched"
															 action:^(NSDate * _Nonnull timestamp)
								 {
									 [expectation fulfill];
								 }];
	cell.sparkEvents = @[event];
	
	UITouchMock *touch = [[UITouchMock alloc] init];
	touch.view = cell;
	NSSet *fakeTouches = [NSSet setWithArray:@[touch]];
	
	[cell touchesEnded:fakeTouches withEvent:nil];
	
	[self waitForExpectationsWithTimeout:3.0 handler:nil];
}

@end
