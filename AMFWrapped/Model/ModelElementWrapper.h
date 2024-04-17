//
//  ModelElementWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelNodeWrapper.h"

#import "ModelAttributeWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@class ModelMetadataWrapper;
@class ModelMaterialWrapper;

@interface ModelElementWrapper : ModelNodeWrapper

+ (void) initialize;

@property (nonatomic, readonly) NSString* value;

@property (nonatomic, readonly) NSArray<ModelElementWrapper*>* elementNodes;

@property (nonatomic, readonly) NSArray<ModelAttributeWrapper*>* attributeNodes;

@property (nonatomic, readonly) NSArray<ModelNodeWrapper*>* detailNodes;

@property (nonatomic, readonly) NSArray<ModelMetadataWrapper*>* metadataNodes;

@property (nonatomic, readonly) ModelMaterialWrapper* materialNode;

- (void) debugShowDetails;

- (void) debugShowDetails: (NSString*) indent;

@end

NS_ASSUME_NONNULL_END
