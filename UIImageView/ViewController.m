//
//  ViewController.m
//  UIImageView
//
//  Created by zhangys on 15/12/18.
//  Copyright © 2015年 zhangys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImage * image1;
@property (nonatomic, strong) UIImage * image2;
@property (nonatomic, strong) UIImage * image3;
@property (nonatomic, strong) UIImageView * imageView1;
@property (nonatomic, strong) UIImageView * imageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareImage];
    [self staticImageShow];
    [self dynamicImageShow];
}

/**
 *  0：准备图片
 */
- (void)prepareImage
{
    self.image1 = [UIImage imageNamed:@"apple1"];
    self.image2 = [UIImage imageNamed:@"apple2"];
    self.image3 = [UIImage imageNamed:@"apple3"];
}

/**
 *  1：静态图片展示
 */
- (void)staticImageShow
{
    //1：UIImageView自己独有的初始化方法
    self.imageView1 = [[UIImageView alloc] initWithImage:self.image1];
    //2：这里imageView1的frame如果不设置，imageView1的frame就会默认为image1的frame，根据需要设置
    self.imageView1.frame = CGRectMake(100, 100, 100, 100);//设置frame属性，从UIView继承过来的属性
    self.imageView1.image = self.image2;//imageView1的图片可以通过image后期进行设置
    //3：用户交互属性
    self.imageView1.userInteractionEnabled = YES;//，默认是NO，如果需要加手势要设置为YES
    [self.view addSubview:self.imageView1];//父视图来添加子视图
}


/**
 *  2：动态图片展示
 */
- (void)dynamicImageShow
{
    //1：使用从UIView继承来的方法实例化
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    //2：设置属性animationImages，是一个数组
    self.imageView2.animationImages = @[self.image1, self.image2, self.image3];
    self.imageView2.animationRepeatCount = 100;//动画重复次数，默认是0（切记：0是无穷大），默认会无限重复
    self.imageView2.animationDuration = 1;//设置一次动画持续的时间。
    [self.imageView2 startAnimating];//开启动画，动画必须手动开启
//    [self.imageView2 stopAnimating];//关闭动画，可以在需要的时候手动关闭
    [self.view addSubview:self.imageView2];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
