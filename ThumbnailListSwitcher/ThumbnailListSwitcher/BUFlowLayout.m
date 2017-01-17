//
//  BUFlowLayout.m
//  ThumbnailListSwitcher
//
//  Created by YGuan on 2017/1/17.
//  Copyright © 2017年 YGuan. All rights reserved.
//

#import "BUFlowLayout.h"

@implementation BUFlowLayout {
    ListType _type;
}

- (instancetype)initWithType:(ListType)type {
    
    if ([super init]) {
        _type = type;
        [self initializeLayout];
    }
    return self;
}

- (void)initializeLayout {
    
    switch (_type) {
        case Thumbnail:
            self.minimumInteritemSpacing = 10;
            self.minimumLineSpacing = 10;
            self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
            break;
        case List:
            self.minimumInteritemSpacing = 10;
            self.minimumLineSpacing = 0;
            self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
            break;
    }
}


@end
