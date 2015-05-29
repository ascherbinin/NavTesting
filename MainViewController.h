//
//  MainViewController.h
//  NavigationTests
//
//  Created by Андрей Щербинин on 29.05.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
