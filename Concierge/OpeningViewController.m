//
//  OpeningViewController.m
//  Concierge
//
//  Created by Katie Siegel on 7/28/13.
//  Copyright (c) 2013 Katie Siegel. All rights reserved.
//

#import "OpeningViewController.h"
#import "ViewController.h"
#import <Parse/Parse.h>

@interface OpeningViewController ()

@end

@implementation OpeningViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginWithTwitter:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter your login info."
                                          message: @""
                                          delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Login",nil];
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alert show];    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
    else if (buttonIndex == 1) {
        [PFTwitterUtils initializeWithConsumerKey:[alertView textFieldAtIndex:0].text consumerSecret:[alertView textFieldAtIndex:1].text];
        [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
            if (!user) {
                //NSLog(@"Uh oh. The user cancelled the Twitter login.");
                return;
            } else if (user.isNew) {
                //NSLog(@"User signed up and logged in with Twitter!");
            } else {
                //NSLog(@"User logged in with Twitter!");
            }
        }];
        UIViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end