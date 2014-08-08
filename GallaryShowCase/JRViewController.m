//
//  JRViewController.m
//  GallaryShowCase
//
//  Created by 孙琳 on 8/8/14.
//  Copyright (c) 2014 Lin Spirit Tech. All rights reserved.
//

#import "JRViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface JRViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView * collectionView;
@property (nonatomic, strong)   NSArray *assets;

@end

@implementation JRViewController

+ (ALAssetsLibrary *)defaultAssetsLibaray
{
    static dispatch_once_t pred=0;
    static ALAssetsLibrary * library =nil;
    dispatch_once(&pred, ^{
        library=[[ALAssetsLibrary alloc] init];
    }
    );
    return library;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _assets =[ @[] mutableCopy];
    __block NSMutableArray *tmpAssets = [@[] mutableCopy];
    //1
    ALAssetsLibrary *assetsLibrary = [ JRViewController defaultAssetsLibaray];
    //2
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
                                 usingBlock:^(ALAssetsGroup *group, BOOL *stop){
                                     [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                         if (result) {
                                             //3
                                             [tmpAssets addObject:result];
                                         }
                                         
                                     }];
                                     //4
                                     self.assets=tmpAssets;
                                     
                                     //5
                                     [self.collectionView reloadData];
                                 }
                               failureBlock: ^(NSError * error){
                                   NSLog(@"Error Loading Photos %@", error);
                               }];
 

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - CollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.assets.count;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell =(UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    ALAsset *assets = self.assets[indexPath.row];
    cell.backgroundColor=[UIColor greenColor];
    
    return cell;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


@end
