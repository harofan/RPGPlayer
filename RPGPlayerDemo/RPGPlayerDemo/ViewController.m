//
//  ViewController.m
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/10.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "ViewController.h"
#import "RPGAudioEncodeController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (copy, nonatomic) NSArray <NSString *>*dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    Mp3Encoder *encoder = new Mp3Encoder();
    //    encoder->encode();
    //    delete encoder;
    [self initView];
}
#pragma mark - UI
- (void)initView{
    UITableView *tableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
}
#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller;
    switch (indexPath.row) {
        case 0://audioencoder
            controller = [[RPGAudioEncodeController alloc] init];
            break;
            
        default:
            break;
    }
    
    if (controller){
        [self.navigationController pushViewController:controller animated:YES];
    }
}
#pragma mark - datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
#pragma mark - set && get
- (NSArray<NSString *> *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"audioEncoder"];
    }
    return _dataArray;
}
@end
