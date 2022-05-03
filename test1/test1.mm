#import <XCTest/XCTest.h>
#include "test1.h"

@interface test1 : XCTestCase

@end

@implementation test1

- (void)testExample {
    XCTAssert(testMyfun1() == 0);
}

@end
