//
//  ViewController.m
//  chatclient
//
//  Created by Amit Agarwal on 9/16/15.
//  Copyright (c) 2015 Amit Agarwal. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
        [Parse setApplicationId:@"DXsvTSLgsKT03gSSqy6V5KbLwVpgfEjmEsKzzQUP" clientKey: @"BXAzmCJhMtIVWhLVEiKIMzPCA5XI0Nt9NwvAOPVd"];
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signinButtonTouch:(UIButton *)sender {
    NSLog(@"signin button clicked");
    [PFUser logInWithUsernameInBackground:@"myname" password:@"mypass"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Log: login success");
                                        } else {
                                            // The login failed. Check error to see why.
                                                                                        NSLog(@"Log: login error");
                                        }
                                    }];

    
}

- (IBAction)signupButtonTouch:(UIButton *)sender {
    NSLog(@"signup button clicked");
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.
            NSLog(@"Log: signup success");
        } else {
//            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
                        NSLog(@"Log: signup error");
        }
    }];
}
@end
