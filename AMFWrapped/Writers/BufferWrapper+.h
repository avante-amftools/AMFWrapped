//
//  BufferWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 10/11/23.
//
//  This is used to associate a Buffer with its objective C
//      equivalent (NSData), so the the two can share memory,
//      and when the NSData object is disposed, the Buffer
//      is freed.

#import "BufferWrapper.h"
#import "ModelElementWrapper+.h"

#include "BufferPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface BufferWrapper ()

@property (nonatomic, assign) AMFCore::BufferPtr bufferPtr;

@property (nonatomic, strong, readwrite) NSData* data;

- (id) initWithBufferPtr: (AMFCore::BufferPtr) bufferPtr;

@end

NS_ASSUME_NONNULL_END
