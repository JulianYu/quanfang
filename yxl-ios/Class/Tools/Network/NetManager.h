//
//  NetManager.h
//  xuanxiu-ios
//
//  Created by mac on 16/10/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define NetManagerShare [NetManager sharedAFManager]

/*! 使用枚举NS_ENUM:区别可判断编译器是否支持新式枚举,支持就使用新的,否则使用旧的 */
typedef NS_ENUM(NSUInteger, NetworkStatus)
{
    /*! 未知网络 */
    NetworkStatusUnknown           = 0,
    /*! 没有网络 */
    NetworkStatusNotReachable,
    /*! 手机自带网络 */
    NetworkStatusReachableViaWWAN,
    /*! wifi */
    NetworkStatusReachableViaWiFi
};

/*！定义请求类型的枚举 */
typedef NS_ENUM(NSUInteger, HttpRequestType)
{
    /*! get请求 */
    HttpRequestTypeGet = 0,
    /*! post请求 */
    HttpRequestTypePost,
    /*! put请求 */
    HttpRequestTypePut,
    /*! delete请求 */
    HttpRequestTypeDelete
    
    
};

/*! 定义请求成功的block */
typedef void( ^ ResponseSuccess)(id response);
/*! 定义请求失败的block */
typedef void( ^ ResponseFail)(NSError *error);
/*! 定义上传进度block */
typedef void( ^ UploadProgress)(int64_t bytesProgress,
                                  int64_t totalBytesProgress);
/*! 定义下载进度block */
typedef void( ^ DownloadProgress)(int64_t bytesProgress,
                                    int64_t totalBytesProgress);

/*!
 *  方便管理请求任务。执行取消，暂停，继续等任务.
 *  - (void)cancel，取消任务
 *  - (void)suspend，暂停任务
 *  - (void)resume，继续任务
 */
typedef NSURLSessionTask URLSessionTask;




@interface NetManager : NSObject
//SingletonH(NetManager*)

/*! 获取当前网络状态 */
@property (nonatomic, assign) NetworkStatus   netWorkStatus;

/*!
 *  开启网络监测
 */
+ (void)startNetWorkMonitoring;

/*!
 *  网络请求方法,block回调
 *
 *  @param type         get / post
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param successBlock 请求成功的回调
 *  @param failureBlock 请求失败的回调
 *  @param progress 进度
 */
+ (URLSessionTask *)requestWithType:(HttpRequestType)type
                               UrlString:(NSString *)urlString
                              Parameters:(NSDictionary *)parameters
                            SuccessBlock:(ResponseSuccess)successBlock
                            FailureBlock:(ResponseFail)failureBlock
                                progress:(DownloadProgress)progress;

/*!
 *  上传图片(多图)
 *
 *  @param parameters   上传图片预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @param fileName     上传的图片数组fileName
 *  @param urlString    上传的url
 *  @param successBlock 上传成功的回调
 *  @param failureBlock 上传失败的回调
 *  @param progress     上传进度
 */
+ (URLSessionTask *)uploadImageWithUrlString:(NSString *)urlString
                                       parameters:(NSDictionary *)parameters
                                       ImageArray:(NSArray *)imageArray
                                         FileName:(NSString *)fileName
                                     SuccessBlock:(ResponseSuccess)successBlock
                                      FailurBlock:(ResponseFail)failureBlock
                                   UpLoadProgress:(UploadProgress)progress;

/*!
 *  视频上传
 *
 *  @param operations   上传视频预留参数---视具体情况而定 可移除
 *  @param videoPath    上传视频的本地沙河路径
 *  @param urlString     上传的url
 *  @param successBlock 成功的回调
 *  @param failureBlock 失败的回调
 *  @param progress     上传的进度
 */
+ (void)uploadVideoWithUrlString:(NSString *)urlString
                         parameters:(NSDictionary *)parameters
                          VideoPath:(NSString *)videoPath
                       SuccessBlock:(ResponseSuccess)successBlock
                       FailureBlock:(ResponseFail)failureBlock
                     UploadProgress:(UploadProgress)progress;

/*!
 *  文件下载
 *
 *  @param operations   文件下载预留参数---视具体情况而定 可移除
 *  @param savePath     下载文件保存路径
 *  @param urlString        请求的url
 *  @param successBlock 下载文件成功的回调
 *  @param failureBlock 下载文件失败的回调
 *  @param progress     下载文件的进度显示
 */
+ (URLSessionTask *)downLoadFileWithUrlString:(NSString *)urlString
                                        parameters:(NSDictionary *)parameters
                                          SavaPath:(NSString *)savePath
                                      SuccessBlock:(ResponseSuccess)successBlock
                                      FailureBlock:(ResponseFail)failureBlock
                                  DownLoadProgress:(DownloadProgress)progress;



@end
