//
//  TMListPageViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListPageViewController.h"
#import "TMListCollectionViewCell.h"
#import "TMListCollectionViewFlowLayout.h"

static NSString *cellIdentifier = @"CellIdentifier";

@interface TMListPageViewController ()<UICollectionViewDataSource>

@end

@implementation TMListPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupListPage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchTabel {
    
}

-(void)setupListPage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"列表";
    TMListCollectionViewFlowLayout *layout = [[TMListCollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[TMListCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    collectionView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    collectionView.backgroundColor = [UIColor grayColor];
    collectionView.sd_layout
    .topSpaceToView(self.view, 64);
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                                forIndexPath:indexPath];
    
    return cell;
}

@end

