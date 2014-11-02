//
//  DataBaseCirculos.h
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 31/10/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circulo.h"

@interface DataBaseCirculos : NSObject

@property NSString *recorde;

@property NSMutableArray *listaCirculos;
@property NSMutableArray *listaPosicoesCirculos;

@property NSMutableArray *listaPosicoesSorteadas;
@property NSMutableArray *listaCirculosSorteadas;

+(DataBaseCirculos*)sharedManager;
-(void)sortearPosicoes;

@property int qtNumerosFase;

@end
