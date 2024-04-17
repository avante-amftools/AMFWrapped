//
//  DocumentWriterWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 10/10/23.
//

#import "DocumentWriterWrapper.h"
#import "DocumentWriterWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelRootWrapper+.h"
#import "BufferWrapper+.h"

#include "DocumentWriter.hpp"
#include "Buffer.hpp"

using namespace AMFCore;

@implementation DocumentWriterWrapper

+ (void) initialize
{
    DocumentWriter::initialize();
}

+ (DocumentWriterWrapper*) documentWriterWithModelRoot: (ModelRootWrapper*) root
                                              fileType: (NSString*) fileType
{
    auto documentWriterPtr = AMFCore::DocumentWriter::newDocumentWriter(root.modelRootPtr, fileType.UTF8String);
    
    if (documentWriterPtr != NULL)
    {
        return [[self alloc] initWithDocumentWriterPtr: documentWriterPtr];
    }
    
    return NULL;
}

- (id) initWithDocumentWriterPtr: (AMFCore::DocumentWriterPtr) documentWriterPtr
{
    if (self = [super init])
    {
        self.documentWriterPtr = documentWriterPtr;
    }
    
    return self;
}

- (NSData*) data
{
    return self.buffer.data;
}

- (BufferWrapper*) buffer
{
    if (_buffer == NULL)
    {
        auto bufferPtr = self.documentWriterPtr->toDocument();
        
        _buffer = [[BufferWrapper alloc] initWithBufferPtr: bufferPtr];
    }
    
    return _buffer;
}

@end
