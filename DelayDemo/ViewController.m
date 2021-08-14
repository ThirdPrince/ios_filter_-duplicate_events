//
//  ViewController.m
//  DelayDemo
//
//  Created by dang on 2021/8/14.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UILabel* uiLabel;
@property(nonatomic,strong)UIButton* startTimerBtn;
@property(nonatomic,strong)UIButton* endTimerBtn;
@property(nonatomic,strong)NSTimer* timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen]bounds];
    CGFloat labelTop = 200;
    CGFloat lableWidth = 300;
    CGFloat labelHeight = 50;
    
    _uiLabel = [[UILabel alloc]initWithFrame:CGRectMake((screen.size.width-lableWidth)/2, labelTop, lableWidth,  labelHeight)];
    _uiLabel.text = @"this is test";
    
    _startTimerBtn = [[UIButton alloc]initWithFrame:CGRectMake((screen.size.width-lableWidth)/2, labelTop+100, lableWidth, labelHeight)];
    [_startTimerBtn setTitle:@"startTimer" forState:UIControlStateNormal];
    _startTimerBtn.backgroundColor = [UIColor redColor];
    [_startTimerBtn addTarget:self action:@selector(onBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _endTimerBtn = [[UIButton alloc]initWithFrame:CGRectMake((screen.size.width-lableWidth)/2, labelTop+200,lableWidth, labelHeight)];
    [_endTimerBtn setTitle:@"endTimer" forState:UIControlStateNormal];
    _endTimerBtn.backgroundColor = [UIColor redColor];
    [_endTimerBtn addTarget:self action:@selector(onBtnEndClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.uiLabel];
    [self.view addSubview:self.startTimerBtn];
    [self.view addSubview:self.endTimerBtn];
  
   
    
    
    
}
-(void)onBtnClick{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(repeatDoSomeThing) userInfo:nil repeats:YES];
    self.uiLabel.text = @"正在重复执行 DoSomeThing";
}
-(void)onBtnEndClick{
    [self.timer invalidate];
}
-(void)repeatDoSomeThing{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startDoSomeThing) object:nil];
    [self performSelector:@selector(startDoSomeThing) withObject:nil afterDelay:0.2];
}

-(void)startDoSomeThing{
    NSLog(@"start do some thing");
    self.uiLabel.text = @"start do some thing";
}


@end
