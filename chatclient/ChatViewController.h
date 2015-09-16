//
//  ChatViewController.h
//  chatclient
//
//  Created by Amit Agarwal on 9/16/15.
//  Copyright (c) 2015 Amit Agarwal. All rights reserved.
//

#import "ViewController.h"

@interface ChatViewController : ViewController
@property (strong, nonatomic) IBOutlet UIView *chatView;
@property (weak, nonatomic) IBOutlet UIView *chatChileView;
@property (weak, nonatomic) IBOutlet UIButton *chatSendButton;

@end
