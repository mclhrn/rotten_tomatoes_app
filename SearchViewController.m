//
//  SearchViewController.m
//  rt-v.03
//
//  Created by Michael Hearne on 23/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResultsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SearchViewController ()

@end

@implementation SearchViewController

@synthesize myTextField, searchValue, myButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapgesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(outsideClick)];
   
    [self.view addGestureRecognizer:tapgesture];
    self.navigationController.navigationBar.hidden = YES;
    //self.view.originalCenter = self.view.center;
    
    myTextField.delegate = self;
    myTextField.text = nil;
    
    [[myButton layer] setBorderWidth:1.0f];
    [[myButton layer] setBorderColor:[UIColor grayColor].CGColor];
}

-  (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)outsideClick
{
    [myTextField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 65; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [myTextField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    [self performSegueWithIdentifier:@"toSearchResults" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if (searchValue == nil) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Field"
//                                                        message:@"Please enter a search term"
//                                                       delegate:nil
//                                              cancelButtonTitle:@"Okay"
//                                              otherButtonTitles: nil];
//        [alert show];
//    }
//    else {
           searchValue = myTextField.text;

            SearchResultsViewController * searchResultsViewController = [segue destinationViewController];
            searchResultsViewController.searchValue = searchValue;
//    }
}


@end
