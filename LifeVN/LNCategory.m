//
//  LNCategory.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "LNCategory.h"
#import "LNResourceLink.h"

@implementation LNCategory

+ (instancetype)categoryWithDictionary:(NSDictionary *)dictionary
{
  LNCategory *category = [[self alloc] init];
  category.name = [dictionary objectForKey:@"name"];
  
  NSArray *resourceLinks = [dictionary objectForKey:@"resourceLinks"];
  NSMutableArray *links = [NSMutableArray array];
  
  for (NSDictionary *resourceDic in resourceLinks) {
    LNResourceLink *link = [LNResourceLink resourceLinkWithDictionary:resourceDic];
    [links addObject:link];
  }
  
  category.resourceLinks = links;
  return category;
}
@end
