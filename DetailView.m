//
//  DetailView.m
//  NavigationTests
//
//  Created by Андрей Щербинин on 01.06.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import "DetailView.h"


@implementation DetailView
@synthesize mainAppFrame;
-(void)awakeFromNib
{
  
    
    NSLog(@"Self Frame %@",NSStringFromCGRect(self.frame));
   
    
    
  
}


-(void) setMainAppFrame:(CGRect)MainAppFrame
{
    mainAppFrame = MainAppFrame;
}

-(void)swipeLeft
{
    NSLog(@"Swipe Left");
}


@end
