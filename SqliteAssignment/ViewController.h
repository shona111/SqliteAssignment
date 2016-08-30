//
//  ViewController.h
//  SqliteAssignment
//
//  Created by Student-006 on 04/08/16.
//  Copyright © 2016 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *idlbl;
@property (weak, nonatomic) IBOutlet UILabel *namelbl;
@property (weak, nonatomic) IBOutlet UILabel *addresslbl;
@property (weak, nonatomic) IBOutlet UITextField *idText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;

@property (weak, nonatomic) IBOutlet UITextField *addText;
@property(nonatomic,retain)NSMutableArray *tempArray;
@end

