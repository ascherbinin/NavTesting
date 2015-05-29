//
//  DetailViewController.h
//  NavigationTests
//
//  Created by Андрей Щербинин on 29.05.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) IBOutlet UIView *detailView;
- (IBAction)backButtonAction:(id)sender;

@end
