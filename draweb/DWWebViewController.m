//
//  DWFirstViewController.m
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 2. 11..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "DWWebViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DWWebViewController ()

@end

@implementation DWWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - web methods

- (void)showWebPage
{
    NSURL *url = [[NSURL alloc] initWithString:self.urlField.text];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    [self.webPage loadRequest:req];
}

- (void)saveWebPageToOneImage
{
    //get width & height
    float width = [[self.webPage stringByEvaluatingJavaScriptFromString:@"document.body.scrollWidth;"] floatValue];
	float height = [[self.webPage stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"] floatValue];
    float deviceHeight = 480.0f;

	int pages = ceil(height / deviceHeight);
    
    UIImage *viewImage = nil;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    //set context offset with page
    for (int i = 0; i < pages; i++) {
        
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        [[[self.webPage subviews] lastObject] setContentOffset:CGPointMake(0, deviceHeight * i) animated:NO];
        [self.webPage.layer renderInContext:currentContext];
        
        CGContextTranslateCTM(currentContext, 0, deviceHeight);
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    //save image to album
    UIImageWriteToSavedPhotosAlbum(viewImage,nil,NULL,NULL);
    
    [[[self.webPage subviews] lastObject] setContentOffset:CGPointZero animated:NO];
}

- (void) saveWebPageToDevidedImage
{
    //get width & height
    float width = [[self.webPage stringByEvaluatingJavaScriptFromString:@"document.body.scrollWidth;"] floatValue];
	float height = [[self.webPage stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"] floatValue];
    float deviceHeight = 480.0f;
    
	int pages = ceil(height / deviceHeight);

    UIImage *viewImage = nil;
    UIGraphicsBeginImageContext(CGSizeMake(width, deviceHeight));
    
    //set webview page
    for (int i = 0; i < pages; i++) {
    
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        [[[self.webPage subviews] lastObject] setContentOffset:CGPointMake(0, deviceHeight * i) animated:NO];
        [self.webPage.layer renderInContext:currentContext];
    
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
        //save image to album
        UIImageWriteToSavedPhotosAlbum(viewImage,nil,NULL,NULL);
    }
    
    UIGraphicsEndImageContext();
    
    [[[self.webPage subviews] lastObject] setContentOffset:CGPointZero animated:NO];
}

#pragma mark - textview delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self showWebPage];
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - webview delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    self.searchLabel.hidden = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
}

- (IBAction)goClicked:(id)sender
{
    [self showWebPage];
    [self.urlField resignFirstResponder];
}

- (IBAction)saveOnePageClicked:(id)sender
{
    [self saveWebPageToOneImage];
}

- (IBAction)saveDevidedPate:(id)sender
{
    [self saveWebPageToDevidedImage];
}

@end
