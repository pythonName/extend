//
//  ttViewController.m
//  extend
//
//  Created by loary on 2018/7/26.
//  Copyright © 2018年 eee. All rights reserved.
//

#import "ttViewController.h"

@interface ttViewController () {
    CGRect _frame;
}

@end

@implementation ttViewController

- (id)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        _frame = frame;
        
    }
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:_frame];
}
/*
    理解的思路：
 1.从ios7开始，所有的viewController的view当被添加到UINavigationController或者TabBarController这样的容器里时，默认view会被展开铺满整个手机屏幕，即会有view的顶部和底部处在navigationBar 和 tabBar下面被遮挡，为什么系统要这样搞呢？目的是为了是实现navigationBar和tabBar的毛玻璃透明的效果，也即viewController的edgesForExtendedLayout属性默认是All的形式，如果不需要铺满屏幕，指定该属性为UIRectEdgeNone
 2. 当基于上述默认的情况下，添加子视图到viewController的view时，顶部和底部会有部分被遮挡，但这里有个例外，UIScrollView系的视图被添加时，其默认会有一个bonds原点origin.y的偏移，-88这样的，这导致UIScrollView系视图（uiscrollView、TableView、TextView）上的子视图不会被navigationBar遮挡，但UIScrollView系视图本身还是被遮挡了一部分的，如果要关闭这个特性，写：
     if (@available(iOS 11.0, *)) {
        sc.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
     } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
     }
3. viewController的view在初始创建时可以不指定size，其大小会由系统自动计算，其上的子视图创建最好在viewDidLayoutSubviews创建，此时才能获得view的大小
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor greenColor];
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 812)];
    sc.backgroundColor = [UIColor redColor];
    [self.view addSubview:sc];
    
    UILabel *ll = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    ll.text =@"sfsfdsf";
    //[self.view addSubview:ll];
    [sc addSubview:ll];
    
    UILabel *pp = [[UILabel alloc] initWithFrame:CGRectMake(0, 812-100, 100, 100)];
    pp.text =@"sfsfdsf";
    //[self.view addSubview:ll];
    [sc addSubview:pp];
    
//    if (@available(iOS 11.0, *)) {
//        sc.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        // Fallback on earlier versions
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    }
}
- (void)viewDidLayoutSubviews {}
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
