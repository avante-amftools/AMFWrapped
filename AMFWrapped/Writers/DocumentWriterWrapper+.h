//
//  DocumentWriterWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 10/10/23.
//

#import "DocumentWriterWrapper.h"
#import "ModelElementWrapper+.h"

#include "DocumentWriterPtr.hpp"
#include "BufferWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface DocumentWriterWrapper ()

@property (nonatomic, assign, readwrite) AMFCore::DocumentWriterPtr documentWriterPtr;

@property (nonatomic, strong, readwrite) BufferWrapper* buffer;

- (id) initWithDocumentWriterPtr: (AMFCore::DocumentWriterPtr) documentWriterPtr;

@end

NS_ASSUME_NONNULL_END
