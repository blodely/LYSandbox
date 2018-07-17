//
//  LYCat.m
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 2018-07-17.
//  Copyright (c) 2018 blodely. All rights reserved.
//

#import "LYCat.h"

@implementation LYCat

- (NSString *)filename {
	return [[[self fileURL] path] lastPathComponent]; 
}

- (UIImage *)thumbnail {
	return nil;
}

@end
