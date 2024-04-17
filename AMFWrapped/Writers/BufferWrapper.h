//
//  WriteBufferWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 10/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BufferWrapper : NSObject

@property (nonatomic, readonly) NSData* data;

@end

NS_ASSUME_NONNULL_END
