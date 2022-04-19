#import <XCTest/XCTest.h>

@import Foundation;
@import RollbarCommon;

#import "Mocks/Person.h"

@interface RollbarPredicateBuilderTests : XCTestCase

@end

@implementation RollbarPredicateBuilderTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testBuildStringPredicateWithValue {
    
    Person *person = [[Person alloc] initWithFirstName:@"First"
                                              lastName:@"Last"
                                                   age:@100];
    
    NSPredicate *predicate = [RollbarPredicateBuilder buildStringPredicateWithValue:@"First"
                                                                        forProperty:@"firstName"];
    XCTAssertTrue([predicate evaluateWithObject:person]);
    
    predicate = [RollbarPredicateBuilder buildStringPredicateWithValue:@"First"
                                                           forProperty:@"lastName"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildStringPredicateWithValue:@"LAST"
                                                           forProperty:@"lastName"];
    XCTAssertFalse([predicate evaluateWithObject:person]);
}

- (void)testBuildStringPredicateWithValueList {
    
    Person *person = [[Person alloc] initWithFirstName:@"First"
                                              lastName:@"Last"
                                                   age:@100];
    NSPredicate *predicate = [RollbarPredicateBuilder buildStringPredicateWithValueList:@[@"First", @"Last"]
                                                                            forProperty:@"firstName"];
    XCTAssertTrue([predicate evaluateWithObject:person]);
    
    person = [[Person alloc] initWithFirstName:@"NotInList"
                                      lastName:@"Last"
                                           age:@100];
    XCTAssertFalse([predicate evaluateWithObject:person]);
}

- (void)testBuildLessThanDatePredicateWithValue {
    
    NSDate *date = [NSDate date];
    
    Person *person  = [[Person alloc] initWithFirstName:@"First"
                                               lastName:@"Last"
                                              birthDate:date];
    NSPredicate *predicate =
    [RollbarPredicateBuilder buildLessThanDatePredicateWithValue:date
                                                     forProperty:@"birthDate"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildLessThanDatePredicateWithValue:[date dateByAddingTimeInterval:1.0]
                                                     forProperty:@"birthDate"];
    XCTAssertTrue([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildLessThanDatePredicateWithValue:[date dateByAddingTimeInterval:-1.0]
                                                     forProperty:@"birthDate"];
    XCTAssertFalse([predicate evaluateWithObject:person]);
}

- (void)testBuildTimeIntervalPredicate {
    
    NSDate *date = [NSDate date];
    
    Person *person  = [[Person alloc] initWithFirstName:@"First"
                                               lastName:@"Last"
                                              birthDate:date];
    NSPredicate *predicate =
    [RollbarPredicateBuilder buildTimeIntervalPredicateStartingAt:date
                                                      inclusively:NO
                                                         endingAt:date
                                                      inclusively:NO
                                                      forProperty:@"birthDate"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildTimeIntervalPredicateStartingAt:date
                                                      inclusively:YES
                                                         endingAt:date
                                                      inclusively:YES
                                                      forProperty:@"birthDate"];
    XCTAssertTrue([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildTimeIntervalPredicateStartingAt:[date dateByAddingTimeInterval:-1.0]
                                                      inclusively:YES
                                                         endingAt:[date dateByAddingTimeInterval:1.0]
                                                      inclusively:YES
                                                      forProperty:@"birthDate"];
    XCTAssertTrue([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildTimeIntervalPredicateStartingAt:[date dateByAddingTimeInterval:1.0]
                                                      inclusively:YES
                                                         endingAt:[date dateByAddingTimeInterval:1.0]
                                                      inclusively:YES
                                                      forProperty:@"birthDate"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildTimeIntervalPredicateStartingAt:[date dateByAddingTimeInterval:1.0]
                                                      inclusively:YES
                                                         endingAt:[date dateByAddingTimeInterval:-1.0]
                                                      inclusively:YES
                                                      forProperty:@"birthDate"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate =
    [RollbarPredicateBuilder buildTimeIntervalPredicateStartingAt:[date dateByAddingTimeInterval:1.0]
                                                      inclusively:NO
                                                         endingAt:[date dateByAddingTimeInterval:-1.0]
                                                      inclusively:NO
                                                      forProperty:@"birthDate"];
    XCTAssertFalse([predicate evaluateWithObject:person]);
}

- (void)testBuildNumberPredicateWithValue {

    Person *person  = [[Person alloc] initWithFirstName:@"First"
                                               lastName:@"Last"
                                                    ssn:@5];

    NSPredicate *predicate = [RollbarPredicateBuilder buildNumberPredicateWithValue:[NSNumber numberWithInt:5]
                                                                        forProperty:@"ssn"];
    XCTAssertTrue([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildNumberPredicateWithValue:[NSNumber numberWithInt:6]
                                                           forProperty:@"ssn"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildNumberPredicateWithValue:[NSNumber numberWithInt:5]
                                                           forProperty:@"age"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildNumberPredicateWithValue:@6
                                                           forProperty:@"ssn"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildNumberPredicateWithValue:@5
                                                           forProperty:@"ssn"];
    XCTAssertTrue([predicate evaluateWithObject:person]);
}

- (void)testBuildIntegerPredicateWithValue {
    
    Person *person  = [[Person alloc] initWithFirstName:@"First"
                                               lastName:@"Last"
                                                    age:5];

    NSPredicate *predicate = [RollbarPredicateBuilder buildIntegerPredicateWithValue:5
                                                                        forProperty:@"age"];
    XCTAssertTrue([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildIntegerPredicateWithValue:6
                                                            forProperty:@"age"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildIntegerPredicateWithValue:5
                                                            forProperty:@"ssn"];
    XCTAssertFalse([predicate evaluateWithObject:person]);

    predicate = [RollbarPredicateBuilder buildIntegerPredicateWithValue:5
                                                            forProperty:@"age"];
    XCTAssertTrue([predicate evaluateWithObject:person]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
