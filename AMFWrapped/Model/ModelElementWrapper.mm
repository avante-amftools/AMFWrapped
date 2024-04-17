//
//  ModelElementWrapper.mm
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelElementWrapper.h"
#import "ModelElementWrapper+.h"

#import "ModelNodeWrapper+.h"
#import "ModelAttributeWrapper+.h"

#include "ModelElement.hpp"
#include "ModelAttribute.hpp"
#include "ModelColor.hpp"
#include "ModelMetadata.hpp"

#include "ModelColorWrapper+.h"
#include "ModelMetadataWrapper+.h"

using namespace AMFCore;

@implementation ModelElementWrapper

+ (void) initialize
{
    ModelElement::initialize();
}

- (id) initWithModelElementPtr: (AMFCore::ModelElementPtr) modelElementPtr
{
    return [super initWithModelNodePtr: modelElementPtr];
}

- (ModelElementPtr) modelElementPtr
{
    return std::dynamic_pointer_cast<ModelElement>(self.modelNodePtr);
}

- (NSString*) value
{
    return [NSString stringWithUTF8String: self.modelElementPtr->valueAsString().c_str()];
}

- (NSArray<ModelElementWrapper*>*) elementNodes
{
    NSMutableArray<ModelElementWrapper*>* result = [[NSMutableArray<ModelElementWrapper*> alloc] init];
    
    auto elements = self.modelElementPtr->elements();
    
    for (auto i = elements.begin(); i != elements.end(); i++)
    {
        ModelElementWrapper* element = [[ModelElementWrapper alloc] initWithModelElementPtr: *i];
        
        [result addObject: element];
    }
    
    return result;
}

- (NSArray<ModelAttributeWrapper*>*) attributeNodes
{
    NSMutableArray<ModelAttributeWrapper*>* result = [[NSMutableArray<ModelAttributeWrapper*> alloc] init];
    
    auto attributes = self.modelElementPtr->attributes();
    
    for (auto i = attributes.begin(); i != attributes.end(); i++)
    {
        ModelAttributeWrapper* attribute = [[ModelAttributeWrapper alloc] initWithModelAttributePtr: *i];
        
        [result addObject: attribute];
    }
    
    return result;
}

- (NSArray<ModelNodeWrapper*>*) detailNodes
{
    NSMutableArray<ModelNodeWrapper*>* result = [[NSMutableArray<ModelNodeWrapper*> alloc] init];
    
    auto details = self.modelElementPtr->modelDetails();
    
    for (auto i = details.begin(); i != details.end(); i++)
    {
        ModelColorPtr modelColor = std::dynamic_pointer_cast<ModelColor>(*i);
        
        if (modelColor != nullptr)
        {
            ModelColorWrapper* detail = [[ModelColorWrapper alloc] initWithModelColorPtr: modelColor];
            
            [result addObject: detail];
        }
        
        ModelMetadataPtr modelMetadata = std::dynamic_pointer_cast<ModelMetadata>(*i);
        if (modelMetadata != nullptr)
        {
            ModelMetadataWrapper* detail = [[ModelMetadataWrapper alloc] initWithModelMetadataPtr: modelMetadata];
            
            [result addObject: detail];
        }

        ModelAttributePtr modelAttribute = std::dynamic_pointer_cast<ModelAttribute>(*i);
        
        if (modelAttribute != nullptr)
        {
            ModelAttributeWrapper* detail = [[ModelAttributeWrapper alloc]
                                             initWithModelAttributePtr: modelAttribute];
            [result addObject: detail];
        }
    }
    
    return result;
}

- (NSArray<ModelMetadataWrapper*>*) metadataNodes
{
    NSMutableArray<ModelMetadataWrapper*>* result = [[NSMutableArray<ModelMetadataWrapper*> alloc] init];
    
    auto modelMetadatas = self.modelElementPtr->modelMetadatas();
    
    for (auto i = modelMetadatas.begin(); i != modelMetadatas.end(); i++)
    {
        ModelMetadataWrapper* metadata = [[ModelMetadataWrapper alloc] initWithModelMetadataPtr: *i];
        
        [result addObject: metadata];
    }
    
    return result;
}

- (ModelMaterialWrapper*) materialNode
{
    return NULL;
}

#if 0
- (void) debugShow: (NSString*) indent
{
#if 1
    NSLog(@"%@ %@", self.identifier, self.value);
    
    for (ModelElementWrapper* elementNode in self.elementNodes)
    {
        [elementNode debugShow: [NSString stringWithFormat: @"%@ ", indent]];
    }
    
    for (ModelAttributeWrapper* attributeNode in self.attributeNodes)
    {
        [attributeNode debugShow: [NSString stringWithFormat: @"%@ ", indent]];
    }
#endif
}
#endif

- (void) debugShowDetails
{
#if 0
    NSLog(@"Show Details: ");
    
    [self debugShowDetails: @""];
#endif
}

- (void) debugShowDetails: (NSString*) indent
{
#if 0
    NSLog(@"%@ details:", self.identifier);

    for (ModelNodeWrapper* detailNode in self.detailNodes)
    {
        [detailNode debugShow: [NSString stringWithFormat: @"%@ ", indent]];
    }
#endif
}
        



@end
