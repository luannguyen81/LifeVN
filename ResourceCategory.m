//
//  ResourceCategory.m
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-18.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "ResourceCategory.h"
#import "ResourceLink.h"


@implementation ResourceCategory

@dynamic name;
@dynamic resourceLinks;

- (void)addResourceLinksObject:(ResourceLink *)value
{
  NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
  [self willChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
  [[self primitiveValueForKey:@"resourceLinks"] addObject:value];
  [self didChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
}
- (void)removeResourceLinksObject:(ResourceLink *)value
{
  NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
  [self willChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
  [[self primitiveValueForKey:@"resourceLinks"] removeObject:value];
  [self didChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
}
- (void)addResourceLinks:(NSSet *)values
{
  [self willChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueUnionSetMutation usingObjects:values];
  [[self primitiveValueForKey:@"resourceLinks"] unionSet:values];
  [self didChangeValueForKey:@"messages" withSetMutation:NSKeyValueUnionSetMutation usingObjects:values];
}
- (void)removeResourceLinks:(NSSet *)values
{
  [self willChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueMinusSetMutation usingObjects:values];
  [[self primitiveValueForKey:@"resourceLinks"] minusSet:values];
  [self didChangeValueForKey:@"resourceLinks" withSetMutation:NSKeyValueMinusSetMutation usingObjects:values];

}

@end
