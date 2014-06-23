//
//  LNCategory.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNCategory : NSObject

+ (instancetype)categoryWithDictionary:(NSDictionary *)dictionary;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSArray *resourceLinks;

@end
