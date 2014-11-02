//
//  Circulo.m
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 31/10/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "Circulo.h"

@implementation Circulo

-(id)init{
    self = [super init];
    if(self){
        self = [[Circulo alloc]initWithImage:[UIImage imageNamed:@"imgBranco.png"]];
        self.imgCirculo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"botaoVermelho.png"]];
        self.imgCirculo.frame = CGRectMake(0, 0, 70, 70);
        [self addSubview:self.imgCirculo];
    }
    return self;
}

@end
