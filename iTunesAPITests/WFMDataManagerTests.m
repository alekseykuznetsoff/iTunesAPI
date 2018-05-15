//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.

#import <XCTest/XCTest.h>
#import "WFMDataManager.h"

@interface WFMDataManager ()

- (id)objectFromStoreByKey:(NSString *)key;
- (void)saveToStoreObject:(id)object forKey:(NSString *)key;

@end

@interface WFMDataManagerTests : XCTestCase

@property (nonatomic, strong) WFMDataManager *dataManager;

@end

@implementation WFMDataManagerTests

- (void)setUp
{
    [super setUp];
    self.dataManager = [WFMDataManager sharedInstance];
}

- (void)tearDown
{
    self.dataManager = nil;
    [super tearDown];
}

- (void)testInitialization
{
    XCTAssertNotNil(self.dataManager);
    XCTAssertTrue([self.dataManager isKindOfClass:[WFMDataManager class]]);

    WFMDataManager *manager = [WFMDataManager sharedInstance];
    XCTAssertEqual(self.dataManager, manager);
}

- (void)testListDataArray
{
    NSArray *array = [self.dataManager listDataArray];
    XCTAssertNotNil(array);

    if (array.count > 0) {
        for (id model in array) {
            XCTAssertTrue([model isKindOfClass:[NSDictionary class]]);
        }
    }
}

- (void)testDeleteAllSavedData
{
    NSString *key = @"key";
    NSString *string = @"string";
    NSArray *array = @[@{key : string}];
    [self.dataManager saveToStoreObject:array forKey:kWFMStoreListDataArrayKey];
    NSArray *savedArray = [self.dataManager listDataArray];
    XCTAssertTrue(savedArray.count == 1);
    XCTAssertTrue([savedArray.firstObject isKindOfClass:[NSDictionary class]]);
    NSString *savedString = savedArray.firstObject[key];
    XCTAssertTrue([string isEqualToString:savedString]);

    [self.dataManager deleteAllSavedData];
    savedArray = [self.dataManager listDataArray];
    XCTAssertTrue(savedArray.count == 0);
}


@end
