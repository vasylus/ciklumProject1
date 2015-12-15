//
//  ViewController.m
//  ciklumProject1
//
//  Created by Vasyl Vasylchenko on 10.12.15.
//  Copyright © 2015 Vasyl Vasylchenko. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){

    MyClass * myClass;
 }
@property (weak, nonatomic) IBOutlet UITextField *textFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextView *textViewOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myClass = [MyClass new];
    myClass.arrayOfObject= [NSMutableArray new];
    
 }

- (IBAction)addButton:(id)sender {
    [myClass addObject: self.textFieldOutlet.text];
}


- (IBAction)deleteButton:(id)sender {
    [myClass removeOBject];
 }

- (IBAction)showArray:(id)sender {
         self.textViewOutlet.text = [NSString stringWithFormat:@"%@", myClass.arrayOfObject];
 }

@end



@implementation MyClass


- (void)addObject:(NSString *)string{
    
    [self.arrayOfObject addObject:string];
    
}
- (void)removeOBject{
    
    [self.arrayOfObject removeLastObject];
}



@end
