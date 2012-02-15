//
//  ViewController.m
//  CoshxTechlunch
//
//  Created by David Kapp on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)updateTotalCost;
- (void)timerTick:(NSTimer*)theTimer;

@end

@implementation ViewController
@synthesize peopleCountLabel;
@synthesize estimatedCostLabel;
@synthesize countStepper;
@synthesize costPerPerson;
@synthesize timer;
@synthesize totalCostLabel;
@synthesize totalCost;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setPeopleCountLabel:nil];
  [self setEstimatedCostLabel:nil];
  [self setCountStepper:nil];
  [self setTimer:nil];
  [self setTotalCostLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)stepperValueChanged:(id)sender {
  UIStepper *stepper = (UIStepper*)sender;
  double count = stepper.value;
  
  self.peopleCountLabel.text = [NSString stringWithFormat:@"%d", (int)count];
}

- (IBAction)costPerPersonChanged:(id)sender {
  UITextField *field = (UITextField*)sender;
  NSString *text = field.text;
  self.costPerPerson = [text doubleValue];
  
  [self.view endEditing:YES];
  
  [self updateTotalCost];
}

- (IBAction)startMeeting:(id)sender {
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                target:self
                                              selector:@selector(timerTick:)
                                              userInfo:nil
                                               repeats:YES];
  self.totalCost = 0.0;
  self.totalCostLabel.text = [NSString stringWithFormat:@"%f", self.totalCost];
}

- (IBAction)stopMeeting:(id)sender {
  [self.timer invalidate];
}

- (void)updateTotalCost {
  int peopleCount = (int)self.countStepper.value;
  double totalCostPerHour = self.costPerPerson * peopleCount;
  
  self.estimatedCostLabel.text = [NSString stringWithFormat:@"%f", totalCostPerHour];
}

- (void)timerTick:(NSTimer*)theTimer {
  double costPerSecond = [self.estimatedCostLabel.text doubleValue] / (60*60);
  totalCost += costPerSecond;
  self.totalCostLabel.text = [NSString stringWithFormat:@"%f", self.totalCost];
  
  
}

@end














