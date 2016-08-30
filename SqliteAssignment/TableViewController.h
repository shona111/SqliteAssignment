//
//  TableViewController.h
//  SqliteAssignment
//
//  Created by Student-006 on 04/08/16.
//  Copyright © 2016 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic,retain)NSMutableArray *insertArray;
@property(nonatomic,retain)UIRefreshControl *refresh;
- (IBAction)readData:(id)sender;



@end
