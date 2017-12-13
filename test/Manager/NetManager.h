//
//  NetManager.h
//  test
//
//  Created by Victor 
//  Copyright © 2017 Victor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : NSObject

+ (instancetype)sharedInstance;
- (void) loadRequestWithPath:(NSString *)path completion:(void (^)(id data, NSError *error))completion;

@end
