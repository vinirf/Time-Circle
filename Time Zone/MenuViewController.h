//
//  MenuViewController.h
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 01/11/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseCirculos.h"
#import "DuvidaViewController.h"
#import "JogoViewController.h"

@interface MenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblPontuacaoRecorde;


- (IBAction)btnJogar:(id)sender;

- (IBAction)btnTutorial:(id)sender;

@end
