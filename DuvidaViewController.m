//
//  DuvidaViewController.m
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 01/11/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DuvidaViewController.h"

@interface DuvidaViewController ()

@end

@implementation DuvidaViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnVoltarMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}


@end
