//
//  LNAppUser.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNAppUser : NSObject
@property (nonatomic) NSString *appUUID;
@property (nonatomic) NSArray *categories;

+ (instancetype)appUserWithDictionary:(NSDictionary *)dictionary;
@end
