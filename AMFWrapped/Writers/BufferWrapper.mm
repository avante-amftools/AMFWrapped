//
//  BufferWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 10/11/23.
//

#import "BufferWrapper.h"
#import "BufferWrapper+.h"

#import "ModelNodeWrapper+.h"

#include "Buffer.hpp"

using namespace AMFCore;

@implementation BufferWrapper

- (id) initWithBufferPtr: (AMFCore::BufferPtr) bufferPtr
{
    if (self = [super init])
    {
        self.bufferPtr = bufferPtr;
        
        // Yes, I know - all this casting is bad, mmkay…
        //  It doesn't matter because NSData an immutable class.
        //  We do what we must, because we can.
        
        auto dataAsVoid = reinterpret_cast<void*>(const_cast<char*>(bufferPtr->data()));
        
        self.data = [NSData dataWithBytesNoCopy: dataAsVoid
                                         length: bufferPtr->length()
                                   freeWhenDone: NO];
    }
    
    return self;
}

- (void) dealloc
{
    self.bufferPtr = nullptr;
}

@end
