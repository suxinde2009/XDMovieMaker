//
//  XDMovieMaker.h
//  XDMovieMaker
//
//  Created by Su XinDe on 16/1/25.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreFoundation/CoreFoundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void (^ContextDrawingBlock)(CGContextRef context);

@interface XDMovieMaker : NSObject

+ (BOOL)preparePath:(NSString *)moviePath;

+ (instancetype)createMovieAtPath:(NSString *)moviePath
                        frameSize:(CGSize)size
                              fps:(NSUInteger)framesPerSecond __attribute__ ((nonnull (1)));

- (BOOL)drawToPixelBufferWithBlock:(ContextDrawingBlock)block __attribute__ ((nonnull));

- (BOOL)appendPixelBuffer;

- (BOOL)addImageToMovie:(UIImage *) image __attribute__ ((nonnull));

- (BOOL)addDrawingToMovie:(ContextDrawingBlock)drawingBlock __attribute__ ((nonnull));

- (void)finalizeMovie;

@end
