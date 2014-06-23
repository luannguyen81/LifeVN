//
//  AppUser.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-18.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "AppUser.h"
#import "ResourceCategory.h"


@implementation AppUser

@dynamic appUUID;
@dynamic categories;

- (void)addCategoriesObject:(ResourceCategory *)value
{
  NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
  [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
  [[self primitiveValueForKey:@"categories"] addObject:value];
  [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];

}
- (void)removeCategoriesObject:(ResourceCategory *)value
{
  NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
  [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
  [[self primitiveValueForKey:@"categories"] removeObject:value];
  [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];

}
- (void)addCategories:(NSSet *)values
{
  [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:values];
  [[self primitiveValueForKey:@"categories"] unionSet:values];
  [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueUnionSetMutation usingObjects:values];

}
- (void)removeCategories:(NSSet *)values
{
  [self willChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:values];
  [[self primitiveValueForKey:@"categories"] minusSet:values];
  [self didChangeValueForKey:@"categories" withSetMutation:NSKeyValueMinusSetMutation usingObjects:values];
}

@end
