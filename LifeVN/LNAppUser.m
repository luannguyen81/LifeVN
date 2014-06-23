//
//  LNAppUser.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "LNAppUser.h"
#import "LNCategory.h"

@implementation LNAppUser
+ (instancetype)appUserWithDictionary:(NSDictionary *)dictionary
{
  LNAppUser *user = [[self alloc] init];
  user.appUUID = [dictionary objectForKey:@"appUUID"];
  
  NSArray *categories = [dictionary objectForKey:@"categories"];
  NSMutableArray *tempCat = [NSMutableArray array];
  
  for (NSDictionary *catDic in categories) {
    LNCategory *cat = [LNCategory categoryWithDictionary:catDic];
    [tempCat addObject:cat];
  }
  
  user.categories = tempCat;
  return user;
}

@end
