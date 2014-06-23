//
//  ResourceCategory.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-18.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ResourceLink;

@interface ResourceCategory : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSSet *resourceLinks;
@end

@interface ResourceCategory (CoreDataGeneratedAccessors)

- (void)addResourceLinksObject:(ResourceLink *)value;
- (void)removeResourceLinksObject:(ResourceLink *)value;
- (void)addResourceLinks:(NSSet *)values;
- (void)removeResourceLinks:(NSSet *)values;

@end
