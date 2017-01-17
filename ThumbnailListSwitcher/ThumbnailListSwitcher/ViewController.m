//
//  ViewController.m
//  ThumbnailListSwitcher
//
//  Created by YGuan on 17/01/2017.
//  Copyright © 2017 YGuan. All rights reserved.
//

#import "ViewController.h"
#import "BUFlowLayout.h"
#import "BUItemCell.h"

@implementation ViewController {
    
    __weak IBOutlet UICollectionView *_collectionView;
    ListType _type;
    BUFlowLayout *_listLayout;
    BUFlowLayout *_viewLayout;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_view_list"]
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(changeListType)];
    
    _listLayout = [[BUFlowLayout alloc] initWithType:List];
    _listLayout.itemSize = CGSizeMake(self.view.frame.size.width, 250);
    
    _viewLayout = [[BUFlowLayout alloc] initWithType:Thumbnail];
    _viewLayout.itemSize = CGSizeMake(160, 160);
    
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BUItemCell class]) bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    [_collectionView setCollectionViewLayout:_viewLayout animated:NO];
    
}

- (void)changeListType {
    
    [self changeListWithType:_type == Thumbnail ? List : Thumbnail];
    
}

- (void)changeListWithType:(ListType)type {
    _type = type;
    UIImage *image = nil;
    BUFlowLayout *layout = nil;
    switch (type) {
        case Thumbnail:
            image = [UIImage imageNamed:@"ic_view_list"];
            layout = _viewLayout;
            break;
        case List:
            image = [UIImage imageNamed:@"ic_list"];
            layout = _listLayout;
            break;
    }
    self.navigationItem.leftBarButtonItem.image = image;
    [_collectionView setCollectionViewLayout:layout animated:YES];
}

#pragma mark- collectionView delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BUItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
    
}


@end
