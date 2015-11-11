//
//  DetailViewController.m
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import "DetailViewController.h"
#import "RSVDataItem.h"

@interface DetailViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *detailWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:self.item.countryName];
    NSURL *url = [NSURL URLWithString:self.item.descriptionURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.detailWebView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityIndicator stopAnimating];
    [[[UIAlertView alloc] initWithTitle:error.localizedDescription message:error.localizedRecoverySuggestion delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil] show];
}

@end
