//
//  TableViewCell.h
//  NavigationTests
//
//  Created by Андрей Щербинин on 29.05.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UISlider *horizontalSlider;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;

@end
