//
//  ResourceLink.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-18.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ResourceLink : NSManagedObject

@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * rating;

@end
