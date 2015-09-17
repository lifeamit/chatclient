//
//  ChatViewController.m
//  chatclient
//
//  Created by Amit Agarwal on 9/16/15.
//  Copyright (c) 2015 Amit Agarwal. All rights reserved.
//

#import "ChatViewController.h"
#import "CustomCell.h"
#import <Parse/Parse.h>

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UITextField *chatInputField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray  *messages;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector: @selector(refresh) userInfo:nil repeats:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"inside numberOfRowsInSection: %lu", [self.response[@"data"] count]);
//    return [self.response[@"data"] count];
    return [self.messages count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    //    cell.textLabel.text = [NSString stringWithFormat: @"%ld", (long)indexPath.row];
    //    NSLog(self.response);
    //                  NSLog(@"response: %@", self.response);
    //    NSLog(@"inside cellForRowAtIndexPath: %lu", [self.response[@"data"] count]);

    PFObject *message =self.messages[indexPath.row];
//    if (message[@"user"]) {
//        cell.textLabel.text = message[@"user"];
//    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@", message[@"text"]];
    
    return cell;
}


- (IBAction)sendChatAction:(UIButton *)sender {
    NSString *chatString = self.chatInputField.text;
    NSLog(@"send clicked");
    
    
    PFObject *gameScore = [PFObject objectWithClassName:@"Message"];
    gameScore[@"text"] = chatString;
        gameScore[@"user"] = [PFUser currentUser];

    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            NSLog(@"chat saved successfully");
            [self refresh];
        } else {
            // There was a problem, check error.description
                        NSLog(@"chat save error");
        }
    }];
}

- (void) refresh {
    NSLog(@"Inside timer");
    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
    [query orderByAscending:@"createdAt"];
    query.limit = 1500;

    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects) {
            // The object has been saved.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)[objects count]);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
            self.messages = objects;
            [self.tableView reloadData];
            CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
            [self.tableView setContentOffset:offset];
        } else {
            // There was a problem, check error.description
            NSLog(@"count not pull logs");
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
