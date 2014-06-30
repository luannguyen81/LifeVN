//
//  LNTopbarView.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "LNTypes.h"

@protocol LNTopbarViewDelegate
@required
- (void)loadWebViewWithURL:(NSURL*)url;
- (void)loadWebViewWithString:(NSString*)searchString;
- (void)goBack;
- (void)goForward;
- (void)refresh;
@end

@interface LNTopbarView : UIView
@property (nonatomic, weak) id<LNTopbarViewDelegate> delegate;
- (id)initWithMode:(LNTopbarViewMode)mode categories:(NSArray*)categories;
@end
