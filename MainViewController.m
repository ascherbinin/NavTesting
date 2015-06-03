//
//  MainViewController.m
//  NavigationTests
//
//  Created by Андрей Щербинин on 29.05.15.
//  Copyright (c) 2015 Андрей Щербинин. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
#import "VideoViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.detailViewController = [[DetailViewController alloc] init];
    self.detailNavigationController = [[UINavigationController alloc] initWithRootViewController:self.detailViewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


-(UITableViewCell*)tableView:(UITableViewCell *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   

    
    static NSString* CellIdentifier = @"Cell";
    
    TableViewCell* cell = (TableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSLog(@"SOSISKA");
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.label.text = @"TEXT LABEL HERE";
    [cell.button.titleLabel setText:@"BIG BUTTON"];
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    self.detailViewController = nil;
    self.detailViewController = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:self.detailViewController animated:YES];

}





@end
