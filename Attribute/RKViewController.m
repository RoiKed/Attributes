//
//  RKViewController.m
//  Attribute
//
//  Created by Roi Kedarya on 11/10/13.
//  Copyright (c) 2013 Roi Kedarya. All rights reserved.
//

#import "RKViewController.h"

@interface RKViewController ()
@property (weak,nonatomic) IBOutlet UILabel *label;
@property (weak,nonatomic) IBOutlet UIStepper *selectedWordStepper;
@property (weak,nonatomic) IBOutlet UILabel *selectedWordLabel;
@end

@implementation RKViewController

-(void) addLabelAttributes:(NSDictionary *)attributes range:(NSRange)range
{
    if (range.location!=NSNotFound)
    {
        NSMutableAttributedString *mat = [self.label.attributedText mutableCopy];//copying the text to a mutable attribute string so we can manipulate it
        [mat addAttributes:attributes range:range];
        self.label.attributedText = mat;
    }
}

-(void) addSelectedWordAttributes:(NSDictionary *)attributes
{
    NSRange range = [[self.label.attributedText string] rangeOfString:[self selectedWord]];
    [self addLabelAttributes:attributes range:range];
}

- (IBAction)undeLine
{
    [self addSelectedWordAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}];
}

-(IBAction)noUnderLine
{
    [self addSelectedWordAttributes:@{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone)}];
}

- (IBAction)OutLine
{
    [self addSelectedWordAttributes:@{ NSStrokeWidthAttributeName : @5}];
}

- (IBAction)noOutLine
{
    [self addSelectedWordAttributes:@{ NSStrokeWidthAttributeName : @0}];
}

- (IBAction)changeColor:(UIButton *)sender
{
    [self addSelectedWordAttributes:@{NSForegroundColorAttributeName : sender.backgroundColor}];
}


- (NSArray *) wordList
{
    NSArray *wordList = [[self.label.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([wordList count])
    {
        return wordList;
    }
    else
    {
        return @[@"" ];
    }
}

- (NSString *) selectedWord
{
    return [self wordList][(int)self.selectedWordStepper.value];
}

- (IBAction)updateSelectedWord
{
    self.selectedWordStepper.maximumValue=[self.wordList count]-1;
    self.selectedWordLabel.text=[self selectedWord];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateSelectedWord];
	// Do any additional setup after loading the view, typically from a nib.
   // _shtut1 = @"Shtut 1";
    //self.shtut2 = @"Shtut 2";
    //[self setShtut2:@"Shtut 2"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)setShtut2:(NSString *)shtut2
{
    _shtut1 = shtut2;
}

- (NSString *)shtut2
{
    if (_shtut1) {
        return _shtut1;
    } else {
        return nil;
    }
}*/

@end
