//
//  ModelMetadataWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 4/12/23.
//

#import "ModelMetadataWrapper.h"
#import "ModelMetadataWrapper+.h"

#import "ModelNodeWrapper+.h"
//#import "Model<#Thing#>Wrapper+.h"

#include "ModelMetadata.hpp"

using namespace AMFCore;

@implementation ModelMetadataWrapper

+ (void) initialize
{
    ModelMetadata::initialize();
}

- (id) initWithModelMetadataPtr: (AMFCore::ModelMetadataPtr) ModelMetadataPtr
{
    return [super initWithModelElementPtr: ModelMetadataPtr];
}

- (NSString*) type
{
    return [NSString stringWithUTF8String: self.modelMetadataPtr->type().c_str()];
}

- (void) setType:(NSString *)type
{
    self.modelMetadataPtr->setType(type.UTF8String);
}

- (NSString*) value
{
    return [NSString stringWithUTF8String: self.modelMetadataPtr->valueAsString().c_str()];
}

- (void) setValue:(NSString *)value
{
    self.modelMetadataPtr->setValueAsString(value.UTF8String);
}

- (ModelMetadataPtr) modelMetadataPtr
{
    return std::dynamic_pointer_cast<ModelMetadata>(self.modelNodePtr);
}

#if 0
- (NSArray<Model<#Thing#>Wrapper*>*) <#thing#>s
{
    NSMutableArray<Model<#Thing#>Wrapper*>* result = [[NSMutableArray<Model<#Thing#>Wrapper*> alloc] init];
    
    auto <#thing#>s = self.ModelMetadataPtr-><#thing#>s();
    
    for (auto i = <#thing#>s.begin(); i != <#thing#>s.end(); i++)
    {
        Model<#Thing#>Wrapper* <#thing#> = [[Model<#Thing#>Wrapper alloc] initWithModel<#Thing#>Ptr: *i];
        
        [result addObject: <#thing#>];
    }
    
    return result;
}
#endif

@end
