//
//  ViewController.m
//  Dome
//
//  Created by 陈东芝 on 17/3/22.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DZFBBImageShow *test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _test.arrayImage = [NSMutableArray arrayWithArray:@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg"]];
    _test.delegate = self;
}

- (void)imageShowIndex:(int)index {

    NSLog(@"imageShowIndex%d",index);
    
}

- (void)imageDeleteIndex:(int)index {
    NSLog(@"imageDeleteIndex%d",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
