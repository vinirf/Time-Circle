//
//  ViewController.m
//  Time Zone
//
//  Created by Vinicius Resende Fialho on 31/10/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

//http://appadvice.com/review/hiddengem-rotate-a-rotating-world



#import "JogoViewController.h"

@interface JogoViewController ()

@end

@implementation JogoViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pontuacao = 0;
    self.viewGameOver.hidden = YES;
    
    [self iniciar];
    
    
}

//Inicia jogo
-(void)iniciar{
    self.listaOrdemPesoCirculos = [[NSMutableArray alloc]init];
    self.listaCirculosJogo = [[NSMutableArray alloc]init];
    self.contagemRegressiva = 3;//contagem do tempo para inciar jogo
    self.contadorIndiceEscolha = 0;//indice do array que vai pegando o tap do usuario em cima do circulo
    self.tempoDesaparecerLblPesos = 1.0;
    self.lblContagemRegressiva.hidden = NO;//desoculta a lbl de contagem
    
    //decrementa a contagem regressiva
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(contagemRegressiva:) userInfo:nil repeats:YES];

}

//Faz a contagem regressiva
-(void)contagemRegressiva:(NSTimer*)tempo{
    
    //seta o valor da contagem
    self.lblContagemRegressiva.text = [NSString stringWithFormat:@"%d",self.contagemRegressiva];
    
    //se contagem acabar, comeca o jogo
    if(self.contagemRegressiva == 0){
        [tempo invalidate];
        
        //oculta a lbl de contagem
        self.lblContagemRegressiva.hidden = YES;
        self.lblContagemRegressiva.text = [NSString stringWithFormat:@"%@",@""];
        
        //inicia o jogo
        [self comecarJogo];
    }
    
    //tira o valor da contagem
    self.contagemRegressiva -= 1;
}


///////////////////////////////// VIEW CIRCULOS /////////////////////////////////

-(void)controlaQtCirculosPorPontuacao{
    switch (self.pontuacao) {
        case 0 :
            [DataBaseCirculos sharedManager].qtNumerosFase = 2;
            break;
        case 20 :
            [DataBaseCirculos sharedManager].qtNumerosFase = 3;
            break;
        case 40 :
            [DataBaseCirculos sharedManager].qtNumerosFase = 4;
            break;
        case 80 :
            [DataBaseCirculos sharedManager].qtNumerosFase = 5;
            break;
        case 120 :
            self.tempoDesaparecerLblPesos = 2.0;
            [DataBaseCirculos sharedManager].qtNumerosFase = 6;
            break;
        default:
            break;
    }
    
}

//Comecar o Jogo
-(void)comecarJogo{
    
    [self controlaQtCirculosPorPontuacao];
    
    //Seta a quantidade de circulos e sortea as (posicoes e circulos)
    [[DataBaseCirculos sharedManager]sortearPosicoes];
    
    
    //Add circulos na view
    for(int i=0;i<[DataBaseCirculos sharedManager].listaCirculosSorteadas.count;i++){
        
        //Pega as (posicoes e circulos) aleatorios
        Circulo *view = [[DataBaseCirculos sharedManager].listaCirculosSorteadas objectAtIndex:i];
        NSValue *valor = [[DataBaseCirculos sharedManager].listaPosicoesSorteadas objectAtIndex:i];
        
        //seta as posicoes aleatorias do circulos
        view.frame = CGRectMake(valor.CGPointValue.x,valor.CGPointValue.y,view.frame.size.width,view.frame.size.height);
        view.imgCirculo.hidden = YES;
        
        //Add gesture aos circulos
        GestureCirculo *circuloGesture = [[GestureCirculo alloc]initWithTarget:self action:@selector(escolheCirculo:)];
        circuloGesture.numberOfTapsRequired =1;
        circuloGesture.numberOfTouchesRequired =1;
        view.userInteractionEnabled = YES;
        circuloGesture.circulo = view;
        [view addGestureRecognizer:circuloGesture];
        
        [self.viewCirculos addSubview:view];
        
        //Add o peso dos circulos
        [self.listaOrdemPesoCirculos addObject:[NSNumber numberWithInt:view.peso]];
        //Add o circulos
        [self.listaCirculosJogo addObject:view];
        
    }
    
    //Ordena o peso dos circulos para comparar com o tap do usuario
    [self ordenarCirculos];
    
    //Deixa os numeros aparecendo por um tempo determinado
    [NSTimer scheduledTimerWithTimeInterval:self.tempoDesaparecerLblPesos target:self selector:@selector(apagaNumeros:) userInfo:nil repeats:YES];

}


//Faz a ordenacao dos pesos do circulo
-(void)ordenarCirculos{
    NSSortDescriptor *peso = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    self.listaOrdemPesoCirculos = [[NSMutableArray alloc]initWithArray:[self.listaOrdemPesoCirculos sortedArrayUsingDescriptors:[NSArray arrayWithObjects:peso, nil]]];
}


//Aparece os pesos dos circulos
-(void)apareceLabel{
    for(Circulo *circulo in self.listaCirculosJogo){
        circulo.label.hidden = NO;
    }
}

//Remove circulos da view
-(void)removeCirculos{
    for(Circulo *circulos in self.listaCirculosJogo){
        [circulos removeFromSuperview];
    }
}


//Apaga os numeros dos pesos e deixa o circulos
-(void)apagaNumeros:(NSTimer*)tempo{
    
    for(Circulo *circulo in self.listaCirculosJogo){
        circulo.label.hidden = YES;
        circulo.imgCirculo.hidden = NO;
    }
    
    [tempo invalidate];
}


//Logica do Jogo
-(void)escolheCirculo:(GestureCirculo*)gesture{
    NSNumber *circuloCerto = [self.listaOrdemPesoCirculos objectAtIndex:self.contadorIndiceEscolha];
    
    //Acertou
    if([gesture.circulo.numero intValue]  == [circuloCerto intValue]){
        self.contadorIndiceEscolha++;
        gesture.circulo.label.hidden = NO;
        gesture.circulo.imgCirculo.hidden = YES;
        
        //Ganhou
        if(self.contadorIndiceEscolha == [DataBaseCirculos sharedManager].qtNumerosFase){
            //self.imgGanhou.hidden = NO;
            [self performSelector:@selector(avancaJogo) withObject:NULL afterDelay:2.0];
        }
        
    //Perdeu
    }else{
        
        for(Circulo *circulo in self.listaCirculosJogo){
            circulo.label.hidden = NO;
            circulo.imgCirculo.hidden = YES;
        }
        
        if(self.pontuacao > [[DataBaseCirculos sharedManager].recorde intValue])[DataBaseCirculos sharedManager].recorde = [NSString stringWithFormat:@"%d",self.pontuacao];
        
        [self performSelector:@selector(apareceTelaGameOver) withObject:NULL afterDelay:2.0];
        
    }
    
}


//Recomeca Jogo
-(void)recomecaJogo{
    self.viewGameOver.hidden = YES;
    self.pontuacao = 0;
    self.lblPontuacao.text = [NSString stringWithFormat:@"%d",self.pontuacao];
    [self apareceLabel];
    [self removeCirculos];
    [self iniciar];
}


//Avanca Jogo
-(void)avancaJogo{
    self.imgGanhou.hidden = YES;
    self.pontuacao += 10;
    self.lblPontuacao.text = [NSString stringWithFormat:@"%d",self.pontuacao];
    [self apareceLabel];
    [self removeCirculos];
    [self iniciar];
}

//Finaliza View
-(void)finalizaJogo{
    [self.navigationController popToRootViewControllerAnimated:NO];
    self.listaOrdemPesoCirculos = [[NSMutableArray alloc]init];
    self.listaCirculosJogo = [[NSMutableArray alloc]init];
    self.contagemRegressiva = 3;
    self.contadorIndiceEscolha = 0;
    self.lblContagemRegressiva.hidden = NO;
    [self removeCirculos];
}

///////////////////////////////// SUPERIOR /////////////////////////////////

//Volta ao menu botao superior
- (IBAction)btnVoltarMenu:(id)sender {
    [self finalizaJogo];
}

///////////////////////////////// GAME OVER /////////////////////////////////

//Tela gameover
-(void)apareceTelaGameOver{
    self.lblPontuacaoRecorde.text = [DataBaseCirculos sharedManager].recorde;
    self.viewGameOver.hidden = NO;
}


//Volta ao menu (game over)
- (IBAction)btnMenu:(id)sender {
    [self finalizaJogo];
}


//Recomeca Jogo (game over)
- (IBAction)btnRecomecar:(id)sender {
    [self recomecaJogo];
}


- (IBAction)btnCompartilhar:(id)sender {
    
    self.postFacebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [self.postFacebook setInitialText:@"Facebook Circle"];
    
    
    // [self.tweetSheet addImage: self.imageView.image];
    
    
    NSString *endereco = [NSString stringWithFormat:@"%@%@",@"Eu pontuei ",[DataBaseCirculos sharedManager].recorde];
    [self.postFacebook setInitialText: endereco];
    
    
    [self presentViewController: self.postFacebook animated:YES completion:nil];
    
}


@end
