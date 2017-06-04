//
//  TMListPageViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMListCollectionViewCell.h"
#import "TMListCollectionViewFlowLayout.h"
#import "Task.h"
#import "BmobSDK/BmobUser.h"
#import "BmobSDK/BmobQuery.h"

@interface TMListPageViewController : UIViewController

@property (nonatomic,strong)   UICollectionView    *collectionView;
@property (nonatomic,strong)   NSMutableArray      *infoMutableArray;
@end
