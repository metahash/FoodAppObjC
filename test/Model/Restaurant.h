//
//  Restaurant.h
//  test
//
//  Copyright © 2017 Victor. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Restaurant : MTLModel <MTLJSONSerializing>

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *imageURL;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *phone;

@end
