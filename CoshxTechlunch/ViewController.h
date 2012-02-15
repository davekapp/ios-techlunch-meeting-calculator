//
//  ViewController.h
//  CoshxTechlunch
//
//  Created by David Kapp on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *peopleCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *estimatedCostLabel;
@property (weak, nonatomic) IBOutlet UIStepper *countStepper;
@property (nonatomic) double costPerPerson;
@property (nonatomic) double totalCost;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLabel;

- (IBAction)stepperValueChanged:(id)sender;
- (IBAction)costPerPersonChanged:(id)sender;
- (IBAction)startMeeting:(id)sender;
- (IBAction)stopMeeting:(id)sender;

@end
