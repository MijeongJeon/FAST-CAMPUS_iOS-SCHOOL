//
//  MainViewController.m
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MainViewController.h"
#import "WCustomButton.h"
#import "TrayBox.h"
#import "DrinkObject.h"
#import "Casher.h"

@interface MainViewController () <WCustomButtonDelegate>

@property (nonatomic) TrayBox *trayBox;
@property (nonatomic) Casher *casher;

// 메뉴 영역
@property (nonatomic, weak) UIView *menuView;

// 500원 추가 영역
@property (nonatomic, weak) UIView *input500CoinArea;
@property (nonatomic, weak) UILabel *title500CoinLB;
@property (nonatomic, weak) UIButton *add500CoinBtn;

// 100원 추가 영역
@property (nonatomic, weak) UIView *input100CoinArea;
@property (nonatomic, weak) UILabel *title100CoinLB;
@property (nonatomic, weak) UIButton *add100CoinBtn;

// 돈 컨트롤(잔액 표시, 반환버튼)
@property (nonatomic, weak) UIView *moneyControlArea;
@property (nonatomic, weak) UILabel *moneyTitleLB;
@property (nonatomic, weak) UITextField *remainMoneyShowTF;
@property (nonatomic, weak) UIButton *moneyChangeBtn;

// 상태 표시화면(히스토리)
@property (nonatomic, weak) UITextView *displayView;

@property (nonatomic) NSMutableArray *dringkingBtnList;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dringkingBtnList = [[NSMutableArray alloc] initWithCapacity:4];
    self.trayBox = [[TrayBox alloc] init];
    self.casher = [[Casher alloc] init];
    [self createView];
    [self updateLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

// UI객체 생성
- (void)createView
{
    UIView *menuView = [[UIView alloc] init];
    [menuView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:menuView];
    self.menuView = menuView;
    {
            for (int i =0 ; i < maximumDrinkCount; i++) {
                DrinkObject *drinkData = [self.trayBox.drinkKinds objectAtIndex:i];
                
                WCustomButton *drinkBtn = [[WCustomButton alloc] init];
                drinkBtn.tag = i;
                [drinkBtn setBackgroundColor:[UIColor whiteColor]];
                drinkBtn.delegate = self;
                [drinkBtn setTitle:drinkData.name];
                [drinkBtn setImageWithName:[NSString stringWithFormat:@"flag%d",i+1]];
                [menuView addSubview:drinkBtn];
                
                [self.dringkingBtnList addObject:drinkBtn];
              
            }

    }
    UIView *input500CoinArea = [[UIView alloc] init];
    [input500CoinArea setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:input500CoinArea];
    self.input500CoinArea = input500CoinArea;
    // 내부 UI객체 생성
    {
        UILabel *title500CoinLB = [[UILabel alloc] init];
        title500CoinLB.text =@"500won";
        title500CoinLB. textColor = [UIColor whiteColor];
        title500CoinLB.textAlignment = NSTextAlignmentRight;
        [input500CoinArea addSubview:title500CoinLB];
        self.title500CoinLB = title500CoinLB;
        
        UIButton *add500CoinBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        add500CoinBtn.tag = 500;
        [add500CoinBtn addTarget:self
                          action:@selector(onTouchupInsideAddCoin:)
                forControlEvents:UIControlEventTouchUpInside];
        [input500CoinArea addSubview:add500CoinBtn];
        self.add500CoinBtn = add500CoinBtn;
    }
    
    UIView *input100CoinArea = [[UIView alloc] init];
    [input100CoinArea setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:input100CoinArea];
    self.input100CoinArea = input100CoinArea;
    {
        UILabel *title100CoinLB = [[UILabel alloc] init];
        title100CoinLB.text =@"100won";
        title100CoinLB. textColor = [UIColor whiteColor];
        title100CoinLB.textAlignment = NSTextAlignmentRight;
        [input100CoinArea addSubview:title100CoinLB];
        self.title100CoinLB = title100CoinLB;
        
        UIButton *add100CoinBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        add100CoinBtn.tag = 100;
        [add100CoinBtn addTarget:self
                          action:@selector(onTouchupInsideAddCoin:)
                forControlEvents:UIControlEventTouchUpInside];
        [input100CoinArea addSubview:add100CoinBtn];
        self.add100CoinBtn = add100CoinBtn;
    }
    UIView *moneyControlArea = [[UIView alloc] init];
    [moneyControlArea setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:moneyControlArea];
    self.moneyControlArea = moneyControlArea;
    {
        UILabel *moneyTitleLB = [[UILabel alloc] init];
        moneyTitleLB.text = @"Money : ";
        moneyTitleLB.textColor = [UIColor whiteColor];
        moneyTitleLB.font = [UIFont systemFontOfSize:15];
        [moneyControlArea addSubview:moneyTitleLB];
        [moneyControlArea setBackgroundColor:[UIColor blackColor]];
        self.moneyTitleLB = moneyTitleLB;
        
        UITextField *remainMoneyShowTF = [[UITextField alloc] init];
        remainMoneyShowTF.userInteractionEnabled = NO;
        remainMoneyShowTF.borderStyle = UITextBorderStyleLine;
        remainMoneyShowTF.textAlignment = NSTextAlignmentCenter;
        [moneyControlArea addSubview:remainMoneyShowTF];
        [remainMoneyShowTF setTextColor:[UIColor whiteColor]];
        self.remainMoneyShowTF = remainMoneyShowTF;
        
        UIButton *moneyChangeBtn = [[UIButton alloc] init];
        [moneyChangeBtn setTitle:@"return" forState:UIControlStateNormal];
        [moneyChangeBtn addTarget:self
                           action:@selector(onTouchupInsideMoneyChangeBtn:)
                 forControlEvents:UIControlEventTouchUpInside];
        [moneyChangeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [moneyControlArea addSubview:moneyChangeBtn];
        [moneyChangeBtn setBackgroundColor:[UIColor blackColor]];
        self.moneyChangeBtn = moneyChangeBtn;
    
    }
    UITextView *displayView = [[UITextView alloc] init];
    displayView.font = [UIFont systemFontOfSize:15];
    [displayView setBackgroundColor:[UIColor whiteColor]];
    [displayView setTextColor:[UIColor blackColor]];
    self.displayView.editable = NO;
    [self.view addSubview:displayView];
    self.displayView = displayView;

}

// UI레이아웃 수정
- (void)updateLayout
{
    const CGFloat SIDE_MARGIN = 30.0;
    NSInteger offsetY = 20;

    // CGRectMake(x, y, w, h)
    [self.menuView setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN*2, 370)];
    offsetY += self.menuView.frame.size.height + 10;
    {
        CGSize drinkBtnSize = CGSizeMake(140, 175);
        for (int i = 0; i < self.dringkingBtnList.count; i++) {
            NSInteger row = i/2;
            NSInteger col = i%2;
            WCustomButton *drinkBtn = self.dringkingBtnList[i];
            [drinkBtn setFrame:CGRectMake(10 +col*(drinkBtnSize.width +20), 5+row*(drinkBtnSize.height + 10),drinkBtnSize.width, drinkBtnSize.height)];
              [drinkBtn updateLayout];
        }
    }
    [self.input500CoinArea setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN*2, 30)];
    offsetY += self.input500CoinArea.frame.size.height;
    {
        [self.title500CoinLB setFrame:CGRectMake(0, 0, 265, self.input500CoinArea.frame.size.height)];
        [self.add500CoinBtn setFrame:CGRectMake(270, 0, 30 , 30)];
    }
    
    [self.input100CoinArea setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN*2, 30)];
    offsetY += self.input100CoinArea.frame.size.height+10;
    {
        [self.title100CoinLB setFrame:CGRectMake(0, 0, 265, self.input100CoinArea.frame.size.height)];
        [self.add100CoinBtn setFrame:CGRectMake(270, 0, 30 , 30)];
    }

    [self.moneyControlArea setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN*2, 30)];
    offsetY += self.moneyControlArea.frame.size.height+10;
    {
        [self.moneyTitleLB setFrame:CGRectMake(0, 0, 61, 30)];
        [self.remainMoneyShowTF setFrame:CGRectMake(63, 0, 180 , 30)];
        [self.moneyChangeBtn setFrame:CGRectMake(240, 0, 75, 30)];
 
    }
    
    [self.displayView setFrame:CGRectMake(SIDE_MARGIN, offsetY, self.view.frame.size.width - SIDE_MARGIN*2, 145)];
    offsetY += self.displayView.frame.size.height;

}





// Action

- (void)didSelectWCustomButton:(WCustomButton *)customBtn
{
    DrinkObject *drinkOnj = [self.trayBox.drinkKinds objectAtIndex:customBtn.tag];
    
    if ([self.casher buyDrink:drinkOnj]) {
        NSString *successMsg = [NSString stringWithFormat:@"%@ 음반 1개가 나왔습니다. \n",drinkOnj.name];
        [self.displayView setText:[self.displayView.text stringByAppendingString:successMsg]];
        [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
    }else{
        [self.displayView setText:[self.displayView.text stringByAppendingString:@"잔액이 부족합니다.\n"]];
    }
}

- (void)onTouchupInsideAddCoin:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    if (tag == 100) {
        [self.casher addCoin100];
    }else if(tag == 500){
        [self.casher addCoin500];
    }else{
    NSLog(@"tag값이 잘못 되었습니다.");
    }
    
    [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
}

- (void)onTouchupInsideMoneyChangeBtn:(UIButton *)sender
{
    //{@"500":count, @"100";cout}
    NSDictionary *coinDic = [self.casher changeMoney];
    NSNumber *coin500Count = coinDic[@"500"];
    NSNumber *coin100Count = coinDic[@"100"];
    NSInteger changeMoney = (500*coin500Count.integerValue) + (100*coin100Count.integerValue);
    //남은돈 표시
    [self.remainMoneyShowTF setText:[NSString stringWithFormat:@"%zd",(long)self.casher.inputMoney]];
    //로그 표시
     NSString *changeMsg = [NSString stringWithFormat:@"거스름돈은 %ld 입니다.(500원 동전 %@개, 100원 동전 %@개)\n", changeMoney,coin500Count,coin100Count];
     [self.displayView setText:[self.displayView.text stringByAppendingString:changeMsg]];

}

@end
