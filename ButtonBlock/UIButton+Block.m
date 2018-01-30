//
//  UIButton+Block.m
//  ButtonBlock
//
//  Created by 朱佳男 on 2018/1/5.
//  Copyright © 2018年 ShangYuKeJi. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/message.h>
static const char *key = "actionKey";
static const char *key2 = "propertyKey";
@implementation UIButton (Block)
+(UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ButtonActionBlock)actionBlock{
    UIButton *button = [[UIButton alloc]init];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, key, actionBlock, OBJC_ASSOCIATION_COPY);
    return button;
}
-(void)buttonClick:(UIButton *)button{
    ButtonActionBlock actionBlock1 = objc_getAssociatedObject(button, key);
    if (actionBlock1) {
        actionBlock1(button);
    }
    
    ButtonActionBlock actionBlock2 = self.actionBlock;
    if (actionBlock2) {
        actionBlock2(button);
    }
}
-(void)setActionBlock:(ButtonActionBlock)actionBlock{
    objc_setAssociatedObject(self, key2, actionBlock, OBJC_ASSOCIATION_COPY);
}
-(ButtonActionBlock)actionBlock{
    return objc_getAssociatedObject(self, key2);
}
@end
