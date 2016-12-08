//
//  TableViewController.m
//  EmployeeCustomCorrect
//
//  Created by Student on 17/10/16.
//  Copyright © 2016 student. All rights reserved.
//

#import "TableViewController.h"
#import "Employee.h"
#import "XIBTableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XIBTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Reuse"];
    
    //initialize emp array
    
    _empArray = [[NSMutableArray alloc] init];
    
    Employee *temp = [[Employee alloc] init];
    
    temp.ename = @"Dolly";
    temp.degination = @"SoftEng";
    temp.salary = 85456;
    temp.deptName = @"ETools";
    temp.imageName = @"1";
    
    [_empArray addObject:temp];
    
   
    Employee *temp2  = [[Employee alloc] init];
    temp2.ename = @"pooja";
    temp2.degination = @"TechLead";
    temp2.salary = 150000;
    temp2.deptName = @"Controls";
    temp2.imageName = @"2";
    [_empArray addObject:temp2];
    
    Employee *temp3  = [[Employee alloc] init];
    temp3.ename = @"Shweta";
    temp3.degination = @"Manager";
    temp3.salary = 250000;
    temp3.deptName = @"Insite";
    temp3.imageName = @"3";
    [_empArray addObject:temp3];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    
    _button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button1.frame = CGRectMake(20, 25, 90, 50);
    [_button1 setTintColor:[UIColor redColor]];
    [_button1 setBackgroundColor:[UIColor greenColor]];
    [_button1 setTitle:@"Name" forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(OnBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [headerView addSubview:_button1];
    
    _button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button2.frame = CGRectMake(120, 25, 90, 50);
    [_button2 setTintColor:[UIColor redColor]];
    [_button2 setBackgroundColor:[UIColor greenColor]];
    [_button2 setTitle:@"Degination" forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(OnBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [headerView addSubview:_button2];
    
    _button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button3.frame = CGRectMake(220, 25, 90, 50);
    [_button3 setTintColor:[UIColor redColor]];
    [_button3 setBackgroundColor:[UIColor greenColor]];
    [_button3 setTitle:@"Salary" forState:UIControlStateNormal];
    [_button3 addTarget:self action:@selector(OnBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [headerView addSubview:_button3];

    return headerView;
    
}
-(void)OnBtnClick : (UIButton *)commonButton
{
    NSSortDescriptor *descriptor = nil;
    if(commonButton == _button1)
    {
        descriptor = [NSSortDescriptor sortDescriptorWithKey:@"ename" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)];
        
        
    }
    
    else if(commonButton == _button2)
    {
        descriptor = [NSSortDescriptor sortDescriptorWithKey:@"degination" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)];
        
    }
    else if(commonButton == _button3)
    {
        descriptor = [NSSortDescriptor sortDescriptorWithKey:@"salary" ascending:NO selector:@selector(compare:)];
        
    }
    
    /* NSArray *result=  [_empArray sortedArrayUsingDescriptors:@[descriptor]];*/
    
    NSArray *result = [_empArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
    
    _empArray=[[NSMutableArray alloc]initWithArray:result];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _empArray.count;
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XIBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Reuse" forIndexPath:indexPath];
    Employee *temp = [_empArray objectAtIndex:indexPath.row];
    
    
    cell.lblEmpname.text = temp.ename;
    
    cell.lblEmpDegination.text = temp.degination;
    
    cell.lblEmpSalary.text = [[NSString alloc]initWithFormat:@"%0.2f",temp.salary];
    
    cell.lblEmpDepartment.text = temp.deptName;
    
    cell.Empimg.image = [UIImage imageNamed:temp.imageName];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
