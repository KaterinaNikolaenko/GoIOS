//
//  ExhibitionDescriptionVC.h
//  GoGallery
//
//  Created by Katerina on 02.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "ViewController.h"
#import "EventsModel.h"
#import "Exhibition.h"
#import "Event.h"


@interface ExhibitionDescriptionVC : ViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(strong)Exhibition *exhibition;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end
