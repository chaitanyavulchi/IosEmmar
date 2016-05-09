//
//  ERGraphsViewController.m
//  Emaar
//
//  Created by thrymr on 09/05/16.
//  Copyright © 2016 thrymr. All rights reserved.
//

#import "ERGraphsViewController.h"
#import <JVMenuPopover/JVMenuPopover.h>

@interface ERGraphsViewController ()

@end

@implementation ERGraphsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor *firstColor = [UIColor colorWithHexString:@"FB2B69"];
    UIColor *secondColor = [UIColor colorWithHexString:@"FF5B37"];
    
    // setting up new gradient colors
    [self.containerView gradientEffectWithFirstColor:firstColor secondColor:secondColor];
    
    // overriding root controllers label, image and imageview
    UIImage *newImage = [UIImage imageNamed:@"settings-48"];
    self.imageView.image = [newImage changeImageColor:[UIColor blackColor]];
    self.label.text = @"Graphs";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
