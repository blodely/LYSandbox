//
//  LYSandbox.h
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

#import <Foundation/Foundation.h>
#import <LYSandbox/LYBox.h>
#import <LYSandbox/LYCat.h>


@interface LYSandbox : NSObject

@property (nonatomic, strong, readonly) NSString *pathDocuments;

/**
 singleton

 @return instance
 */
+ (instancetype)sandbox;

// MARK: - QUERY

/**
 get boxes in documents folder

 @return array of boxes
 */
- (NSArray *)boxes;

/**
 get all cats in box

 @param box the box to query
 @return array of cats
 */
- (NSArray *)catsInBox:(LYBox *)box;

// MARK: - CHECK

/**
 check if box exist

 @param box the box to check
 @return exist or not
 */
- (BOOL)existBox:(LYBox *)box;

// MARK: - ADD

//- (void)putCat:(LYCat *)cat inBox:(LYBox *)box;

/**
 put box in box

 @param box item to be placed
 @param largerBox container box
 */
- (void)putBox:(LYBox *)box inBox:(LYBox *)largerBox;

@end
