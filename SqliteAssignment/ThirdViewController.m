//
//  ThirdViewController.m
//  SqliteAssignment
//
//  Created by Student-006 on 04/08/16.
//  Copyright © 2016 Felix. All rights reserved.
//

#import "ThirdViewController.h"
#import "TableViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   [_editBtn setTitle:@"Edit" forState:UIControlStateNormal];
   [_editBtn addTarget:self action:@selector(editData) forControlEvents:UIControlEventTouchUpInside];
   
   _editId.enabled = NO;
   _editName.enabled = NO;
   _editAddress.enabled = NO;
    // Do any additional setup after loading the view.
}

-(void)editData
{
   _editId.enabled = YES;
   _editName.enabled = YES;
   _editAddress.enabled = YES;
   
   [_editBtn setTitle:@"Update" forState:UIControlStateNormal];
   
   
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   [_editId resignFirstResponder];
   [_editName resignFirstResponder];
   [_editAddress resignFirstResponder];
   
   return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
