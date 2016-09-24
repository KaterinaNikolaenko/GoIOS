//
//  ExhibitionDescriptionVC.m
//  GoGallery
//
//  Created by Katerina on 02.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "ExhibitionDescriptionVC.h"
#import "PatternCollectionViewCell.h"
#import "Exhibition.h"
#import "MasterPiece.h"

@interface ExhibitionDescriptionVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameExhibition;
@property (weak, nonatomic) IBOutlet UILabel *nameAuthor;
@property (weak, nonatomic) IBOutlet UILabel *nameGallery;
@property (weak, nonatomic) IBOutlet UILabel *nameAddressGallery;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *link;
@property (weak, nonatomic) IBOutlet UILabel *facebook;
@property (weak, nonatomic) IBOutlet UILabel *aboutGallery;
@property (weak, nonatomic) IBOutlet UIButton *buttonTransform;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewHeightConstraint;
@property (assign, nonatomic) BOOL isExpanded;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *infoViewAddress;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoVAddressConstraint;

@property (weak, nonatomic) IBOutlet UIView *infoViewPhone;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewPhoneConstrain;

@property (weak, nonatomic) IBOutlet UIView *infiViewLink;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewLinkConstrain;


@property (weak, nonatomic) IBOutlet UIView *infoViewFacebook;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewFaceConstrain;


@property( readwrite, assign ) NSInteger sizeCollectionView;
//@property (nonatomic, strong)NSArray *imageArray;
@end

@implementation ExhibitionDescriptionVC

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
        if (!(self.exhibition.masterPieces.firstObject == nil)) {
            self.sizeCollectionView = self.exhibition.masterPieces.count;
        } else {
            self.sizeCollectionView = 0;
        }
        
        return self.sizeCollectionView;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PatternCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PatternCell" forIndexPath:indexPath];
    
    if (!(self.exhibition.masterPieces.firstObject == nil)){
        MasterPiece *masterPiece = [self.exhibition.masterPieces objectAtIndex:indexPath.row];
        NSURL *url = masterPiece.imgPict;
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        cell.patternImageView.image = image;
        
    }

    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(110.0, 110.0);
}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.imageArray = @[@"phone.png", @"link.png", @"facebook.png", @"maps_pin", @"Clock"];
    self.isExpanded = YES;
    
    self.nameExhibition.text = self.exhibition.name;
    self.nameAuthor.text = self.exhibition.authorName;
    self.nameGallery.text = self.exhibition.venue.name;
    self.nameAddressGallery.text = self.exhibition.venue.address;
    self.phone.text = self.exhibition.venue.phone;
    NSString *urlStringLink = [self.exhibition.venue.link absoluteString];
    self.link.text = urlStringLink;
    //NSString *urlStringFacebook = [self.exhibition.venue.facebook absoluteString];
    self.aboutGallery.text = self.exhibition.venue.galleryDescription;
    self.buttonTransform.backgroundColor = [UIColor greenColor];
    
     //[self.myCollectionView setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
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
    self.infoViewLinkConstrain.constant = self.isExpanded ? 60 : 0;
    self.infoViewFaceConstrain.constant = self.isExpanded ? 60 : 0;
    self.buttonTransform.backgroundColor = self.isExpanded ? [UIColor greenColor] : [UIColor redColor];
    self.buttonTransform.transform = self.isExpanded ? CGAffineTransformMakeRotation(0) : CGAffineTransformMakeRotation(M_PI);
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
        weakself.infoView.alpha = weakself.isExpanded ? 1.0 : 0.0;
        weakself.infoViewAddress.alpha = weakself.isExpanded ? 1.0 : 0.0;
        weakself.infoViewPhone.alpha = weakself.isExpanded ? 1.0 : 0.0;
        weakself.infiViewLink.alpha = weakself.isExpanded ? 1.0 : 0.0;
        weakself.infoViewFacebook.alpha = weakself.isExpanded ? 1.0 : 0.0;
  
        self.buttonTransform.transform = weakself.isExpanded ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformMakeRotation(0);
        self.buttonTransform.backgroundColor = weakself.isExpanded ? [UIColor redColor] : [UIColor greenColor];
    }];
}

@end
