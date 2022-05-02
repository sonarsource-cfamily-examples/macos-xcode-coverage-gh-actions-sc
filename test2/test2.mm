#import <XCTest/XCTest.h>
#include "test2.h"

@interface test2 : XCTestCase

@end

@implementation test2

- (void)testExample {
    XCTAssert(testMyfun2() == 0);
}

@end
