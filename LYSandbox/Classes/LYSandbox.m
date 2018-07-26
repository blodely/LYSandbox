//
//  LYSandbox.m
//  LYSandbox
//
//  Created by Luo Yu(blodely, blodely@gmail.com) on 2018-07-17.
//  Copyright (c) 2018 blodely <blodely@gmail.com>. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "LYSandbox.h"
#import <FCFileManager/FCFileManager.h>


@interface LYSandbox () {}
@end

@implementation LYSandbox

// MARK: - INIT

+ (instancetype)sandbox {
	static LYSandbox *sharedBox;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedBox = [[LYSandbox alloc] init];
	});
	return sharedBox;
}

- (instancetype)init {
	if (self = [super init]) {
		
	}
	return self;
}

// MARK: - METHOD

// MARK: QUERY

- (NSArray *)boxes {

	NSMutableArray *boxes = [NSMutableArray arrayWithCapacity:1];
	for (NSString *item in [FCFileManager listDirectoriesInDirectoryAtPath:self.pathDocuments]) {
		// VALID FOLDER
		[boxes addObject:[[LYBox alloc] initWithPath:item]];
	}
	
	if ([boxes count] < 1) {
		return nil;
	} else {
		[boxes sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],]];
	}
	
	return [NSArray arrayWithArray:boxes];
}

- (NSArray *)boxesInBox:(LYBox *)box {
	
	NSMutableArray *boxes = [NSMutableArray arrayWithCapacity:1];
	for (NSString *item in [FCFileManager listDirectoriesInDirectoryAtPath:box.path]) {
		[boxes addObject:[[LYBox alloc] initWithPath:item]];
	}
	
	if ([boxes count] < 1) {
		// NONE
		return nil;
	} else {
		// SORT
		[boxes sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],]];
	}
	
	return [NSArray arrayWithArray:boxes];
}

- (NSArray *)catsInBox:(LYBox *)box {
	
	NSString *pathToRead;
	
	if (box == nil) {
		// CATS OUTSIDE BOX
		pathToRead = self.pathDocuments;
	} else {
		// CATS IN THE BOX
		if ([self existBox:box] == NO) {
			NSLog(@"NO BOX : %@", box);
			return nil;
		} else  {
			pathToRead = box.path;
		}
	}
	
	NSMutableArray *cats = [NSMutableArray arrayWithCapacity:1];
	for (NSString *item in [FCFileManager listFilesInDirectoryAtPath:pathToRead]) {
		[cats addObject:[[LYCat alloc] initWithPath:item]];
	}
	
	if ([cats count] < 1) {
		return nil;
	} else {
		[cats sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES],]];
	}
	
	return [NSArray arrayWithArray:cats];
}

// MARK: CHECK

- (BOOL)existBox:(LYBox *)box {
	return [FCFileManager isDirectoryItemAtPath:[self.pathDocuments stringByAppendingFormat:@"/%@", box.name]];
}

// MARK: ADD

- (void)putCat:(LYCat *)cat inBox:(LYBox *)box {
	
	// TODO: DEFINE CAT?
}

- (void)putBox:(LYBox *)box inBox:(LYBox *)largerBox {
	
	if (largerBox == nil) {
		// PUT IT IN DOCUMENTS FOLDER
		[FCFileManager createDirectoriesForPath:[NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", box.name]];
		return;
	}
	
	// PLACE BOX
	[FCFileManager createDirectoriesForPath:[largerBox.path stringByAppendingFormat:@"/%@", box.name]];
}

// MARK: - PROPERTIES

- (NSString *)pathDocuments {
	return [NSHomeDirectory() stringByAppendingString:@"/Documents"];
}

@end
