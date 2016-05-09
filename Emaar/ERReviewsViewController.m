//
//  ERReviewsViewController.m
//  Emaar
//
//  Created by thrymr on 09/05/16.
//  Copyright © 2016 thrymr. All rights reserved.
//

#import "ERReviewsViewController.h"
#import <JVMenuPopover/JVMenuPopover.h>


@interface ERReviewsViewController ()

@end

@implementation ERReviewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *firstColor = [UIColor colorWithHexString:@"FB2B69"];
    UIColor *secondColor = [UIColor colorWithHexString:@"FF5B37"];
    
    // setting up new gradient colors
    [self.containerView gradientEffectWithFirstColor:firstColor secondColor:secondColor];
    
    // overriding root controllers label, image and imageview
    UIImage *newImage = [UIImage imageNamed:@"settings-48"];
    self.imageView.image = [newImage changeImageColor:[UIColor blackColor]];
    self.label.text = @"Reviews";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
