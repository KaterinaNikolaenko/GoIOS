//
//  ExhibitionDescriptionVC.m
//  GoGallery
//
//  Created by Katerina on 02.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "ExhibitionDescriptionVC.h"

@interface ExhibitionDescriptionVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameExhibition;
@property (weak, nonatomic) IBOutlet UILabel *nameAuthor;
@property (weak, nonatomic) IBOutlet UILabel *nameGallery;
@property (weak, nonatomic) IBOutlet UILabel *nameAddressGallery;
@property (weak, nonatomic) IBOutlet UILabel *phone;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewHeightConstraint;
@property (assign, nonatomic) BOOL isExpanded;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *infoViewAddress;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoVAddressConstraint;

@property (weak, nonatomic) IBOutlet UIView *infoViewPhone;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewPhoneConstrain;


@end

@implementation ExhibitionDescriptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isExpanded = YES;
    
    self.nameExhibition.text = self.exhibition.name;
    self.nameAuthor.text = self.exhibition.authorName;
    self.nameGallery.text = self.exhibition.venue.name;
    self.nameAddressGallery.text = self.exhibition.venue.address;
    self.phone.text = self.exhibition.venue.phone;
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
- (IBAction)didTouchMoreButton:(id)sender {
    self.isExpanded = !self.isExpanded;
    self.infoViewHeightConstraint.constant = self.isExpanded ? 60 : 0;
    self.infoVAddressConstraint.constant = self.isExpanded ? 60 : 0;
    self.infoViewPhoneConstrain.constant = self.isExpanded ? 60 : 0;
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
        weakself.infoView.alpha = weakself.isExpanded ? 1.0 : 0.0;
        weakself.infoViewAddress.alpha = weakself.isExpanded ? 1.0 : 0.0;
        weakself.infoViewPhone.alpha = weakself.isExpanded ? 1.0 : 0.0;

    }];
}

@end
