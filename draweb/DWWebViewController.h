//
//  DWFirstViewController.h
//  draweb
//
//  Created by SOOYOUNG BYUN on 13. 2. 11..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWWebViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *urlField;
@property (strong, nonatomic) IBOutlet UIWebView *webPage;
@property (strong, nonatomic) IBOutlet UILabel *searchLabel;

- (IBAction)goClicked:(id)sender;
- (IBAction)saveOnePageClicked:(id)sender;
- (IBAction)saveDevidedPate:(id)sender;
@end
