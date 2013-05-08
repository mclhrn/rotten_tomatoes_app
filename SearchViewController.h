//
//  SearchViewController.h
//  rt-v.03
//
//  Created by Michael Hearne on 23/04/2013.
//  Copyright (c) 2013 Me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) NSString *searchValue;
@property IBOutlet UITextField *myTextField;
@property IBOutlet UIButton *myButton;
@end
