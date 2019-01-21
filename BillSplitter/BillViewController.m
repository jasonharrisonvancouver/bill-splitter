//
//  ViewController.m
//  BillSplitter
//
//  Created by jason harrison on 2019-01-20.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "BillViewController.h"

@interface BillViewController ()
@property (weak, nonatomic) IBOutlet UITextField *amountOfBillTextfield;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UIButton *calculateBillButton;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPersonLabel;

@end

@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
    
    /*
     Do this using the NSDecimalNumber class, in order to keep accuracy when dealing with currency. You will most likely find it handy to use an NSNumberFormatter object to create a number from the string in the text field, and to turn the number of the split amount back */
}

@end
