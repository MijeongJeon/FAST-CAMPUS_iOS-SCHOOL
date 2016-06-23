//
//  ViewController.m
//  WebPage
//
//  Created by Mijeong Jeon on 5/27/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIWebViewDelegate>

@property (weak, nonatomic)IBOutlet UIView *topView;
@property (weak, nonatomic)IBOutlet UIView *favoriteView;
@property (weak, nonatomic)IBOutlet UIView *lineView;
@property (weak, nonatomic)IBOutlet UIButton *reload;
@property (weak, nonatomic)IBOutlet UITextField *url;
@property (weak, nonatomic)IBOutlet UIButton *goBack;
@property (weak, nonatomic)IBOutlet UIButton *goForward;
@property (weak, nonatomic)IBOutlet UIWebView *webView;
@property (weak, nonatomic)IBOutlet UILabel *favorite;

// 즐겨찾기 버튼
@property (weak, nonatomic)IBOutlet UIButton *google;
@property (weak, nonatomic)IBOutlet UIButton *facebook;
@property (weak, nonatomic)IBOutlet UIButton *naver;
@property (weak, nonatomic)IBOutlet UIButton *github;
@property (weak, nonatomic)IBOutlet UIButton *trello;
@property (weak, nonatomic)IBOutlet UIButton *slack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateLayout];
    [self buttonAction];
    [self buttonFavoritAction];
    self.url.delegate = self;
    self.webView.delegate = self;
    self.url.placeholder = @"Search or enter website name";
    self.url.textAlignment = NSTextAlignmentCenter ;
    self.goBack.enabled = NO;
    self.goForward.enabled = NO;
    
   //  [UIImageView animateWithDuration:1 options:UIViewAnimationCurveEaseIn animations:^{[_safari.kCAAnimationRotateAuto];} completion:^{[];}];
}


// 웹뷰 설정
- (void)webProperty {
    
    self.webView.scrollView.scrollEnabled = YES;
    if ([self.url.text  isEqual: @"http://fastcampus.com"]) {
        [self.webView loadHTMLString:@"Invalid access! error #4012" baseURL:nil];
    } else {
        NSURL *url = [NSURL URLWithString:self.url.text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}


// 현재 사이트의 url 표시 및 앞뒤 버튼 활성화여부
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.url setText:self.webView.request.mainDocumentURL.absoluteString];
    if (self.webView.canGoBack) {
        self.goBack.enabled = YES;
    } else {
        self.goBack.enabled = NO;
    }
    if (self.webView.canGoForward) {
        self.goForward.enabled = YES;
    } else {
        self.goForward.enabled = NO;
    }
}


// 올바른 url이 아닌 경우 google에서 검색
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://google.com/search?q=%@",self.url.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

//  재검색시 주소창 주소가 리셋됨
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.url.textAlignment = NSTextAlignmentLeft ;
    [self.url setText:@""];
    return YES;
}


// 주소 작성 완료시 키보드 내려감
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self webProperty];
    [self.url resignFirstResponder];
    return YES;
}

// 앞뒤 버튼 설정
- (void)buttonAction {
    [self.goBack addTarget:self
                    action:@selector(actionGoBack:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [_goForward addTarget:self
                   action:@selector(actionGoForward:)
         forControlEvents:UIControlEventTouchUpInside];
    
    [_reload addTarget:self
                action:@selector(actionReload:)
      forControlEvents:UIControlEventTouchUpInside];
// 버튼 모서리 둥글게 처리
    self.goBack.layer.cornerRadius = 5;
    self.goForward.layer.cornerRadius = 5;
}

// 뒤로가기
- (IBAction)actionGoBack:(UIButton *)sender {
        [self.webView goBack];
}
// 앞으로 가기
- (IBAction)actionGoForward:(UIButton *)sender {
        [self.webView goForward];
    }
// 리프레쉬
- (IBAction)actionReload:(UIButton *)sender {
        [self.webView reload];
}


// 즐겨찾기 buttons
- (void)buttonFavoritAction {
    [self.google addTarget:self
                    action:@selector(actionGoGoogle:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.naver addTarget:self
                   action:@selector(actionGoNaver:)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.github addTarget:self
                    action:@selector(actionGoGithub:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.trello addTarget:self
                    action:@selector(actionGoTrello:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.slack addTarget:self
                   action:@selector(actionGoSlack:)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.facebook addTarget:self
                      action:@selector(actionGoFacebook:)
            forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)actionGoGoogle:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://google.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)actionGoNaver:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://naver.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)actionGoGithub:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://github.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)actionGoTrello:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://trello.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)actionGoSlack:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://slack.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (IBAction)actionGoFacebook:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://facebook.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


// 프레임 설정
- (void)updateLayout {
    // 상단 urlview
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.goForward];
    [self.topView addSubview:self.goBack];
    [self.topView addSubview:self.url];
    [self.topView addSubview:self.reload];
    
    self.topView.alpha = 0.8;
    self.favoriteView.alpha = 0.9;
    self.lineView.alpha = 0.8;
    
    self.topView.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
    self.goBack.frame = CGRectMake(10, 5, 30, 30);
    self.goForward.frame = CGRectMake(45, 5, 30, 30);
    self.url.frame = CGRectMake(85, 5, self.topView.frame.size.width-130, 30);
    self.reload.frame = CGRectMake(self.topView.frame.size.width-35, 10, 20, 20);
    
    // line view
    [self.view addSubview:self.lineView];
    self.lineView.frame = CGRectMake(0, 60, self.view.frame.size.width, 2);
    
    // favorite view
    [self.view addSubview:self.favoriteView];
    self.favoriteView.frame = CGRectMake(0, 62, self.view.frame.size.width, 30);
    
    // favorite icon
    NSInteger offsetX = 85;
    
    [self.favoriteView addSubview:self.favorite];
    self.favorite.textAlignment = NSTextAlignmentCenter;
    self.favorite.frame = CGRectMake(10, 5, 70, 20);
    
    [self.favoriteView addSubview:self.google];
    self.google.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += self.google.frame.size.height + 15;

    [self.favoriteView addSubview:self.naver];
    self.naver.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += self.google.frame.size.height + 15;
    
    [self.favoriteView addSubview:self.github];
    self.github.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += self.google.frame.size.height + 15;
    
    [self.favoriteView addSubview:self.trello];
    self.trello.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += self.google.frame.size.height + 15;
    
    [self.favoriteView addSubview:self.slack];
    self.slack.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += self.slack.frame.size.height + 15;
    
    [self.favoriteView addSubview:self.facebook];
    self.facebook.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += self.google.frame.size.height + 15;

   // webview
    [self.view addSubview:self.webView];
    self.webView.frame = CGRectMake(0, 92, self.view.frame.size.width, self.view.frame.size.height-92);
    
}


@end
