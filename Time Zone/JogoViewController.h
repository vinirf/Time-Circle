//
//  ViewController.h
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 31/10/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseCirculos.h"
#import "Circulo.h"
#import "GestureCirculo.h"
#import <Social/Social.h>

@interface JogoViewController : UIViewController


//View Circulos
@property (weak, nonatomic) IBOutlet UIView *viewCirculos;
@property (weak, nonatomic) IBOutlet UIImageView *imgGanhou;

@property NSMutableArray *listaCirculosJogo;
@property NSMutableArray *listaOrdemPesoCirculos;
@property float tempoDesaparecerLblPesos;
@property int contadorIndiceEscolha;



//Contagem Regressiva
@property (weak, nonatomic) IBOutlet UILabel *lblContagemRegressiva;
@property int contagemRegressiva;



//Pontuacao
@property int pontuacao;
@property (weak, nonatomic) IBOutlet UILabel *lblPontuacao;



//Game Over
@property (weak, nonatomic) IBOutlet UIView *viewGameOver;
- (IBAction)btnMenu:(id)sender;
- (IBAction)btnRecomecar:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblPontuacaoRecorde;
@property SLComposeViewController *postFacebook;


//Superior
- (IBAction)btnVoltarMenu:(id)sender;



















@end

