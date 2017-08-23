//
//  firstViewController.m
//  qwet
//
//  Created by lsvt on 2017/6/23.
//  Copyright © 2017年 lsvt. All rights reserved.
//

#import "firstViewController.h"
#import "UIView+XMGExtension.h"

#define mainScreenWidth [UIScreen mainScreen].bounds.size.width

#define mainScreenHeight [UIScreen mainScreen].bounds.size.height

#define colorBlueSet [UIColor colorWithRed:(239 / 255.0) green:(239 / 255.0) blue:(244 / 255.0) alpha:1.0]

@interface firstViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *imageArr;

@property (nonatomic, strong) NSString *wifiName;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *deviceInfo;
@property (nonatomic, strong) NSString *videoSetting;
@property (nonatomic, strong) NSString *SDState;


@property (nonatomic, strong) NSString *totalStr;

@property (nonatomic, strong) NSString *usedStr;
@property (nonatomic, strong) NSString *canUseStr;

@property (nonatomic, assign) int64_t totalSDNum;
@property (nonatomic, assign) int64_t usedSDNum;

@property (nonatomic, strong) NSArray *totalInfo;

@property (nonatomic, assign) int num;

@end

@implementation firstViewController


- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainScreenWidth, mainScreenHeight) style:UITableViewStyleGrouped];
//        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setContentInset:UIEdgeInsetsMake(0, 0, 64, 0)];
        //        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = colorBlueSet;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    
    return _tableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"Functional Set";
    
    [self setupTitle];
    [self setupImage];
    
    [self.view addSubview:self.tableView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainScreenWidth, 100)];
    
    //    view.backgroundColor = [UIColor redColor];
    
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_blue_down"] forState:UIControlStateNormal];
    [btn setTitle:@"Delete Device" forState:UIControlStateNormal];
    // 设置位置和尺寸
    btn.frame = CGRectMake(0, 40, 150, 44);
    btn.xmg_centerX = mainScreenWidth * 0.5;
    // 监听按钮点击
    [btn addTarget:self action:@selector(deleClick) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:btn];
    
    
    self.tableView.tableFooterView = view;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back_button1"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"back_button1"] forState:UIControlStateHighlighted];
    
    [backButton sizeToFit];
    
    // 这句代码放在sizeToFit后面
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)back {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)deleClick {
    

    
}

- (void)deleteDevice {
    

}




- (void)setupTitle {
    
    
    NSArray *arr = @[@"Device Name",@"Device info",@"WiFi",@"Video Recording",@"SD Card",@"Protection",@"share"];
    self.titleArr = arr;
}

- (void)setupImage {
    
    UIImage *imageV1 = [UIImage imageNamed:@"video_cell_name"];
    UIImage *imageV2 = [UIImage imageNamed:@"efamily_device_info"];
    UIImage *imageV3 = [UIImage imageNamed:@"video_cell_wifi"];
    UIImage *imageV4 = [UIImage imageNamed:@"video_cell_record"];
    UIImage *imageV5 = [UIImage imageNamed:@"video_cell_sd"];
    UIImage *imageV6 = [UIImage imageNamed:@"video_cell_bell_1"];
    UIImage *imageV7 = [UIImage imageNamed:@"ico_share"];
    
    NSArray *arr = @[imageV1,imageV2,imageV3,imageV4,imageV5,imageV6,imageV7];
    self.imageArr = arr;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 3;
    } else {
        return 2;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"getaccll"];
    if (!cell) {
        cell  =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"getaccll"];
        cell.textLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.selectionStyle = NO;
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 2) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = _titleArr[indexPath.row];
        cell.imageView.image = _imageArr[indexPath.row];
//        cell.detailTextLabel.text = _totalInfo[indexPath.row];
        
    } else if (indexPath.section == 1) {
        cell.textLabel.text = _titleArr[indexPath.row + 3];
        cell.imageView.image = _imageArr[indexPath.row + 3];
//        cell.detailTextLabel.text = _totalInfo[indexPath.row + 3];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.textLabel.text = _titleArr[indexPath.row + 5];
        cell.imageView.image = _imageArr[indexPath.row + 5];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    switch (indexPath.section) {
//        case 0: {
//            if (indexPath.row == 0) {
//                LSChangeDevNameViewController *vc = [[LSChangeDevNameViewController alloc] init];
//                
//                vc._cid = self._cid;
//                vc.deviceName = self.deviceName;
//                [self.navigationController pushViewController:vc animated:YES];
//                
//            } else if (indexPath.row == 1) {
//                LSNewDevInfoController *vc = [[LSNewDevInfoController alloc] init];
//                vc._cid = self._cid;
//                vc.deviceSn = self.deviceSn;
//                vc.deviceA = self.deviceName;
//                [self.navigationController pushViewController:vc animated:YES];
//            }
//            break;
//        }
//        case 1: {
//            if (indexPath.row == 0) {
//                
//                LSAutoRecordController *vc = [[LSAutoRecordController alloc] init];
//                vc._cid = self._cid;
//                vc.num = self.num;
//                [self.navigationController pushViewController:vc animated:YES];
//            } else {
//                
//                LSSDCardController *vc = [[LSSDCardController alloc] init];
//                vc._cid = self._cid;
//                vc.totalStr = _totalStr;
//                vc.usedStr = _usedStr;
//                vc.canUseStr = _canUseStr;
//                vc.totalSDNum = _totalSDNum;
//                vc.usedSDNum = _usedSDNum;
//                [self.navigationController pushViewController:vc animated:YES];
//            }
//            break;
//        }
//        case 2: {
//            
//            if (indexPath.row == 0) {
//                
//                LSSafeProtectController *vc = [[LSSafeProtectController alloc] init];
//                vc._cid = self._cid;
//                [self.navigationController pushViewController:vc animated:YES];
//            } else {
//                
//                LSShareController *vc = [[LSShareController alloc] init];
//                vc._cid = self._cid;
//                [self.navigationController pushViewController:vc animated:YES];
//            }
//            break;
//        }
//            
//            
//        default:
//            break;
//    }
//    
//    
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//-(void)jfgDeviceAlias:(NSString *)alias errorType:(JFGErrorType)errorType {
//    
//    self.deviceName = alias;
//    
//    [self arrayIsEmpty];
//}
//
//- (void)arrayIsEmpty {
//    
//    if ((self.deviceName.length !=0) && (_deviceInfo.length !=0) && (_wifiName.length !=0) && (_videoSetting.length !=0) && (_SDState.length !=0)) {
//        NSMutableArray *arr = [NSMutableArray array];
//        [arr addObject:self.deviceName];
//        [arr addObject:self.deviceInfo];
//        [arr addObject:self.wifiName];
//        [arr addObject:self.videoSetting];
//        [arr addObject:self.SDState];
//        _totalInfo = arr;
//        [self.tableView reloadData];
//    }
//}
//
//#pragma mark - DataPoint
//- (void)getDataPoint:(int)value {//textField:(UITextField *)textField
//    
//    NSString *setSDState1 = NSLocalizedString(@"setSDState1", nil);
//    NSString *setSDState2 = NSLocalizedString(@"setSDState2", nil);
//    NSString *setSDState3 = NSLocalizedString(@"setSDState3", nil);
//    
//    NSString *setVideoState1 = NSLocalizedString(@"setVideoState1", nil);
//    //    NSString *setVideoState2 = NSLocalizedString(@"setVideoState2", nil);
//    NSString *setVideoState3 = NSLocalizedString(@"setVideoState3", nil);
//    
//    [[JFGSDKDataPoint sharedClient] robotGetSingleDataWithPeer:self._cid msgIds:@[[NSNumber numberWithInt:value]] success:^(NSString *identity, NSArray<NSArray<DataPointSeg *> *> *idDataList) {
//        
//        for (NSArray *subArray in idDataList) {
//            
//            for (DataPointSeg *seg in subArray) {
//                
//                // msgpack 数据解包
//                id obj = [MPMessagePackReader readData:seg.value error:nil];
//                
//                if ([obj isKindOfClass:[NSArray class]]) {
//                    NSArray *arr = obj;
//                    if ([arr[3] intValue] == 1) {
//                        
//                        if ([arr[2] intValue] == 0) {
//                            self.SDState = setSDState1;
//                        } else {
//                            self.SDState = setSDState2;
//                        }
//                    } else {
//                        
//                        self.SDState = setSDState3;
//                    }
//                    
//                    
//                    int64_t valueTotal = [arr[0] longLongValue];
//                    int64_t valueUsed = [arr[1] longLongValue];
//                    int64_t valueCanUse = valueTotal - valueUsed;
//                    
//                    _totalSDNum = valueTotal;
//                    _usedSDNum = valueUsed;
//                    
//                    _usedStr = [self byteWithGAndString:valueUsed];
//                    _canUseStr = [self byteWithGAndString:valueCanUse];
//                    _totalStr = [self byteWithGAndString:valueTotal];
//                    
//                } else if ([obj isKindOfClass:[NSNumber class]]) {
//                    
//                    _num = [obj intValue];
//                    switch ([obj intValue]) {
//                            
//                        case 0:
//                            self.videoSetting = setVideoState1;
//                            break;
//                            
//                        case 2:
//                            self.videoSetting = setVideoState3;
//                            break;
//                            
//                        default:
//                            break;
//                    }
//                    
//                    
//                } else {
//                    
//                    self.deviceInfo = obj;
//                    
//                }
//                
//                
//            }
//        }
//        [self arrayIsEmpty];
//        
//    } failure:^(RobotDataRequestErrorType type) {
//        
//    }];
//    
//}


- (NSString *)byteWithGAndString:(int64_t)value {
    
    NSString *str = nil;
    
    if (value >= pow(10, 9)) {// size >= 1GB
        
        str = [NSString stringWithFormat:@"%.2fGB",value / pow(10, 9)];
        
    } else if (value >= pow(10, 6)) {// 1GB > size >= 1MB
        
        str = [NSString stringWithFormat:@"%.2fMB", value / pow(10, 6)];
        
    } else if (value >= pow(10, 3)) { // 1MB > size >= 1KB
        
        str = [NSString stringWithFormat:@"%.2fKB", value / pow(10, 3)];
        
    } else { // 1KB > size
        
        str = [NSString stringWithFormat:@"%zdB", value];
        
    }
    
    return str;
}

@end
