//
//  LNResourceLink.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNResourceLink : NSObject
+ (instancetype)resourceLinkWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) NSInteger rating;
@property (nonatomic) NSURL *resourceURL;
- (UIImage*)resourceThumbnailImage;
@end
