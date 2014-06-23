//
//  LNResourceLink.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "LNResourceLink.h"
@interface LNResourceLink()
@property (nonatomic) NSURL *thumbnailURL;
@property (nonatomic) NSURL *resourceURL;
@property (nonatomic) NSString *title;

@end
@implementation LNResourceLink
+ (instancetype)resourceLinkWithDictionary:(NSDictionary *)dictionary
{
  LNResourceLink *link = [[self alloc] init];
  link.title = [dictionary objectForKey:@"title"];
  link.resourceURL = [NSURL URLWithString:[dictionary objectForKey:@"link"]];
  link.thumbnailURL = [NSURL URLWithString:[dictionary objectForKey:@"thumbnail"]];
  link.rating = [[dictionary objectForKey:@"rating"] integerValue];
  return link;
}

- (UIImage*)resourceThumbnailImage
{
  return [UIImage imageWithData:[NSData dataWithContentsOfURL:self.thumbnailURL]];
}
@end
