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

@end

@implementation ExhibitionDescriptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameExhibition.text = self.exhibition.name;
    self.nameAuthor.text = self.exhibition.authorName;
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
