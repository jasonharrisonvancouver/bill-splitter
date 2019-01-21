//
//  ViewController.m
//  BillSplitter
//
//  Created by jason harrison on 2019-01-20.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "BillViewController.h"

@interface BillViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountOfBillTextfield;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UIButton *calculateBillButton;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPersonLabel;
@property (weak, nonatomic) IBOutlet UILabel *numPeopleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *numPeopleImage;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextfield;
@property BOOL sliderButtonPressed;
@end

@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.amountOfBillTextfield.delegate = self;
    
    // start
    //self.numberOfPeopleSlider.delegate = self;
    //self.slider = [[[UISlider alloc] initWithFrame:sliderFrame] autorelease];
    [self.numberOfPeopleSlider addTarget:self action:@selector(sliderValueChangedAction:) forControlEvents:UIControlEventValueChanged];
    [self.numberOfPeopleSlider addTarget:self action:@selector(sliderTouchDownAction:) forControlEvents:UIControlEventTouchDown];
    [self.numberOfPeopleSlider addTarget:self action:@selector(sliderTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.numberOfPeopleSlider];
    // end
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

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self calculateSplitAmount:self.calculateBillButton];

}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    [self calculateSplitAmount:self.calculateBillButton];

        return YES;
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self calculateSplitAmount:self.calculateBillButton];

}

- (void)textDidChange:(UITextField *)textField
{
  //  if ([self.amountOfBillTextfield.delegate respondsToSelector:@selector(textDidChange:)])
    //    [self.amountOfBillTextfield.delegate textDidChange:textField];
    /*YOUR CODE HERE*/
    self.amountPerPersonLabel.text = @"amount of bill has changed!";
    [self calculateSplitAmount:self.calculateBillButton];
}



// start


- (IBAction)sliderValueChangedAction:(id)sender {
    NSLog(@"slider value: %f", [(UISlider *)sender value]);
    // Update the text value of a UILabel or something
    [self calculateSplitAmount:sender];
}

- (IBAction)sliderTouchDownAction:(id)sender {
    self.sliderButtonPressed = YES;
}

- (IBAction)sliderTouchUpInsideAction:(id)sender {
    if (self.sliderButtonPressed) {
        self.sliderButtonPressed = NO;
        NSLog(@"I'm only fired once for every continuous sliding event");
        // Do something here you wouldn't want to do on every single value change of the slider,
        // e.g., save the value of the slider to an NSManagedObject attribute.
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



// end

@end
