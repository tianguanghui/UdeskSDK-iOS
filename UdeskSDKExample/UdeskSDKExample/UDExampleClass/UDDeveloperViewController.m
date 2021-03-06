//
//  UDDeveloperViewController.m
//  UdeskSDK
//
//  Created by Udesk on 16/8/27.
//  Copyright © 2016年 Udesk. All rights reserved.
//

#import "UDDeveloperViewController.h"
#import "Udesk.h"
#import "UDCustomClientInfoViewController.h"
#import "UDAgentWebViewController.h"
#import "UdeskCustomButtonTestViewController.h"
#import "UdeskSmallViewTestViewController.h"
#import "UdeskRobotCustomInfoViewController.h"
#import "UdeskButtonConfigViewController.h"
#import "UdeskPreMessageViewController.h"

static NSString *kUdeskDeveloperCellId = @"kUdeskDeveloperCellId";

@interface UDDeveloperViewController()<UIActionSheetDelegate> {

    NSArray *_developerDataArray;
}

@end

@implementation UDDeveloperViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"UdeskSDK";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _developerDataArray = @[
                       @"指定分配客服",
                       @"指定分配客服组",
                       @"获取未读消息",
                       @"获取未读消息数量",
                       @"清空未读消息",
                       @"自定义客户信息",
                       @"更换UI模版",
                       @"添加咨询对象",
                       @"切换语言",
                       @"web客服",
                       @"配置自定义按钮",
                       @"小视频",
                       @"横竖屏兼容",
                       @"配置RobotModelKey",
                       @"自定义表情",
                       @"自定义机器人客户信息",
                       @"其他功能配置",
                       @"放弃排队方式",
                       @"预发消息",
                       ];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 60;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kUdeskDeveloperCellId];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _developerDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kUdeskDeveloperCellId forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _developerDataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取消点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            //指定分配客服
            [self assignedAgent];
            break;
        case 1:
            //指定分配客服组
            [self assignedGroup];
            break;
        case 2:
            //显示未读消息
            [self unreadMessage];
            break;
        case 3:
            //未读消息条数
            [self unreadMsgCount];
            break;
        case 4:
            //清空未读消息
            [self markUnreadMsg];
            break;
        case 5:
            //自定义客户信息
            [self customCustomerInfo];
            break;
        case 6:
            //更换sdk风格
            [self replaceSDKStyle];
            break;
        case 7:
            //咨询对象
            [self sdkProduct];
            break;
        case 8:
            //更换
            [self replaceLanguage];
            break;
        case 9:
            //web客服
            [self webAgent];
            break;
        case 10:
            //配置自定义按钮
            [self configCustomButton];
            break;
        case 11:
            //配置小视频
            [self configSmartVideo];
            break;
        case 12:
            //配置转向
            [self configSDKOrientation];
            break;
        case 13:
            //配置机器人key
            [self configRobotModelKey];
            break;
        case 14:
            //自定义表情
            [self customEmoji];
            break;
        case 15:
            //自定义机器人客户信息
            [self configRobotCustomerInfo];
            break;
        case 16:
            //配置其他功能
            [self sdkConfigOtherFeatures];
            break;
        case 17:
            //放弃排队方式
            [self configQuitQueueType];
            break;
        case 18:
            //配置预发
            [self configPreMessage];
            break;
        default:
            break;
    }
    
}

//指定分配客服
- (void)assignedAgent {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"指定分配客服" message:@"注意：如果你已经与客服对话并且客服没有结束你的会话，指定分配客服将会无效。\n如果需要设置本地指定分配，请关闭后台配置的客服导航栏菜单" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addTextFieldWithConfigurationHandler:nil];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *textField = alert.textFields.firstObject;
        if (textField.text.length) {
            
            UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
            sdkConfig.agentId = textField.text;
            
            UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
            [chatViewManager pushUdeskInViewController:self completion:nil];
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入ID" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//指定分配客服组
- (void)assignedGroup {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"指定分配客服组" message:@"注意：如果你已经与客服对话并且客服没有结束你的会话，指定分配客服将会无效。\n如果需要设置本地指定分配，请关闭后台配置的客服导航栏菜单" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addTextFieldWithConfigurationHandler:nil];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *textField = alert.textFields.firstObject;
        if (textField.text.length) {
            
            UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
            sdkConfig.groupId = textField.text;
            
            UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
            [chatViewManager pushUdeskInViewController:self completion:nil];
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入ID" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//未读消息
- (void)unreadMessage {
    
    NSArray *array = [UdeskManager getLocalUnreadeMessages];
    NSString *message;
    
    for (int i = 0; i<array.count; i++) {
        if (i<10) {
            UdeskMessage *model = array[i];
            if (!message) {
                message = [NSString stringWithFormat:@"1.%@",model.content];
            }
            else {
                message = [NSString stringWithFormat:@"%@\n%d.%@",message,i+1,model.content];
            }
        }
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"未读消息(这里只展示最近10条)" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

//未读消息条数
- (void)unreadMsgCount {
    
    NSString *title = [NSString stringWithFormat:@"当前会话有 %ld 条未读",(long)[UdeskManager getLocalUnreadeMessagesCount]];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

//清空未读消息
- (void)markUnreadMsg {
    
    [UdeskManager markAllMessagesAsRead];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"清空成功" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

//自定义客户信息
- (void)customCustomerInfo {
    
    UDCustomClientInfoViewController *custom = [[UDCustomClientInfoViewController alloc] init];
    [self.navigationController pushViewController:custom animated:YES];
}

//更换sdk风格
- (void)replaceSDKStyle {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换SDK UI" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (ud_isPad) {
        //ipad适配
        [alert setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
        popPresenter.sourceView = self.view;
        popPresenter.sourceRect = CGRectMake(self.view.center.x, 74, 1, 1);
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"原生" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:[UdeskSDKConfig customConfig]];
        [chatViewManager pushUdeskInViewController:self completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"经典" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle blueStyle] sdkConfig:[UdeskSDKConfig customConfig]];
        [chatViewManager pushUdeskInViewController:self completion:nil];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//咨询对象
- (void)sdkProduct {
    
    NSDictionary *dict = @{
                           @"productImageUrl":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528871600586&di=18c857085f6802867472d0e775d9e5c3&imgtype=0&src=http%3A%2F%2Fsi1.go2yd.com%2Fget-image%2F0Iy8A6XCq8G",
                           @"productTitle":@"测试测试测试测你测试测试测你测试测试测你测试测试测你测试测试测你测试测试测你！",
                           @"productDetail":@"¥88888.088888.088888.0",
                           @"productURL":@"http://www.baidu.com"
                           };
    UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
    sdkConfig.productDictionary = dict;
    
    UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
    [chatViewManager pushUdeskInViewController:self completion:nil];
}

//更换语言
- (void)replaceLanguage {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换SDK语言" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (ud_isPad) {
        //ipad适配
        [alert setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
        popPresenter.sourceView = self.view;
        popPresenter.sourceRect = CGRectMake(self.view.center.x, 74, 1, 1);
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
        sdkConfig.languageType = UDLanguageTypeCN;
        
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
        [chatViewManager pushUdeskInViewController:self completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Engilsh" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
        sdkConfig.languageType = UDLanguageTypeEN;
        
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
        [chatViewManager pushUdeskInViewController:self completion:nil];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//web客服
- (void)webAgent {
    
    UDAgentWebViewController *web = [[UDAgentWebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
}

//自定义配置按钮
- (void)configCustomButton {
    
    UdeskCustomButtonTestViewController *custom = [[UdeskCustomButtonTestViewController alloc] init];
    [self.navigationController pushViewController:custom animated:YES];
}

//配置小视频
- (void)configSmartVideo {
    
    UdeskSmallViewTestViewController *custom = [[UdeskSmallViewTestViewController alloc] init];
    [self.navigationController pushViewController:custom animated:YES];
}

//配置方向
- (void)configSDKOrientation {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"强制横竖屏" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (ud_isPad) {
        //ipad适配
        [alert setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
        popPresenter.sourceView = self.view;
        popPresenter.sourceRect = CGRectMake(self.view.center.x, 74, 1, 1);
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"竖屏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
        sdkConfig.orientationMask = UIInterfaceOrientationMaskPortrait;
        
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
        [chatViewManager presentUdeskInViewController:self completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"横屏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
        sdkConfig.orientationMask = UIInterfaceOrientationMaskLandscape;
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
        [chatViewManager presentUdeskInViewController:self completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

//配置RobotModelKey
- (void)configRobotModelKey {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"设置RobotModelKey" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addTextFieldWithConfigurationHandler:nil];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField *textField = alert.textFields.firstObject;
        if (textField.text.length) {
            UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
            sdkConfig.robotModelKey = textField.text;
            
            UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
            [chatViewManager pushUdeskInViewController:self completion:nil];
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请输入ID" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//自定义表情
- (void)customEmoji {
    
    UdeskEmojiPanelModel *model = [UdeskEmojiPanelModel new];
    model.emojiIcon = [UIImage imageNamed:@"likeSticker"];
    model.bundleURL = [[NSBundle mainBundle] URLForResource:@"Sticker" withExtension:@".bundle"];
    model.stickerTitles = @[@"愤怒",@"哭泣",@"糟糕",@"冷汗",@"大笑",@"可爱",@"爱",@"流汗",@"害羞",@"睡觉",@"惊讶",@"调皮"];
    
    UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
    sdkConfig.customEmojis = @[model];
    
    //初始化sdk
    UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
    [chatViewManager pushUdeskInViewController:self completion:nil];
}

//配置其他功能
- (void)sdkConfigOtherFeatures {
    
    UdeskButtonConfigViewController *config = [[UdeskButtonConfigViewController alloc] init];
    [self.navigationController pushViewController:config animated:YES];
}

//自定义机器人客户信息
- (void)configRobotCustomerInfo {
    
    UdeskRobotCustomInfoViewController *config = [[UdeskRobotCustomInfoViewController alloc] init];
    [self.navigationController pushViewController:config animated:YES];
}

//放弃排队方式
- (void)configQuitQueueType {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"放弃排队方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (ud_isPad) {
        //ipad适配
        [alert setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
        popPresenter.sourceView = self.view;
        popPresenter.sourceRect = CGRectMake(self.view.center.x, 74, 1, 1);
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"强制" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
        sdkConfig.quitQueueType = UDQuitQueueTypeForce;
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
        [chatViewManager pushUdeskInViewController:self completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"标记" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UdeskSDKConfig *sdkConfig = [UdeskSDKConfig customConfig];
        sdkConfig.quitQueueType = UDQuitQueueTypeForceMark;
        UdeskSDKManager *chatViewManager = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle] sdkConfig:sdkConfig];
        [chatViewManager pushUdeskInViewController:self completion:nil];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//配置预发消息
- (void)configPreMessage {
    
    UdeskPreMessageViewController *config = [[UdeskPreMessageViewController alloc] init];
    [self.navigationController pushViewController:config animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
}

@end
