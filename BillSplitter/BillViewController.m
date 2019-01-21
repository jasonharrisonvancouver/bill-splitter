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
@property (weak, nonatomic) IBOutlet UILabel *numPeopleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *numPeopleImage;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextfield;

@end

@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)numberOfPeopleChanged:(UISlider *)sender {
    NSLog(@"num people %f", sender.value);
    int rounded = sender.value;  //Casting to an int will truncate, round down
    [sender setValue:rounded animated:NO];
    
    NSLog(@"%f", sender.value);

    self.numPeopleLabel.text = [NSString stringWithFormat:@"%d people", (int)sender.value];
}




- (IBAction)calculateSplitAmount:(UIButton *)sender {
    
    /*
     Do this using the NSDecimalNumber class, in order to keep accuracy when dealing with currency. You will most likely find it handy to use an NSNumberFormatter object to create a number from the string in the text field, and to turn the number of the split amount back */
    float totalBillAmount = [self.amountOfBillTextfield.text floatValue];
    
    int numPeople = self.numberOfPeopleSlider.value;
    
    float perPersonAmount = totalBillAmount / numPeople;
    self.amountPerPersonLabel.text = [NSString stringWithFormat:@"$%.2f per person",perPersonAmount];
    
}

@end
