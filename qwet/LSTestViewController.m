//
//  LSTestViewController.m
//  qwet
//
//  Created by lsvt on 2017/7/18.
//  Copyright © 2017年 lsvt. All rights reserved.
//

#import "LSTestViewController.h"

@interface LSTestViewController ()

@property (nonatomic, strong) UISwitch *switchBtn;
@property (nonatomic, strong) NSIndexPath *lastPath;

@end

@implementation LSTestViewController

- (instancetype)init {

    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwitch *isON = [[UISwitch alloc] init];
    [isON addTarget:self action:@selector(valueforswitch) forControlEvents:UIControlEventValueChanged];
    self.switchBtn = isON;
}

- (void)valueforswitch {
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

//    if (self.switchBtn.isOn) {
//        return 40;
//    } else {
//        return 1;
//    }
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"getaccll"];
    
    if (!cell) {
        cell  =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"getaccll"];
//        cell.textLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
//        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
//        cell.selectionStyle = NO;
    }
    
    NSInteger row = [indexPath row];
    NSInteger oldRow = [_lastPath row];
    
    if (row == oldRow && _lastPath != nil) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Child%zd", indexPath.row];
//    if (indexPath.row == 0) {
//        cell.textLabel.text = @"Start";
//        cell.accessoryView = self.switchBtn;
//    } else {
//    
//        cell.textLabel.text = [NSString stringWithFormat:@"Child%zd", indexPath.row];
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger newRow = [indexPath row];
    NSInteger oldRow = (_lastPath != nil) ? [_lastPath row] : -1;
    
    if (newRow != oldRow) {
        
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:_lastPath];
        
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        _lastPath = indexPath;
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
