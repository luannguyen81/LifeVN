//
//  AppUser.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-18.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ResourceCategory;

@interface AppUser : NSManagedObject

@property (nonatomic, retain) NSString *appUUID;
@property (nonatomic, retain) NSSet *categories;
@end

@interface AppUser (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(ResourceCategory *)value;
- (void)removeCategoriesObject:(ResourceCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end
