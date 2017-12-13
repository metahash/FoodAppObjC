//
//  Restaurant.m
//  test
//
//  Copyright © 2017 Victor. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"name":@"name",
              @"imageURL":@"logo",
              @"address":@"address",
              @"phone":@"phone"
              };
}

@end
