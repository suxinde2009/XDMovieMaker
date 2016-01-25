//
//  ViewController.m
//  XDMovieMaker
//
//  Created by Su XinDe on 16/1/25.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "ViewController.h"
#import "XDMovieMaker.h"

@interface ViewController ()
@property (nonatomic, strong) XDMovieMaker *movieMaker;
@end

@implementation ViewController

// Doc文件夹
+ (NSString *)documentDirectory
{
    NSArray * objPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *docDirPath = [objPaths objectAtIndex:0];
    return docDirPath;
}

+ (NSString *)subDirInDoc:(NSString *)dirName
{
    NSString *docDirPath = [[self class] documentDirectory];
    NSString *tmpRecorderDirPath = [docDirPath stringByAppendingPathComponent:dirName];
    return tmpRecorderDirPath;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *writeFileName = [[self class] subDirInDoc:@"Test.mp4"];
    self.movieMaker = [XDMovieMaker createMovieAtPath:writeFileName frameSize:CGSizeMake(320, 320) fps:10.0f];
    
    for (int i = 0; i < 100; i++) {
        [self addImageToMovie];
    }
    
}


- (void)addImageToMovie
{
    UIImage *image = [UIImage imageNamed:@"IMG_5641.jpg"];
    [self.movieMaker addImageToMovie:image];
}

- (IBAction)test {
    [self.movieMaker finalizeMovie];

}

@end
