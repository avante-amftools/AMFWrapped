//
//  DocumentReaderWrapper+.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "DocumentReaderWrapper.h"

#include "DocumentReaderPtr.hpp"

NS_ASSUME_NONNULL_BEGIN

@interface DocumentReaderWrapper ()

@property (nonatomic, assign, readwrite) AMFCore::DocumentReaderPtr documentReaderPtr;

- (id) initWithDocumentReaderPtr: (AMFCore::DocumentReaderPtr) DocumentReaderPtr;

@end

NS_ASSUME_NONNULL_END
