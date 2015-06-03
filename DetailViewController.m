//
//  DetailViewController.m
//  NavigationTests
//
//  Created by Андрей Щербинин on 29.05.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(backButtonAction:)];
        [self.navigationItem setLeftBarButtonItem:leftBarButtonItem];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown)];
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp)];
    //UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
   // swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.videoView addGestureRecognizer:swipeDown];
    [self.videoView addGestureRecognizer:swipeUp];
   // [self.videoView addGestureRecognizer:swipeLeft];
    
    NSLog(@"NameViewController: %@", self.description);
    
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)swipeDown
{
    NSLog(@"Before: %@", [[self navigationController] viewControllers]);
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window addSubview:self.videoView];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self minimizeMp:YES animated:YES];
     NSLog(@"After: %@", [[self navigationController] viewControllers]);
}
-(void)swipeUp
{
    [self minimizeMp:NO animated:YES];
}

- (void)minimizeMp:(BOOL)minimized animated:(BOOL)animated
{
    CGRect tallContainerFrame, YouTubeVideoFrame;
    CGFloat tallContainerAlpha;
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if (minimized)
        {
            CGFloat mpWidth = self.videoView.frame.size.width / 2;
            CGFloat mpHeight = self.videoView.frame.size.height / 2;
            CGFloat x = self.view.bounds.size.width-mpWidth;
            CGFloat y = self.view.bounds.size.height-mpHeight;
            tallContainerFrame = CGRectMake(self.view.frame.size.width, self.view.frame.size.height, 0, self.view.frame.size.height);
            YouTubeVideoFrame = CGRectMake(x-10, y-10, mpWidth, mpHeight);
            tallContainerAlpha = 0;
            self.videoView.alpha = 1;
            [[self navigationController] setNavigationBarHidden:NO animated:YES];
        }
        else
        {
            __strong UIView* v = self.videoView;
            [self.videoView removeFromSuperview];
            [self.view addSubview:v];
            
            NSLog(@"Self.navigation controller: %@", self.navigationController);
            if (self.navigationController == nil) {
              
                [appDelegate.mainNavigationController pushViewController:self animated:NO];
                NSLog(@"After1: %@", [appDelegate.mainNavigationController viewControllers]);
            }
            YouTubeVideoFrame = CGRectMake(0, 0, self.view.frame.size.width, 180);

            tallContainerFrame = CGRectMake(0, YouTubeVideoFrame.size.height, self.view.frame.size.width, self.view.frame.size.height-YouTubeVideoFrame.size.height);
                        tallContainerAlpha = 1.0;
        }
        NSTimeInterval duration = 0.5;
        [UIView animateWithDuration:duration animations:^{
            self.videoView.frame = YouTubeVideoFrame;
            self.detailView.frame = tallContainerFrame;
            self.detailView.alpha = tallContainerAlpha;
            self.videoView.alpha = 1.0;
        }];
        // if ([self mpIsMinimized] == minimized) return;
    NSLog(@"After2: %@", [appDelegate.mainNavigationController viewControllers]);

    NSLog(@"%@", NSStringFromCGRect(self.videoView.frame));
     NSLog(@"%@", NSStringFromCGRect(self.detailView.frame));
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [self loadData];
    [super viewWillAppear:animated];
}

- (IBAction)backButtonAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)loadData
{
    _label1.text = @"BLA bla bla BLa";
    _label2.text = @"Oleni moy app";
}


@end
