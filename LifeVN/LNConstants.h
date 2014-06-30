//
//  LNConstants.h
//  LifeVN
//
//  Created by Luan Nguyen on 2014-06-17.
//  Copyright (c) 2014 LN. All rights reserved.
//
// MACROS
#define LNColorFloat(x) (x)/255.0f
#define LNColorMake(r, g, b, a) [UIColor colorWithRed:LNColorFloat(r) green:LNColorFloat(g) blue:LNColorFloat(b) alpha:a]

// Colour Palette
#define cLNNavyBlack LNColorMake(8.0f, 23.0f, 35.0f, 1.0f)
#define cLNNavyBlackWithAlpha(a) LNColorMake(8.0f, 23.0f, 35.0f, a)
#define cLNLightGray LNColorMake(220.0f, 225.0f, 230.0f, 1.0f)
#define cLNMidGray LNColorMake(150.0f, 160.0f, 170.0f, 1.0f)
#define cLNMidGrayWithAlpha(a) LNColorMake(150.0f, 160.0f, 170.0f, a)
#define cLNBlueGray LNColorMake(60.0f, 80.0f, 100.0f, 1.0f)
#define cLNDarkGray LNColorMake(90.0f, 100.0f, 110.0f, 1.0f)
#define cLNWhite LNColorMake(255.0f, 255.0f, 255.0f, 1.0f)
#define cLNWhiteWithAlpha(a) LNColorMake(255.0f, 255.0f, 255.0f, a)
#define cLNSelectionBlue LNColorMake(18.0f, 120.0f, 200.0f, 1.0f)
#define cLNSelectionBlueWithAlpha(a) LNColorMake(18.0f, 120.0f, 200.0f, a)
#define cLNLightBlue LNColorMake(160.0f, 201.0f, 233.0f, 1.0f)
#define cLNIceBlue LNColorMake(236.0f, 244.0f, 251.0f, 1.0f)
#define cLNOffWhite LNColorMake(242.0f, 242.0f, 242.0f, 1.0f)
#define cLNNavyBlue LNColorMake(11.0f, 51.0f, 84.0f, 1.0f)
#define cLNDeepRed LNColorMake(190.0f, 30.0f, 45.0f, 1.0f)

// images
#define iAvatar @"avatar.png"
#define iList_icon @"list_icon.png"
#define iTopbarGoBack @"goBack.png"
#define iTopbarGoForward @"goForward.png"
#define iTopbarRefresh @"refresh.png"

// UI constants
#define kTopbarYOffset 20
#define kTopbarHeight 50
#define kDefaultiPadWidth 1024
#define kDefaultiPadHeight 768