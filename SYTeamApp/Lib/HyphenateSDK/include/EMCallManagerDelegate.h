/*!
 *  \~chinese
 *  @header EMCallManagerDelegate.h
 *  @abstract 此协议定义了实时语音/视频相关的回调
 *  @author Hyphenate
 *  @version 3.00
 *
 *  \~english
 *  @header EMCallManagerDelegate.h
 *  @abstract This protocol defined the callbacks of real time voice/video
 *  @author Hyphenate
 *  @version 3.00
 */

#import <Foundation/Foundation.h>

#import "EMCallSession.h"

@class EMError;

/*!
 *  \~chinese 
 *  实时语音/视频相关的回调
 *
 *  \~english
 *  Callbacks of real time voice/video
 */
@protocol EMCallManagerDelegate <NSObject>
    
@optional

/*!
 *  \~chinese 
 *  用户A拨打用户B，用户B会收到这个回调
 *
 *  @param aSession  会话实例
 *
 *  \~english
 *  User B will receive this callback after user A dial user B
 *
 *  @param aSession  Session instance
 */
- (void)didReceiveCallIncoming:(EMCallSession *)aSession;

/*!
 *  \~chinese 
 *  通话通道建立完成，用户A和用户B都会收到这个回调
 *
 *  @param aSession  会话实例
 *
 *  \~english
 *  Both user A and B will receive this callback after connection is established
 *
 *  @param aSession  Session instance
 */
- (void)didReceiveCallConnected:(EMCallSession *)aSession;

/*!
 *  \~chinese 
 *  用户B同意用户A拨打的通话后，用户A会收到这个回调
 *
 *  @param aSession  会话实例
 *
 *  \~english
 *  User A will receive this callback after user B accept A's call
 *
 *  @param aSession
 */
- (void)didReceiveCallAccepted:(EMCallSession *)aSession;

/*!
 *  \~chinese
 *  1. 用户A或用户B结束通话后，对方会收到该回调
 *  2. 通话出现错误，双方都会收到该回调
 *
 *  @param aSession  会话实例
 *  @param aReason   结束原因
 *  @param aError    错误
 *
 *  \~english
 *  1.The another peer will receive this callback after user A or user B terminate the call.
 *  2.Both user A and B will receive this callback after error occur.
 *
 *  @param aSession  Session instance
 *  @param aReason   Terminate reason
 *  @param aError    Error
 */
- (void)didReceiveCallTerminated:(EMCallSession *)aSession
                          reason:(EMCallEndReason)aReason
                           error:(EMError *)aError;


@end
