//
//  TMListPageViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListPageViewController.h"


static NSString *cellIdentifier = @"CellIdentifier";

@interface TMListPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@end

@implementation TMListPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [KVNProgress showWithStatus:@"加载中。。。。"];
    [self setupListPage];
    [self initArray];
    [self searchTabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initArray{
    _infoMutableArray = [[NSMutableArray alloc] initWithCapacity:1];
}

-(void)searchTabel{
    NSString *className = @"task";
    BmobQuery   *bquery = [BmobQuery queryWithClassName:className];
    BmobUser *bmobUser = [BmobUser currentUser];
    if(bmobUser){
        //查找task表对应user的数据
        [bquery whereKey:@"user_Name" equalTo:bmobUser.username];
        [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            if (error){
                [KVNProgress showErrorWithStatus:@"获取任务列表失败。\n请检查网络连接。"];
            }else{
                for (BmobObject *obj in array) {
                    
                    Task *info    = [[Task alloc] init];
                    info.taskName    = [obj objectForKey:@"task_Name"];
                    info.taskDate  = [obj objectForKey:@"task_Date"];
                    info.taskTime  = [obj objectForKey:@"task_Time"];
                    info.taskTimeA = [obj objectForKey:@"task_From"];
                    info.taskTimeB = [obj objectForKey:@"task_To"];
                    info.taskLocation = [obj objectForKey:@"task_Location"];
                    info.taskRemarks = [obj objectForKey:@"task_Remarks"];
                    [_infoMutableArray addObject:info];
                }
                NSLog(@"%@",_infoMutableArray);
                [self setupCollectionView];
                [KVNProgress showSuccessWithStatus:@"获取任务列表成功！"];
            }
        }];
    }else{
        [KVNProgress showErrorWithStatus:@"您还没有保存过即时任务。"];
    }
}

-(void)setupListPage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"列表";
}
-(void)setupCollectionView{
    TMListCollectionViewFlowLayout *layout = [[TMListCollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    [collectionView registerClass:[TMListCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor grayColor];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_infoMutableArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  1;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    NSString * item = _infoMutableArray[fromIndexPath.item];
    [_infoMutableArray removeObjectAtIndex:fromIndexPath.item];
    [_infoMutableArray insertObject:item atIndex:fromIndexPath.item];
}

- (void)collectionView:(UICollectionView *)collectionView didMoveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)toIndexPath{
    [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    Task *info             = (Task*)[_infoMutableArray objectAtIndex:indexPath.row];
    cell.titleLabel.text        = info.taskName;
    cell.taskDateLabel.text     = info.taskDate;
    cell.lastingTimeLabel.text     = info.taskTime;
    cell.startTimeLabel.text    = info.taskTimeA;
    cell.endTimeLabel.text    = info.taskTimeB;
    cell.locationContentLabel.text  = info.taskLocation;
    cell.memoContentTextView.text   = info.taskRemarks;
    return cell;
}


@end

