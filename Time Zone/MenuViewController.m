//
//  MenuViewController.m
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 01/11/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    
    self.lblPontuacaoRecorde.text = [DataBaseCirculos sharedManager].recorde;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnJogar:(id)sender {
    JogoViewController *jogo = [self.storyboard instantiateViewControllerWithIdentifier:@"jogo"];
    [self.navigationController pushViewController:jogo animated:NO];
}

- (IBAction)btnTutorial:(id)sender {
    DuvidaViewController *duvida = [self.storyboard instantiateViewControllerWithIdentifier:@"duvida"];
    [self.navigationController pushViewController:duvida animated:NO];
}







@end
