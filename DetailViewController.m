//
//  DetailViewController.m
//  NavigationTests
//
//  Created by Андрей Щербинин on 29.05.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer* swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown)];
    UISwipeGestureRecognizer* swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp)];
   
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.videoView addGestureRecognizer:swipeDown];
    [self.videoView addGestureRecognizer:swipeUp];
     [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
}

-(void)swipeDown
{
    NSLog(@"Swipe Down");
    NSLog(@"FRAME DETAIL-%@",NSStringFromCGRect(self.detailView.frame));
    
    CGFloat mpWidth = self.videoView.frame.size.width / 2;
    CGFloat mpHeight = self.videoView.frame.size.height / 2;
    
    CGFloat x = self.view.bounds.size.width-mpWidth - 20;
    CGFloat y = self.view.bounds.size.height-mpHeight - 20;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    
    CGRect smallVideoContainer = CGRectMake(x, y, mpWidth, mpHeight);
   
    

    [UIView animateWithDuration:0.3 animations:^
     {
         self.videoView.frame = smallVideoContainer;
         self.detailView.alpha = 0;
     }];
     [appDelegate.window addSubview:self.videoView];
    [self.navigationController popToRootViewControllerAnimated:YES];

}
-(void)swipeUp
{
    NSLog(@"Swipe UP");
    CGFloat fullWidth = self.view.frame.size.width;
    CGFloat fullHeight = self.videoView.frame.size.height * 2;
    
    CGFloat x = 0;
    CGFloat y = 20;
    
    
    CGRect fullVideoContainer = CGRectMake(x, y, fullWidth, fullHeight);
    [UIView animateWithDuration:0.3 animations:^
     {
          self.videoView.frame = fullVideoContainer;
         self.detailView.alpha = 1.0;
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (IBAction)backButtonAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
