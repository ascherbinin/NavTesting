//
//  DetailView.h
//  NavigationTests
//
//  Created by Андрей Щербинин on 01.06.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DetailView : UIView
{
    AppDelegate *appDelegate;
}
@property (nonatomic) CGRect mainAppFrame;

@end
