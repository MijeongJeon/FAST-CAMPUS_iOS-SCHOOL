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

@property (nonatomic, weak)IBOutlet UIView *topView;
@property (nonatomic, weak)IBOutlet UIView *favoriteView;
@property (nonatomic, weak)IBOutlet UIView *lineView;
@property (nonatomic, weak)IBOutlet UIButton *reload;
@property (nonatomic, weak)IBOutlet UIButton *google;
@property (nonatomic, weak)IBOutlet UIButton *facebook;
@property (nonatomic, weak)IBOutlet UIButton *naver;
@property (nonatomic, weak)IBOutlet UIButton *github;
@property (nonatomic, weak)IBOutlet UIButton *trello;
@property (nonatomic, weak)IBOutlet UIButton *slack;
@property (nonatomic)IBOutlet UITextField *url;
@property (nonatomic, weak)IBOutlet UIButton *goBack;
@property (nonatomic, weak)IBOutlet UIButton *goForward;
@property (nonatomic, weak)IBOutlet UIWebView *webView;
@property (nonatomic, weak)IBOutlet UILabel *favorite;
@property (nonatomic, weak)IBOutlet UIImage *safari;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateLayout];
    [self buttonAction];
    [self buttonFavoritAction];
    _url.delegate = self;
    _webView.delegate = self;
    _url.placeholder = @"Search or enter website name";
    _url.textAlignment = NSTextAlignmentCenter ;
    _goBack.enabled = NO;
    _goForward.enabled = NO;
    
   //  [UIImageView animateWithDuration:1 options:UIViewAnimationCurveEaseIn animations:^{[_safari.kCAAnimationRotateAuto];} completion:^{[];}];
    
    
}


// 웹뷰 설정
- (void)webProperty {
    
    _webView.scrollView.scrollEnabled = YES;
    if ([_url.text  isEqual: @"http://fastcampus.com"]) {
        [_webView loadHTMLString:@"Invalid access! error #4012" baseURL:nil];
    } else {
        NSURL *url = [NSURL URLWithString:_url.text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}


// 현재 사이트의 url 표시 및 앞뒤 버튼 활성화여부
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_url setText:_webView.request.mainDocumentURL.absoluteString];
    if (_webView.canGoBack) {
        _goBack.enabled = YES;
    } else {
        _goBack.enabled = NO;
    }
    if (_webView.canGoForward) {
        _goForward.enabled = YES;
    } else {
        _goForward.enabled = NO;
    }
}


// 올바른 url이 아닌 경우 google에서 검색
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://google.com/search?q=%@",_url.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

//  재검색시 주소창 주소가 리셋됨
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    _url.textAlignment = NSTextAlignmentLeft ;
    [_url setText:@""];
    return YES;
}


// 주소 작성 완료시 키보드 내려감
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self webProperty];
    [_url resignFirstResponder];
    
    return YES;
}

// 앞뒤 버튼 설정
- (void)buttonAction {
    [_goBack addTarget:self action:@selector(actionGoBack:) forControlEvents:UIControlEventTouchUpInside];
    [_goForward addTarget:self action:@selector(actionGoForward:) forControlEvents:UIControlEventTouchUpInside];
    [_reload addTarget:self action:@selector(actionReload:) forControlEvents:UIControlEventTouchUpInside];
    _goBack.layer.cornerRadius = 5;
    _goForward.layer.cornerRadius = 5;
}



- (IBAction)actionGoBack:(UIButton *)sender {
        [_webView goBack];
}

- (IBAction)actionGoForward:(UIButton *)sender {
        [_webView goForward];
    }

- (IBAction)actionReload:(UIButton *)sender {
        [_webView reload];
}


// 즐겨찾기 buttons
- (void)buttonFavoritAction {
    [_google addTarget:self action:@selector(actionGoGoogle:) forControlEvents:UIControlEventTouchUpInside];
    [_naver addTarget:self action:@selector(actionGoNaver:) forControlEvents:UIControlEventTouchUpInside];
    [_github addTarget:self action:@selector(actionGoGithub:) forControlEvents:UIControlEventTouchUpInside];
    [_trello addTarget:self action:@selector(actionGoTrello:) forControlEvents:UIControlEventTouchUpInside];
    [_slack addTarget:self action:@selector(actionGoSlack:) forControlEvents:UIControlEventTouchUpInside];
    [_facebook addTarget:self action:@selector(actionGoFacebook:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)actionGoGoogle:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://google.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (IBAction)actionGoNaver:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://naver.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (IBAction)actionGoGithub:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://github.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (IBAction)actionGoTrello:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://trello.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (IBAction)actionGoSlack:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://slack.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (IBAction)actionGoFacebook:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://facebook.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}


// 프레임 설정
- (void)updateLayout {
    // 상단 urlview
    [self.view addSubview:_topView];
    [_topView addSubview:_goForward];
    [_topView addSubview:_goBack];
    [_topView addSubview:_url];
    [_topView addSubview:_reload];
    _topView.alpha = 0.8;
    _favoriteView.alpha = 0.9;
    _lineView.alpha = 0.8;
    
    _topView.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
    _goBack.frame = CGRectMake(10, 5, 30, 30);
    _goForward.frame = CGRectMake(45, 5, 30, 30);
    _url.frame = CGRectMake(85, 5, _topView.frame.size.width-130, 30);
    _reload.frame = CGRectMake(_topView.frame.size.width-35, 10, 20, 20);
    
    // line view
    [self.view addSubview:_lineView];
    _lineView.frame = CGRectMake(0, 60, self.view.frame.size.width, 2);
    
    // favorite view
    [self.view addSubview:_favoriteView];
    _favoriteView.frame = CGRectMake(0, 62, self.view.frame.size.width, 30);
    
    // favorite icon
    NSInteger offsetX = 85;
    
    [_favoriteView addSubview:_favorite];
    _favorite.textAlignment = NSTextAlignmentCenter;
    _favorite.frame = CGRectMake(10, 5, 70, 20);
    
    [_favoriteView addSubview:_google];
    _google.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _google.frame.size.height + 15;

    [_favoriteView addSubview:_naver];
    _naver.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _google.frame.size.height + 15;
    
    [_favoriteView addSubview:_github];
    _github.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _google.frame.size.height + 15;
    
    [_favoriteView addSubview:_trello];
    _trello.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _google.frame.size.height + 15;
    
    [_favoriteView addSubview:_slack];
    _slack.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _slack.frame.size.height + 15;
    
    [_favoriteView addSubview:_facebook];
    _facebook.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _google.frame.size.height + 15;

   // webview
    [self.view addSubview:_webView];
    _webView.frame = CGRectMake(0, 92, self.view.frame.size.width, self.view.frame.size.height-92);
    
}


@end
