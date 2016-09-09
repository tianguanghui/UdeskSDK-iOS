//
//  UdeskVoiceRecodView.h
//  UdeskSDK
//
//  Created by xuchen on 16/8/23.
//  Copyright © 2016年 xuchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UdeskVoiceRecordViewDelegate <NSObject>

- (void)finishRecordedWithAudioPath:(NSString *)path withAudioDuration:(NSString *)duration;

- (void)speakDurationTooShort;

@end

@interface UdeskVoiceRecordView : UIView

@property (nonatomic, weak) id <UdeskVoiceRecordViewDelegate> delegate;

@end
