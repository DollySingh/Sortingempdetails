//
//  XIBTableViewCell.h
//  EmployeeCustomCorrect
//
//  Created by Student on 17/10/16.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblEmpname;

@property (weak, nonatomic) IBOutlet UILabel *lblEmpDegination;

@property (weak, nonatomic) IBOutlet UILabel *lblEmpSalary;
@property (weak, nonatomic) IBOutlet UILabel *lblEmpDepartment;

@property (weak, nonatomic) IBOutlet UIImageView *Empimg;


@end
