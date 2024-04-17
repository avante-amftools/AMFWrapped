//
//  AMFWrapped.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/23/23.
//

#import "AMFWrapped.h"

#include "AMFCore.hpp"

#include "Color.hpp"

#include <algorithm>

@implementation AMFWrapped

+ (void) initialize
{
    static bool initialized = false;
    
    if (!initialized)
    {
        AMFCore::initialize();

        initialized = true;
    }
}

+ (void) initializeSTL
{
    static bool initialized = false;
    
    if (!initialized)
    {
        AMFCore::initializeSTL();
        
        initialized = true;
    }
}

@end
