//
//  DocumentReaderWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "DocumentReaderWrapper.h"
#import "DocumentReaderWrapper+.h"
#import "ModelRootWrapper+.h"

#include "DocumentReader.hpp"
#include "ModelRoot.hpp"

using namespace AMFCore;

@implementation DocumentReaderWrapper

+ (void) initialize
{
    DocumentReader::initialize();
}

+ (DocumentReaderWrapper*) documentReaderWithData: (NSData*) data
                                         fileType: (NSString*) fileType
{
    const char* buffer = reinterpret_cast<const char*>(data.bytes);
    const uint64_t bufferLength = data.length;
    
    auto documentReaderPtr = AMFCore::DocumentReader::newDocumentReader(buffer, bufferLength, fileType.UTF8String);
    
    if (documentReaderPtr != NULL)
    {
        return [[self alloc] initWithDocumentReaderPtr: documentReaderPtr];
    }
    
    return NULL;
}

- (id) initWithDocumentReaderPtr: (AMFCore::DocumentReaderPtr) documentReaderPtr
{
    if (self = [super init])
    {
        self.documentReaderPtr = documentReaderPtr;
    }
    
    return self;
}

- (ModelRootWrapper*) fromFile
{
    auto modelElementPtr = self.documentReaderPtr->fromDocument();
    
    // modelElementPtr->debugShow();

    auto modelRootPtr = std::dynamic_pointer_cast<ModelRoot>(modelElementPtr);
    
    return [[ModelRootWrapper alloc] initWithModelRootPtr: modelRootPtr];
}

@end
