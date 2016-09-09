//
//  UIButton+FAImageFromURL.m
//  Gloocall
//
//  Created by Fadi on 16/11/15.
//  Copyright © 2015 Apprikot. All rights reserved.
//

#import "UIButton+FAImageFromURL.h"

@implementation UIButton (FAImageFromURL)
static NSCache *cache;
+(NSCache*) getCache
{
    return cache;
}
+(void) setCache:(NSCache*)Cache
{
    cache = Cache;
}
-(void) setImageWithURL:(NSString*)URL
{
    @try {
        
        if ([URL isEqual:[NSNull null]] || !URL) {
            [self setImage:nil forState:UIControlStateNormal];
            return;
        }
        
        if (!cache) {
            cache = [[NSCache alloc]init];
        }
        
        if ([cache objectForKey:URL]) {
            [self setImage:[cache objectForKey:URL] forState:UIControlStateNormal];
        } else {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
            dispatch_async(queue, ^{
                //To Do in background
                NSString *Path = [self pathToImageWithKey:URL];
                UIImage *imageFromURL = [self imageFromDisk:Path];
                if ([[NSFileManager defaultManager] fileExistsAtPath:Path])
                {
                    imageFromURL = [self imageFromDisk:Path];
                }
                else
                {
                    imageFromURL = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:URL] options:NSDataReadingUncached error:nil]];
                    [self saveImageToDisk:imageFromURL withKey:Path];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    // update in main thread
                    [self setImage:imageFromURL forState:UIControlStateNormal];
                    if(imageFromURL)
                    [cache setObject:imageFromURL forKey:URL];
                });
            });
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    }
    @finally {
        
    }
}

- (void)saveImageToDisk:(UIImage *)image withKey:(NSString *)path
{
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:path atomically:YES];
}

- (UIImage *)imageFromDisk:(NSString *)path
{
    return [UIImage imageWithContentsOfFile:path];
}


- (NSString *)pathToImageWithKey:(NSString *)key
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths firstObject];
    path = [path stringByAppendingPathComponent:@"CachImage"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        [fileManager createDirectoryAtPath:path
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:nil];
    
    NSArray *array = [key componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":/"]];
    for (int i = 0; i < array.count; i++) {
        NSString *s = array[i];
        if (s.length == 0) {
            continue;
        }
        path = [path stringByAppendingPathComponent:s];
        if (i != array.count -1 && ![fileManager fileExistsAtPath:path]) {
            [fileManager createDirectoryAtPath:path
                   withIntermediateDirectories:NO
                                    attributes:nil
                                         error:nil];
        }
    }
    return path;
}



@end
