//
//  ViewController.m
//  EasyActionSheet
//
//  Created by odm2 on 16/7/8.
//  Copyright © 2016年 odm2. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ActionSheetCell.h"
#import "CustomActionView.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong)CustomActionView  *actionView;



@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUI{
    UIButton *btn= [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 200, 40)];
    [self.view addSubview:btn];
    [btn setTitle:@"弹出自定义ActionSheet" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showSunView) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    
    
    
}
-(void)showSunView{
    //1.创建自定义view(拥有tableViewController属性,支持自定义tableViewController)
    CustomActionView *actionView= [[CustomActionView alloc]initWithFrame:self.view.bounds];
    self.actionView =actionView;
    actionView.tableViewController = [[UITableViewController alloc]init];
    [self.view addSubview:actionView];
    
    //2.创建自定义ActionSheetCell(可在ActionSheetCell文件中修改UI和布局)
    static NSString *reuseId =@"reuseId";
    
    ActionSheetCell *action1 = [[ActionSheetCell alloc]initWithTitle:@"拍照" imageName:@"拍照" style:ActionCellStyleDefault andReuseId:reuseId selectEvent:^{
        //cell选择事件
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"选择了第0行" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }];
    ActionSheetCell *action2 = [[ActionSheetCell alloc]initWithTitle:@"从相册选择" imageName:@"相册" style:ActionCellStyleDefault andReuseId:reuseId selectEvent:^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"选择了第1行" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }];
    ActionSheetCell *action3 = [[ActionSheetCell alloc]initWithTitle:@"晒已完成挑战" imageName:@"拍照" style:ActionCellStyleDefault andReuseId:reuseId selectEvent:^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"选择了第2行" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }];
    ActionSheetCell *action4 = [[ActionSheetCell alloc]initWithTitle:@"取消" imageName:@"取消" style:ActionCellStyleDestructive andReuseId:reuseId selectEvent:^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"选择了第3行" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }];
    
    
    
    //2.3传递cell数组给sunView对象
    self.actionView.cellArray = @[action1,action2,action3,action4];
    
    
    
    //4.动画展示自定义view
    [actionView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
