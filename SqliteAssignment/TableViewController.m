//
//  TableViewController.m
//  SqliteAssignment
//
//  Created by Student-006 on 04/08/16.
//  Copyright © 2016 Felix. All rights reserved.
//

#import "TableViewController.h"
#import "ThirdViewController.h"
#import "ViewController.h"
#import <sqlite3.h>

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   _insertArray = [[NSMutableArray alloc]init];
   
//   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(btnClick)];
   _refresh = [[UIRefreshControl alloc]init];
   
   [_refresh addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
   
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
   [self.tableView addSubview:_refresh];
}
-(void)refreshTable
{
   [self.refresh endRefreshing];
   [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _insertArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
   cell.textLabel.text = [_insertArray objectAtIndex:indexPath.row];
   
   return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [self performSegueWithIdentifier:@"edit" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   if([[segue identifier] isEqualToString:@"show"])
   {
      ViewController *svc = [segue destinationViewController];
   }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


- (IBAction)readData:(id)sender
{
    NSArray * dir= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Employee.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    sqlite3_stmt *mystmt;
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        const char *query="select * from tb";
        
        if (sqlite3_prepare(db, query, -1, &mystmt, NULL)==SQLITE_OK)
        {
            
            while (sqlite3_step(mystmt)==SQLITE_ROW)
            {
                int empid= sqlite3_column_int(mystmt, 0);
                NSString *empname= [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt, 1)];
                NSString *empaddress= [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt, 2)];
                NSLog(@"%d   %@   %@",empid,empname,empaddress);
            }
        }
        
        else
            
        {
            NSLog(@"fail to read values");
            
        }
    }

}
@end
