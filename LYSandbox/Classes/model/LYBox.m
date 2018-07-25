//
//  LYBox.m
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

#import "LYBox.h"
#import <FCFileManager/FCFileManager.h>


@implementation LYBox

// MARK: - INIT

- (instancetype)initWithName:(NSString *)boxName {
	if (self = [super init]) {
		_name = boxName;
		_path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", _name];
	}
	return self;
}

- (instancetype)initWithPath:(NSString *)boxPath {
	if (self = [super init]) {
		_path = boxPath;
		_name = [boxPath lastPathComponent];
	}
	return self;
}

- (instancetype)init {
	if (self = [super init]) {
		_name = NSStringFromClass([self class]);
		_path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", _name];
	}
	return self;
}

// MARK: - METHOD

- (NSArray *)files {
	
	if ([FCFileManager isDirectoryItemAtPath:_path] == NO) {
		return nil;
	}
	
	return [[FCFileManager listFilesInDirectoryAtPath:_path] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSUInteger)numberOfFiles {
	return [[self files] count];
}

// MARK: - OVERRIDE

- (NSString *)description {
	return [NSString stringWithFormat:@"\n\nLYBox\n\tName\t%@\n\tPath\t%@\n", _name, _path];
}

@end
