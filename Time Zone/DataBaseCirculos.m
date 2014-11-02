//
//  DataBaseCirculos.m
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 31/10/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseCirculos.h"

@implementation DataBaseCirculos

+(DataBaseCirculos*)sharedManager{
    static DataBaseCirculos *unicoDataCoord = nil;
    if(!unicoDataCoord){
        unicoDataCoord = [[super allocWithZone:nil]init];
    }
    return unicoDataCoord;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaCirculos = [[NSMutableArray alloc]init];
        self.listaPosicoesCirculos = [[NSMutableArray alloc]init];
        self.listaPosicoesSorteadas = [[NSMutableArray alloc]init];
        self.listaCirculosSorteadas = [[NSMutableArray alloc]init];
        [self inicializaCirculos];
        [self inicializaPosicaoCirculos];
        
        self.recorde = [NSString stringWithFormat: @"%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"pontuacaoRanking"]];
        
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


-(void)inicializaCirculos{
    [self criaCirculo0];
    [self criaCirculo1];
    [self criaCirculo2];
    [self criaCirculo3];
    [self criaCirculo4];
    [self criaCirculo5];
    [self criaCirculo6];
    [self criaCirculo7];
    [self criaCirculo8];
}

-(void)adicionaLabel:(Circulo*)circulo{
    circulo.label = [[UILabel alloc]initWithFrame:CGRectMake(25, 25, 30, 30)];
    circulo.label.text = circulo.numero;
    circulo.label.font = [UIFont systemFontOfSize:36];
    circulo.label.textColor = [UIColor whiteColor];
    [circulo addSubview:circulo.label];
}

-(void)criaCirculo1{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 1;
    circulo.numero = @"1";
    
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}

-(void)criaCirculo2{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 2;
    circulo.numero = @"2";
 
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}

-(void)criaCirculo3{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 3;
    circulo.numero = @"3";
    
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}


-(void)criaCirculo4{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 4;
    circulo.numero = @"4";
  
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}

-(void)criaCirculo5{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 5;
    circulo.numero = @"5";
    
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}


-(void)criaCirculo6{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 6;
    circulo.numero = @"6";
    
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}


-(void)criaCirculo7{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 7;
    circulo.numero = @"7";
   
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}

-(void)criaCirculo8{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 8;
    circulo.numero = @"8";
    
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}

-(void)criaCirculo0{
    Circulo *circulo = [[Circulo alloc]init];
    circulo.peso = 0;
    circulo.numero = @"0";
  
    [self adicionaLabel:circulo];
    [self.listaCirculos addObject:circulo];
}


/////////////////////////////////////////////////////////////////////////////


-(void)inicializaPosicaoCirculos{
    
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(0,0)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(85,0)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(163,0)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(242,0)]];
    
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(42, 59)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(125, 59)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(203, 59)]];
 
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(0,122)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(85,122)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(163,122)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(242,122)]];
    
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(42,188)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(125,188)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(203,188)]];
    
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(0,255)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(85,255)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(163,255)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(242,255)]];
    
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(42,321)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(125,321)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(203,321)]];
    
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(0,382)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(85,382)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(163,382)]];
    [self.listaPosicoesCirculos addObject:[NSValue valueWithCGPoint:CGPointMake(242,382)]];
}

-(void)sortearPosicoes{
    [self.listaCirculosSorteadas removeAllObjects];
    [self.listaPosicoesSorteadas removeAllObjects];
    
    self.listaPosicoesSorteadas = [self retornaListaCirculosPosicaoSortedos:self.qtNumerosFase];
    self.listaCirculosSorteadas = [self retornaListaCirculosSortedos:self.qtNumerosFase];
}



-(NSMutableArray*)retornaListaCirculosPosicaoSortedos:(int)qt{
    
    int remaining = qt;
    NSMutableArray* pickedNames = [[NSMutableArray alloc] init];
    
    if ( [self.listaPosicoesCirculos count] >= remaining )
    {
        while (remaining > 0)
        {
            id name = [self.listaPosicoesCirculos objectAtIndex: arc4random() % [self.listaPosicoesCirculos count]];
            
            if ( ! [pickedNames containsObject: name] )
            {
                [pickedNames addObject: name];
                remaining --;
            }
        }
    }

    return pickedNames;
}

-(NSMutableArray*)retornaListaCirculosSortedos:(int)qt{
    
    int remaining = qt;
    NSMutableArray* pickedNames = [[NSMutableArray alloc] init];
    
    if ( [self.listaCirculos count] >= remaining )
    {
        while (remaining > 0)
        {
            id name = [self.listaCirculos objectAtIndex: arc4random() % [self.listaCirculos count]];
            
            if ( ! [pickedNames containsObject: name] )
            {
                [pickedNames addObject: name];
                remaining --;
            }
        }
    }
    
    return pickedNames;
}








@end
