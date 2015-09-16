//
//  ViewController.h
//  chatclient
//
//  Created by Amit Agarwal on 9/16/15.
//  Copyright (c) 2015 Amit Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIView *mainView;
- (IBAction)signinButtonTouch:(UIButton *)sender;
- (IBAction)signupButtonTouch:(UIButton *)sender;




@end

